/* Activities that have Standards attached and the level the student achieved for that activity (these levels feed into the overall level that is shown in Mastery View) */

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
),
details AS (
    SELECT
        outcomeid,
        description, 
        notation
    FROM
        brightspace_data_sets_[your_schema_id].outcomedetails_10_9_5
),
enrollments AS (
    SELECT
        orgunitid,
        rolename, 
        userid
    FROM
        brightspace_data_sets_[your_schema_id].userenrollments_10_9_5
    WHERE
        rolename IN ('Student', 'Member')
),
tools AS (
    SELECT  
        objecttype,
        objectid,
        outcomeid,
        registryid
    FROM
        brightspace_data_sets_[your_schema_id].outcomealignmenttotoolobject_10_9_5
    WHERE
        objectid IS NOT NULL
),
assessed AS (
    SELECT
        outcomeid,
        registryid,
        explicitlyenteredscalelevelid,
        assesseduserid,
        alignedobjecttype,
		alignedobjectid
    FROM
        brightspace_data_sets_[your_schema_id].outcomesdemonstrations_10_9_5
    WHERE 
        alignedobjecttype IN (1,2,3)
),
quizzes AS (
    SELECT
        qa.attemptid,
        qa.quizid,
        qa.orgunitid,
        qo.quizname
    FROM brightspace_data_sets_[your_schema_id].quizattempts_10_9_5 AS qa
	INNER JOIN brightspace_data_sets_[your_schema_id].quizobjects_10_9_5 AS qo
	    ON qa.quizid = qo.quizid
        AND qa.orgunitid = qo.orgunitid
)

SELECT
    courses.orgunitid AS orgunitid,
    orgunits.code AS coursecode,
    orgunits.name AS coursename,
    details.description AS standard,
    details.notation AS shortcode,
    CASE WHEN tools.objecttype = 1 THEN 'Discussion'
		WHEN tools.objecttype = 2 THEN 'Assignment'
		WHEN tools.objecttype = 3 THEN 'Quiz'
		ELSE 'N/A' 
	END AS activitytype,
	CASE WHEN tools.objecttype = 1 THEN discussions.name 
		WHEN tools.objecttype = 2 THEN assignments.name
		WHEN tools.objecttype = 3 THEN quizzes.quizname
		ELSE 'N/A' 
	END AS activityname,
    COALESCE(levels.name,'Not Evaluated') AS levels,
    users.username,
    users.firstname,
    users.lastname

FROM registries
LEFT JOIN courses
    ON registries.registryid = courses.registryid
LEFT JOIN details
    ON registries.outcomeid = details.outcomeid
LEFT JOIN tools
    ON registries.outcomeid = tools.outcomeid
    AND registries.registryid = tools.registryid
INNER JOIN assessed
    ON registries.outcomeid = assessed.outcomeid
    AND registries.registryid = assessed.registryid
LEFT JOIN brightspace_data_sets_[your_schema_id].outcomesscaleleveldefinition_10_9_5 as levels
    ON assessed.explicitlyenteredscalelevelid = levels.scalelevelid
INNER JOIN brightspace_data_sets_[your_schema_id].organizationalunits_10_9_5 as orgunits
    ON courses.orgunitid = orgunits.orgunitid
INNER JOIN brightspace_data_sets_[your_schema_id].users_10_9_5 as users
    ON assessed.assesseduserid = users.userid
INNER JOIN enrollments
    ON orgunits.orgunitid = enrollments.orgunitid
    AND assessed.assesseduserid = enrollments.userid
LEFT JOIN brightspace_data_sets_[your_schema_id].discussiontopics_10_9_5 as discussions
    ON CAST(assessed.alignedobjectid AS bigint) = discussions.topicid
LEFT JOIN brightspace_data_sets_[your_schema_id].assignmentsummary_10_9_5 as assignments
    ON CAST(assessed.alignedobjectid AS bigint) = assignments.dropboxid
LEFT JOIN quizzes
	ON CAST(assessed.alignedobjectid AS bigint) = quizzes.attemptid
    AND orgunits.orgunitid = quizzes.orgunitid
