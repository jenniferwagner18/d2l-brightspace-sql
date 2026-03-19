/* Recreates Mastery View (i.e. only includes Standards that are aligned to activities with overall level achieved for each student) */

WITH students AS (
    SELECT DISTINCT
        ou.orgunitid,
        ou.code,
        ou.name,
        ou.type,
        courses.registryid,
        registries.outcomeid,
        details.notation,
        details.description,
        enrollments.userid,
        users.username,
        users.firstname,
        users.lastname
    FROM [your_schema_id].outcomesinregistries_10_10_6 AS registries
    JOIN [your_schema_id].outcomessetcourse_10_10_6 AS courses
        ON registries.registryid = courses.registryid
    JOIN [your_schema_id].outcomedetails_10_10_6 AS details
        ON registries.outcomeid = details.outcomeid
    JOIN [your_schema_id].outcomealignmenttotoolobject_10_10_6 AS tools
        ON registries.outcomeid = tools.outcomeid
        AND registries.registryid = tools.registryid
    JOIN [your_schema_id].userenrollments_10_10_6 AS enrollments
        ON courses.orgunitid = enrollments.orgunitid
    JOIN [your_schema_id].organizationalunits_10_10_6 AS ou
        ON courses.orgunitid = ou.orgunitid
    JOIN [your_schema_id].users_10_10_6 AS users
        ON enrollments.userid = users.userid
    WHERE enrollments.rolename = 'Student' /* depends on your org's rolenames */
    /* Optional filters for shortcodes and course IDs:
    AND	details.notation LIKE 'HCM%'
    AND ou.orgunitid IN (12345678, 12345679, 12345670)
    */
),
assessed AS (
	SELECT
		demo.outcomeid,
        demo.assesseduserid,
        demo.explicitlyenteredscalelevelid,
        demo.registryid,
        levels.name,
        ROW_NUMBER() OVER (
            PARTITION BY 
               demo.outcomeid,
                demo.assesseduserid,
                demo.registryid
            ORDER BY demo.assesseddate DESC
        ) AS rn
	FROM [your_schema_id].outcomesdemonstrations_10_10_6 AS demo
    INNER JOIN [your_schema_id].outcomesscaleleveldefinition_10_10_6 as levels
        ON demo.explicitlyenteredscalelevelid = levels.scalelevelid
	WHERE 
		demo.alignedobjecttype = 4
        AND demo.explicitlyenteredscalelevelid IS NOT NULL
),
joined AS (
    SELECT
        students.*,
        assessed.name AS levelname
    FROM students
    LEFT JOIN assessed
        ON students.outcomeid = assessed.outcomeid
        AND students.userid = assessed.assesseduserid
        AND students.registryid = assessed.registryid
        AND assessed.rn = 1
)
SELECT DISTINCT
    orgunitid,
    SUBSTRING(code,1,4) AS semester,
    SUBSTRING(code,6,3) AS subject,
    SUBSTRING(code,10,3) AS coursenum,
    SUBSTRING(code,14,3) AS sectnum,
    code AS coursecode,
    name AS coursename,
    notation AS shortcode,
    description AS standard,
    COALESCE(MAX(levelname) OVER (PARTITION BY orgunitid, outcomeid, userid), 'Not Evaluated') AS levels,
    username,
	lastname,
	firstname
FROM joined

