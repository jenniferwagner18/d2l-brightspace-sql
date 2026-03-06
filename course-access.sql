/* Course access via browser and Pulse app (one row each day that student accesses course per source). 
   Remove both DATE functions and DISTINCT for all Pulse sessions rather than one per day. */

SELECT
    access.orgunitid,
    courses.code,
    courses.name,
    users.username,
    users.firstname,
    users.lastname,
    access.dayaccessed,
    access.source
FROM (
SELECT
    orgunitid,
    userid,
    DATE(CAST(dayaccessed AS timestamp)) AS dayaccessed, /* logged as local org-level timezone */
    'Browser' AS source
FROM
    brightspace_data_sets_[your_schema_id].courseaccess_9_9_3
WHERE 
    dayaccessed IS NOT NULL
UNION
SELECT DISTINCT
    orgunitid,
    userid,
    DATE(CAST(REPLACE(timestamp, ' UTC', '') AS timestamp) AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS dayaccessed, /* logged in UTC; change to own timezone */
    source
FROM
    brightspace_data_sets_[your_schema_id].courseaccesslog_9_9_3
WHERE 
    timestamp IS NOT NULL
) AS access
JOIN brightspace_data_sets_[your_schema_id].organizationalunits_9_9_3 AS courses 
    ON access.orgunitid = courses.orgunitid
JOIN brightspace_data_sets_[your_schema_id].users_9_9_3 AS users    
    ON access.userid = users.userid
WHERE access.orgunitid = 1234567 /* optional filter for specific course */
ORDER BY users.lastname, access.dayaccessed
