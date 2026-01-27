/* Criteria and overall levels and scores, with instructor feedback for each criterion level (if any), on 
rubrics for each student. Overall written feedback is not logged in the rubric data sets, but rather in the 
feedback or comment fields of the activity or grades data sets. */

WITH
  RubricObj AS (
    SELECT
      orgunitid,
      rubricid,
      name
    FROM
      brightspace_data_sets_[your_schema_id].rubricobjects_10_8_5
    WHERE
      isdeleted = FALSE
  ),
  RubricAssessment AS (
    SELECT
      orgunitid,
      rubricid,
      assessmentid,
      userid,
      score,
      levelachievedid
    FROM
      brightspace_data_sets_[your_schema_id].rubricassessment_10_8_5
  ),
  RubricAssessCriteria AS (
    SELECT
      userid,
      rubricid,
      assessmentid,
      score,
      isscoreoverridden,
      feedback,
      criterionid,
      levelachievedid
    FROM
      brightspace_data_sets_[your_schema_id].rubricassessmentcriteria_10_8_5
  ),
  RubricCritLevels AS (
    SELECT
      criterionid,
      description,
      value,
      levelid
    FROM
      brightspace_data_sets_[your_schema_id].rubriccriterialevels_10_8_5
    WHERE
      isdeleted = FALSE
  ),
  RubricObjCriteria AS (
    SELECT
      criterionid,
      name,
      sortorder,
      groupname,
      groupsortorder
    FROM
      brightspace_data_sets_[your_schema_id].rubricobjectcriteria_10_8_5
    WHERE
      isdeleted = FALSE
  ),
  RubricObjLevels AS (
    SELECT  
      rubricid,
      levelid,
      name,
      description,
      feedback
    FROM
      brightspace_data_sets_[your_schema_id].rubricobjectlevels_10_8_5
  ),
  OverallLevels AS (
    SELECT  
      rubricid,
      levelid,
      name,
      description
    FROM
      brightspace_data_sets_[your_schema_id].rubricobjectlevels_10_8_5
  ),
  Users AS (
    SELECT
      userid,
      username,
      firstname,
      lastname
    FROM
      brightspace_data_sets_[your_schema_id].users_10_8_5
  )
  SELECT DISTINCT
      RubricAssessment.orgunitid,
      RubricAssessment.rubricid,
      RubricObj.name AS rubricname,
      RubricAssessment.score AS overallscore,
      OverallLevels.name AS overalllevel,
      OverallLevels.description AS overalldescription,
      RubricAssessCriteria.score AS criterionscore,
      RubricAssessCriteria.isscoreoverridden AS scoreoverride,
      RubricAssessCriteria.feedback AS criterionfeedback,
      RubricAssessCriteria.criterionid,
      RubricCritLevels.description AS criteriondescription,
      RubricObjCriteria.name AS criterionname,
      RubricObjLevels.name AS criterionlevel,
      RubricObjCriteria.sortorder,
      RubricObjCriteria.groupname,
      RubricObjCriteria.groupsortorder,
      Users.username,
      Users.firstname,
      Users.lastname

FROM RubricObj
INNER JOIN RubricAssessment
    ON RubricAssessment.rubricid = RubricObj.rubricid
    AND RubricAssessment.orgunitid = RubricObj.orgunitid
INNER JOIN RubricAssessCriteria 
    ON RubricAssessment.rubricid = RubricAssessCriteria.rubricid
    AND RubricAssessment.assessmentid = RubricAssessCriteria.assessmentid
INNER JOIN RubricCritLevels
    ON RubricAssessCriteria.criterionid = RubricCritLevels.criterionid
    AND RubricAssessCriteria.levelachievedid = RubricCritLevels.levelid
INNER JOIN RubricObjCriteria
    ON RubricCritLevels.criterionid = RubricObjCriteria.criterionid
INNER JOIN RubricObjLevels
    ON RubricAssessCriteria.levelachievedid = RubricObjLevels.levelid
INNER JOIN OverallLevels
    ON RubricObjLevels.rubricid = OverallLevels.rubricid
    AND RubricAssessment.levelachievedid = OverallLevels.levelid
INNER JOIN Users
    ON RubricAssessment.userid = Users.userid
