/* Recreates Mastery View (i.e. only include Standards that are aligned to activities with overall level achieved for each student) */

WITH owners AS (
    SELECT
        ownerid,
        registryid
    FROM 
        brightspace_data_sets_[your_schema_id].outcomeregistryowner_9_9_3
    WHERE 
        isdeleted = FALSE
/* OPTIONAL: Add orgunitids separated by commas (between parentheses) if filtering for certain courses */ 
/*    AND CAST (ownerid as INTEGER) IN (12345678, 12345679, 12345670) */
),
registries AS (
    SELECT
        outcomeid,
        registryid
    FROM
        brightspace_data_sets_[your_schema_id].outcomesinregistries_9_9_3 
    WHERE 
        isdeleted = FALSE
),
details AS (
    SELECT
        outcomeid,
        description, 
        notation, 
        isdeleted
    FROM
        brightspace_data_sets_[your_schema_id].outcomedetails_9_9_3
    WHERE 
        isdeleted = FALSE
/* OPTIONAL: Add LIKE if filtering for certain short codes */
 /*     AND notation LIKE 'HCM%' */
),
enrollments AS (
    SELECT
        orgunitid,
        rolename, 
        userid
    FROM
        brightspace_data_sets_[your_schema_id].userenrollments_9_9_3
    WHERE
        rolename IN ('Student', 'Member')
),
assessed AS (
    SELECT
        outcomeid,
        registryid,
        explicitlyenteredscalelevelid,
        assesseduserid,
        assesseddate,
        isdeleted,
        alignedobjecttype
    FROM
        brightspace_data_sets_[your_schema_id].outcomesdemonstrations_9_9_3
    WHERE 
        isdeleted = FALSE
    AND (alignedobjecttype = 4 OR alignedobjecttype IS NULL)
)
SELECT DISTINCT
    owners.ownerid AS orgunitid,
    orgunits.code AS coursecode,
    details.description AS standard,
    details.notation AS shortcode,
    COALESCE(levels.name,'Not Evaluated') AS levels,
    users.username,
    users.firstname,
    users.lastname
FROM 
    owners
INNER JOIN brightspace_data_sets_[your_schema_id].organizationalunits_9_9_3 as orgunits
    ON CAST (owners.ownerid AS integer) = orgunits.orgunitid
INNER JOIN registries
    ON owners.registryid = registries.registryid 
INNER JOIN details
    ON registries.outcomeid = details.outcomeid
LEFT JOIN enrollments
    ON CAST (owners.ownerid AS integer) = enrollments.orgunitid
LEFT JOIN assessed
    ON registries.outcomeid = assessed.outcomeid 
    AND registries.registryid = assessed.registryid
    AND enrollments.userid = assessed.assesseduserid
LEFT JOIN brightspace_data_sets_[your_schema_id].outcomesscaleleveldefinition_9_9_3 as levels
    ON assessed.explicitlyenteredscalelevelid = levels.scalelevelid
LEFT JOIN brightspace_data_sets_[your_schema_id].users_9_9_3 as users
    ON enrollments.userid = users.userid
ORDER BY owners.ownerid, users.lastname, users.firstname, details.notation
