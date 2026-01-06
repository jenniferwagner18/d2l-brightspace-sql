/* Criteria levels and scores plus overall score, with instructor feedback for each level (if any), on rubrics for each student */

WITH
  RubricAssessment AS (
    SELECT
      orgunitid,
      rubricid,
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
      score,
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
      RubricAssessment.score AS overallscore,
      RubricAssessCriteria.score AS criterionscore,
      RubricAssessCriteria.feedback,
      RubricAssessCriteria.criterionid,
      RubricCritLevels.description,
      RubricObjCriteria.name AS criterionname,
      RubricObjLevels.name AS criterionlevel,
      RubricObjCriteria.sortorder,
      RubricObjCriteria.groupname,
      RubricObjCriteria.groupsortorder,
      Users.username,
      Users.firstname,
      Users.lastname

FROM RubricAssessment
INNER JOIN RubricAssessCriteria 
    ON RubricAssessment.rubricid = RubricAssessCriteria.rubricid
    AND RubricAssessment.userid = RubricAssessCriteria.userid
INNER JOIN RubricCritLevels
    ON RubricAssessCriteria.criterionid = RubricCritLevels.criterionid
INNER JOIN RubricObjCriteria
    ON RubricCritLevels.criterionid = RubricObjCriteria.criterionid
INNER JOIN RubricObjLevels
    ON RubricAssessCriteria.levelachievedid = RubricObjLevels.levelid
INNER JOIN Users
    ON RubricAssessment.userid = Users.userid
WHERE
    RubricAssessCriteria.score = RubricCritLevels.value
