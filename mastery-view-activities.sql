/* Activities that have Standards attached and the level the student achieved for that activity 
(these levels feed into the overall level that is shown in Mastery View) */

WITH students AS (
    SELECT DISTINCT
        ou.orgunitid,
        ou.code,
        ou.name AS coursename,
        ou.type AS coursetype,
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
    JOIN [your_schema_id].userenrollments_10_10_6 AS enrollments
        ON courses.orgunitid = enrollments.orgunitid
    JOIN [your_schema_id].organizationalunits_10_10_6 AS ou
        ON courses.orgunitid = ou.orgunitid
    JOIN [your_schema_id].users_10_10_6 AS users
        ON enrollments.userid = users.userid
    WHERE enrollments.rolename = 'Student'
),

alignments AS (
    SELECT
        tools.registryid,
        tools.outcomeid,
        tools.objectid AS aligned_objectid,
        tools.objecttype AS aligned_objecttype
    FROM [your_schema_id].outcomealignmenttotoolobject_10_10_6 AS tools
    WHERE tools.objectid IS NOT NULL
),

assessed AS (
    SELECT
        demo.outcomeid,
        demo.assesseduserid,
        demo.registryid,
        demo.alignedobjectid,
        demo.alignedobjecttype,
        levels.name AS levelname,
        ROW_NUMBER() OVER (
            PARTITION BY demo.outcomeid, demo.assesseduserid, demo.registryid, demo.alignedobjectid, demo.alignedobjecttype
            ORDER BY demo.assesseddate DESC
        ) AS rn
    FROM [your_schema_id].outcomesdemonstrations_10_10_6 AS demo
    INNER JOIN [your_schema_id].outcomesscaleleveldefinition_10_10_6 AS levels
        ON demo.explicitlyenteredscalelevelid = levels.scalelevelid
    WHERE demo.alignedobjecttype IN (1,2,3)
        AND demo.explicitlyenteredscalelevelid IS NOT NULL
),

quizzes AS (
    SELECT
        qa.attemptid,
        qa.quizid,
        qa.orgunitid,
        qo.quizname
    FROM [your_schema_id].quizattempts_10_10_6 AS qa
    INNER JOIN [your_schema_id].quizobjects_10_10_6 AS qo
        ON qa.quizid = qo.quizid
        AND qa.orgunitid = qo.orgunitid
)

SELECT
    s.orgunitid,
    SUBSTRING(s.code,1,4) AS semester,
    SUBSTRING(s.code,6,3) AS subject,
    SUBSTRING(s.code,10,3) AS coursenum,
    SUBSTRING(s.code,14,3) AS sectnum,
    s.code AS coursecode,
    s.coursename,
    s.notation AS shortcode,
    s.description AS standard,
    COALESCE(a.levelname, 'Not Evaluated') AS levels,
    CASE 
        WHEN al.aligned_objecttype = 1 THEN 'Discussion'
        WHEN al.aligned_objecttype = 2 THEN 'Assignment'
        WHEN al.aligned_objecttype = 3 THEN 'Quiz'
    END AS activitytype,
    CASE 
        WHEN al.aligned_objecttype = 1 THEN d.name
        WHEN al.aligned_objecttype = 2 THEN asg.name
        WHEN al.aligned_objecttype = 3 THEN q.quizname
    END AS activityname,
    s.username AS netid,
    s.lastname,
    s.firstname

FROM students s
JOIN alignments al
    ON  s.registryid = al.registryid
    AND s.outcomeid = al.outcomeid

LEFT JOIN assessed a
    ON s.outcomeid = a.outcomeid
    AND s.userid = a.assesseduserid
    AND s.registryid = a.registryid
    AND al.aligned_objectid = a.alignedobjectid
    AND al.aligned_objecttype = a.alignedobjecttype
    AND a.rn = 1

LEFT JOIN [your_schema_id].discussiontopics_10_10_6 AS d
    ON CAST(al.aligned_objectid AS BIGINT) = d.topicid

LEFT JOIN [your_schema_id].assignmentsummary_10_10_6 AS asg
    ON CAST(al.aligned_objectid AS BIGINT) = asg.dropboxid

LEFT JOIN quizzes q
    ON CAST(al.aligned_objectid AS BIGINT) = q.attemptid
    AND s.orgunitid = q.orgunitid

WHERE (al.aligned_objecttype = 1 AND d.isdeleted = FALSE)
    OR (al.aligned_objecttype = 2 AND asg.isdeleted = FALSE)
    OR (al.aligned_objecttype = 3)
