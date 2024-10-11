/* Course access via browser and Pulse app (one row each day that student accesses course per source) */

SELECT
    combined.orgunitid,
    users.username,
    users.firstname,
    users.lastname,
    combined.dayaccessed,
    combined.source
FROM (
SELECT
    orgunitid,
    userid,
    DATE(PARSE_DATETIME(dayaccessed, 'yyyy-MM-dd HH:mm:ss.SSS z')) AS dayaccessed,
    'Browser' AS source
FROM
    brightspace_data_sets_[your_schema_id].courseaccess_9_9_3 AS browser
WHERE 
    dayaccessed IS NOT NULL
UNION
SELECT DISTINCT
    orgunitid,
    userid,
    DATE(PARSE_DATETIME(timestamp, 'yyyy-MM-dd HH:mm:ss.SSS z') AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS dayaccessed,
    source
FROM
    brightspace_data_sets_[your_schema_id].courseaccesslog_9_9_3
WHERE 
    timestamp IS NOT NULL
) AS combined
JOIN brightspace_data_sets_[your_schema_id].users_9_9_3 AS users 
ON combined.userid = users.userid
WHERE combined.orgunitid = 1234567 /* optional filter for specific course */
ORDER BY users.lastname, combined.dayaccessed
