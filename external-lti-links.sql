/* Visible External LTI Links in active courses with semesters and departments (count and group by done in Analytics Builder analysis) */

WITH ancestors AS (
    SELECT 
        a.orgunitid,
        a.ancestororgunitid,
        org.name AS ancestor_name,
        org.type AS ancestor_type
    FROM 
        brightspace_data_sets_[your_schema_id].organizationalunitancestors_9_9_3 AS a
    LEFT JOIN 
        brightspace_data_sets_[your_schema_id].organizationalunits_9_9_3 AS org
        ON a.ancestororgunitid = org.orgunitid
    WHERE 
        org.type = 'Department'
),
orgunits AS(
SELECT
    orgunitid,
    type,
    name,
    SUBSTR(code, 1, 4) AS semester, /* if code begins with semester abbreviations */
    code,
    isactive
FROM
    brightspace_data_sets_[your_schema_id].organizationalunits_9_9_3
WHERE
    type = 'Course Offering'
    AND isactive = TRUE
),
ltilinks AS (
SELECT  
    orgunitid,
    url,
    CASE 
/* Add as many as needed in the same format, based on keywords in URLs */
when url like '%playposit%' then 'Playposit'
when url like '%kaf%' then 'Mediaspace'
when url like '%cengage%' then 'Cengage'
when url like '%norton%' then 'Norton'
when url like '%pearson%' then 'Pearson'
when url like '%zoom%' then 'Zoom'
when url like '%packback%' then 'Packback'
when url like '%perusall%' then 'Perusall'
else 'Other Tools'
 End AS tool,
    isvisible,
    isdeleted
FROM 
    brightspace_data_sets_[your_schema_id].ltilinks_9_9_3
WHERE
    isvisible = TRUE
    AND isdeleted = FALSE
)
SELECT
    orgunits.semester,
    ancestors.ancestor_name AS department,
    orgunits.orgunitid,
    orgunits.code,
    ltilinks.tool,
    ltilinks.url
FROM
    orgunits
INNER JOIN 
    ancestors
    ON orgunits.orgunitid = ancestors.orgunitid
INNER JOIN 
    ltilinks
    ON orgunits.orgunitid = ltilinks.orgunitid
ORDER BY orgunits.code
