/* Recreates Mastery View (i.e. only includes Standards that are aligned to activities with overall level achieved for each student) */

WITH registries AS (
    SELECT
        outcomeid,
        registryid
    FROM
        brightspace_data_sets_[your_schema_id].outcomesinregistries_10_9_5
),
courses AS (
    SELECT
        orgunitid,
        registryid
    FROM 
        brightspace_data_sets_[your_schema_id].outcomessetcourse_10_9_5
/* OPTIONAL: Add orgunitids separated by commas (between parentheses) if filtering for certain courses: */ 
/*    WHERE orgunitid IN (12345678, 12345679, 12345670) */
),
details AS (
    SELECT
        outcomeid,
        description, 
        notation
    FROM
        brightspace_data_sets_[your_schema_id].outcomedetails_10_9_5
/* OPTIONAL: Add LIKE statements if filtering for certain short codes: */
 /*     WHERE notation LIKE 'HCM%' */
),
enrollments AS (
    SELECT
        orgunitid,
        rolename, 
        userid
    FROM
        brightspace_data_sets_[your_schema_id].userenrollments_10_9_5
    WHERE
        rolename IN ('Student', 'Member') /* filter out Demo Student; depends on your institution's roles; e.g. rolename = 'Learner' */
),
tools AS (
    SELECT  
        objecttype,
        objectid,
        outcomeid,
        registryid
    FROM
        brightspace_data_sets_[your_schema_id].outcomealignmenttotoolobject_10_9_5
),
assessed AS (
    SELECT
        outcomeid,
        registryid,
        explicitlyenteredscalelevelid,
        assesseduserid,
        alignedobjecttype
    FROM
        brightspace_data_sets_[your_schema_id].outcomesdemonstrations_10_9_5
    WHERE 
        alignedobjecttype = 4
)
SELECT DISTINCT
    courses.orgunitid,
    orgunits.code AS coursecode,
    orgunits.name AS coursename,
    details.description AS standard,
    details.notation AS shortcode,
    COALESCE(levels.name,'Not Evaluated') AS levels,
    users.username,
    users.firstname,
    users.lastname
FROM registries
LEFT JOIN courses
    ON registries.registryid = courses.registryid
INNER JOIN details
    ON registries.outcomeid = details.outcomeid
INNER JOIN brightspace_data_sets_[your_schema_id].organizationalunits_10_9_5 as orgunits
    ON courses.orgunitid = orgunits.orgunitid
INNER JOIN enrollments
    ON orgunits.orgunitid = enrollments.orgunitid 
INNER JOIN brightspace_data_sets_[your_schema_id].users_10_9_5 as users
    ON enrollments.userid  = users.userid
INNER JOIN tools
    ON registries.outcomeid = tools.outcomeid
    AND registries.registryid = tools.registryid
LEFT JOIN assessed
    ON registries.outcomeid = assessed.outcomeid
    AND registries.registryid = assessed.registryid
    AND assessed.assesseduserid = users.userid
LEFT JOIN brightspace_data_sets_[your_schema_id].outcomesscaleleveldefinition_10_9_5 as levels
    ON assessed.explicitlyenteredscalelevelid = levels.scalelevelid

