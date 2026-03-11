/* Record counts of all tables of Brightspace datasets available in Analytics Builder */

SELECT 'accommodations_profile_log' AS table_name, COUNT(*) AS record_count FROM brightspace_data_sets_[your_schema_id].accommodationsprofilelog_10_10_6
UNION ALL
SELECT 'activity_exemptions_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].activityexemptionslog_10_10_6
UNION ALL
SELECT 'activity_feed_comment_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].activityfeedcommentlog_10_10_6
UNION ALL
SELECT 'activity_feed_comment_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].activityfeedcommentobjects_10_10_6
UNION ALL
SELECT 'activity_feed_post_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].activityfeedpostlog_10_10_6
UNION ALL
SELECT 'activity_feed_post_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].activityfeedpostobjects_10_10_6
UNION ALL
SELECT 'announcements', COUNT(*) FROM brightspace_data_sets_[your_schema_id].announcements_10_10_6
UNION ALL
SELECT 'assignment_special_access', COUNT(*) FROM brightspace_data_sets_[your_schema_id].assignmentspecialaccess_10_10_6
UNION ALL
SELECT 'assignment_submission_details', COUNT(*) FROM brightspace_data_sets_[your_schema_id].assignmentsubmissiondetails_10_10_6
UNION ALL
SELECT 'assignment_submissions', COUNT(*) FROM brightspace_data_sets_[your_schema_id].assignmentsubmissions_10_10_6
UNION ALL
SELECT 'assignment_summary', COUNT(*) FROM brightspace_data_sets_[your_schema_id].assignmentsummary_10_10_6
UNION ALL
SELECT 'attendance_registers', COUNT(*) FROM brightspace_data_sets_[your_schema_id].attendanceregisters_10_10_6
UNION ALL
SELECT 'attendance_schemes', COUNT(*) FROM brightspace_data_sets_[your_schema_id].attendanceschemes_10_10_6
UNION ALL
SELECT 'attendance_sessions', COUNT(*) FROM brightspace_data_sets_[your_schema_id].attendancesessions_10_10_6
UNION ALL
SELECT 'attendance_user_sessions', COUNT(*) FROM brightspace_data_sets_[your_schema_id].attendanceusersessions_10_10_6
UNION ALL
SELECT 'attribute_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].attributeobjects_10_10_6
UNION ALL
SELECT 'audio_video_processed', COUNT(*) FROM brightspace_data_sets_[your_schema_id].audiovideoprocessed_10_10_6
UNION ALL
SELECT 'auditor_relationships_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].auditorrelationshipslog_10_10_6
UNION ALL
SELECT 'award_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].awardobjects_10_10_6
UNION ALL
SELECT 'awards_issued', COUNT(*) FROM brightspace_data_sets_[your_schema_id].awardsissued_10_10_6
UNION ALL
SELECT 'brightspace_email_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].brightspaceemaillog_10_10_6
UNION ALL
SELECT 'calendar_events', COUNT(*) FROM brightspace_data_sets_[your_schema_id].calendarevents_10_10_6
UNION ALL
SELECT 'checklist_category_details', COUNT(*) FROM brightspace_data_sets_[your_schema_id].checklistcategorydetails_10_10_6
UNION ALL
SELECT 'checklist_completions', COUNT(*) FROM brightspace_data_sets_[your_schema_id].checklistcompletions_10_10_6
UNION ALL
SELECT 'checklist_item_details', COUNT(*) FROM brightspace_data_sets_[your_schema_id].checklistitemdetails_10_10_6
UNION ALL
SELECT 'checklist_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].checklistobjects_10_10_6
UNION ALL
SELECT 'competency_activities', COUNT(*) FROM brightspace_data_sets_[your_schema_id].competencyactivities_10_10_6
UNION ALL
SELECT 'competency_activity_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].competencyactivitylog_10_10_6
UNION ALL
SELECT 'competency_activity_results', COUNT(*) FROM brightspace_data_sets_[your_schema_id].competencyactivityresults_10_10_6
UNION ALL
SELECT 'competency_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].competencylog_10_10_6
UNION ALL
SELECT 'competency_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].competencyobjects_10_10_6
UNION ALL
SELECT 'competency_structure', COUNT(*) FROM brightspace_data_sets_[your_schema_id].competencystructure_10_10_6
UNION ALL
SELECT 'content_files_properties_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].contentfilespropertieslog_10_10_6
UNION ALL
SELECT 'content_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].contentobjects_10_10_6
UNION ALL
SELECT 'content_publisher_launches', COUNT(*) FROM brightspace_data_sets_[your_schema_id].contentpublisherlaunches_10_10_6
UNION ALL
SELECT 'content_publisher_recipients', COUNT(*) FROM brightspace_data_sets_[your_schema_id].contentpublisherrecipients_10_10_6
UNION ALL
SELECT 'content_special_access', COUNT(*) FROM brightspace_data_sets_[your_schema_id].contentspecialaccess_10_10_6
UNION ALL
SELECT 'content_user_completion', COUNT(*) FROM brightspace_data_sets_[your_schema_id].contentusercompletion_10_10_6
UNION ALL
SELECT 'content_user_progress', COUNT(*) FROM brightspace_data_sets_[your_schema_id].contentuserprogress_10_10_6
UNION ALL
SELECT 'course_access', COUNT(*) FROM brightspace_data_sets_[your_schema_id].courseaccess_10_10_6
UNION ALL
SELECT 'course_access_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].courseaccesslog_10_10_6
UNION ALL
SELECT 'course_awards', COUNT(*) FROM brightspace_data_sets_[your_schema_id].courseawards_10_10_6
UNION ALL
SELECT 'course_copy_logs', COUNT(*) FROM brightspace_data_sets_[your_schema_id].coursecopylogs_10_10_6
UNION ALL
SELECT 'cpd_categories', COUNT(*) FROM brightspace_data_sets_[your_schema_id].cpdcategories_10_10_6
UNION ALL
SELECT 'cpd_job_targets', COUNT(*) FROM brightspace_data_sets_[your_schema_id].cpdjobtargets_10_10_6
UNION ALL
SELECT 'cpd_methods', COUNT(*) FROM brightspace_data_sets_[your_schema_id].cpdmethods_10_10_6
UNION ALL
SELECT 'cpd_question_answers', COUNT(*) FROM brightspace_data_sets_[your_schema_id].cpdquestionanswers_10_10_6
UNION ALL
SELECT 'cpd_questions', COUNT(*) FROM brightspace_data_sets_[your_schema_id].cpdquestions_10_10_6
UNION ALL
SELECT 'cpd_user_records', COUNT(*) FROM brightspace_data_sets_[your_schema_id].cpduserrecords_10_10_6
UNION ALL
SELECT 'cpd_user_targets', COUNT(*) FROM brightspace_data_sets_[your_schema_id].cpdusertargets_10_10_6
UNION ALL
SELECT 'creatorplus_practices_adoption', COUNT(*) FROM brightspace_data_sets_[your_schema_id].creatorpluspracticesadoption_10_10_6
UNION ALL
SELECT 'creatorplus_practices_engagement', COUNT(*) FROM brightspace_data_sets_[your_schema_id].creatorpluspracticesengagement_10_10_6
UNION ALL
SELECT 'discussion_forums', COUNT(*) FROM brightspace_data_sets_[your_schema_id].discussionforums_10_10_6
UNION ALL
SELECT 'discussion_posts', COUNT(*) FROM brightspace_data_sets_[your_schema_id].discussionposts_10_10_6
UNION ALL
SELECT 'discussion_posts_read_status', COUNT(*) FROM brightspace_data_sets_[your_schema_id].discussionpostsreadstatus_10_10_6
UNION ALL
SELECT 'discussion_topic_user_scores', COUNT(*) FROM brightspace_data_sets_[your_schema_id].discussiontopicuserscores_10_10_6
UNION ALL
SELECT 'discussion_topics', COUNT(*) FROM brightspace_data_sets_[your_schema_id].discussiontopics_10_10_6
UNION ALL
SELECT 'enrollments_and_withdrawals', COUNT(*) FROM brightspace_data_sets_[your_schema_id].enrollmentsandwithdrawals_10_10_6
UNION ALL
SELECT 'gradebook_settings', COUNT(*) FROM brightspace_data_sets_[your_schema_id].gradebooksettings_10_10_6
UNION ALL
SELECT 'grade_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].gradeobjects_10_10_6
UNION ALL
SELECT 'grade_objects_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].gradeobjectslog_10_10_6
UNION ALL
SELECT 'grade_results', COUNT(*) FROM brightspace_data_sets_[your_schema_id].graderesults_10_10_6
UNION ALL
SELECT 'grade_scheme_ranges', COUNT(*) FROM brightspace_data_sets_[your_schema_id].gradeschemeranges_10_10_6
UNION ALL
SELECT 'grade_schemes', COUNT(*) FROM brightspace_data_sets_[your_schema_id].gradeschemes_10_10_6
UNION ALL
SELECT 'intelligent_agent_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].intelligentagentobjects_10_10_6
UNION ALL
SELECT 'intelligent_agent_run_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].intelligentagentrunlog_10_10_6
UNION ALL
SELECT 'intelligent_agent_run_users', COUNT(*) FROM brightspace_data_sets_[your_schema_id].intelligentagentrunusers_10_10_6
UNION ALL
SELECT 'jit_provisioned_users_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].jitprovisioneduserslog_10_10_6
UNION ALL
SELECT 'local_authentication_security_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].localauthenticationsecuritylog_10_10_6
UNION ALL
SELECT 'lti_advantage_deployment_audit', COUNT(*) FROM brightspace_data_sets_[your_schema_id].ltiadvantagedeploymentaudit_10_10_6
UNION ALL
SELECT 'lti_advantage_registration_audit', COUNT(*) FROM brightspace_data_sets_[your_schema_id].ltiadvantageregistrationaudit_10_10_6
UNION ALL
SELECT 'lti_launches', COUNT(*) FROM brightspace_data_sets_[your_schema_id].ltilaunches_10_10_6
UNION ALL
SELECT 'lti_link_migration_audit', COUNT(*) FROM brightspace_data_sets_[your_schema_id].ltilinkmigrationaudit_10_10_6
UNION ALL
SELECT 'lti_links', COUNT(*) FROM brightspace_data_sets_[your_schema_id].ltilinks_10_10_6
UNION ALL
SELECT 'media_consumption_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].mediaconsumptionlog_10_10_6
UNION ALL
SELECT 'media_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].mediaobjects_10_10_6
UNION ALL
SELECT 'organizational_unit_ancestors', COUNT(*) FROM brightspace_data_sets_[your_schema_id].organizationalunitancestors_10_10_6
UNION ALL
SELECT 'organizational_unit_descendants', COUNT(*) FROM brightspace_data_sets_[your_schema_id].organizationalunitdescendants_10_10_6
UNION ALL
SELECT 'organizational_unit_parents', COUNT(*) FROM brightspace_data_sets_[your_schema_id].organizationalunitparents_10_10_6
UNION ALL
SELECT 'organizational_unit_recent_access', COUNT(*) FROM brightspace_data_sets_[your_schema_id].organizationalunitrecentaccess_10_10_6
UNION ALL
SELECT 'organizational_units', COUNT(*) FROM brightspace_data_sets_[your_schema_id].organizationalunits_10_10_6
UNION ALL
SELECT 'outcome_details', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomedetails_10_10_6
UNION ALL
SELECT 'outcome_alignment_to_tool_object', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomealignmenttotoolobject_10_10_6
UNION ALL
SELECT 'outcomes_assessed_checkpoints', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomesassessedcheckpoints_10_10_6
UNION ALL
SELECT 'outcomes_course_specific_scales', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomescoursespecificscales_10_10_6
UNION ALL
SELECT 'outcomes_demonstrations', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomesdemonstrations_10_10_6
UNION ALL
SELECT 'outcomes_in_registries', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomesinregistries_10_10_6
UNION ALL
SELECT 'outcomes_rubric_alignments', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomesrubricalignments_10_10_6
UNION ALL
SELECT 'outcomes_scale_definition', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomesscaledefinition_10_10_6
UNION ALL
SELECT 'outcomes_scale_level_definition', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomesscaleleveldefinition_10_10_6
UNION ALL
SELECT 'outcomes_set_course', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomessetcourse_10_10_6
UNION ALL
SELECT 'outcomes_set_org', COUNT(*) FROM brightspace_data_sets_[your_schema_id].outcomessetorg_10_10_6
UNION ALL
SELECT 'portfolio_categories', COUNT(*) FROM brightspace_data_sets_[your_schema_id].portfoliocategories_10_10_6
UNION ALL
SELECT 'portfolio_evidence_categories', COUNT(*) FROM brightspace_data_sets_[your_schema_id].portfolioevidencecategories_10_10_6
UNION ALL
SELECT 'portfolio_evidence_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].portfolioevidencelog_10_10_6
UNION ALL
SELECT 'portfolio_evidence_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].portfolioevidenceobjects_10_10_6
UNION ALL
SELECT 'prerequisite_conditions_met', COUNT(*) FROM brightspace_data_sets_[your_schema_id].prerequisiteconditionsmet_10_10_6
UNION ALL
SELECT 'question_answer_options', COUNT(*) FROM brightspace_data_sets_[your_schema_id].questionansweroptions_10_10_6
UNION ALL
SELECT 'question_answers', COUNT(*) FROM brightspace_data_sets_[your_schema_id].questionanswers_10_10_6
UNION ALL
SELECT 'question_library', COUNT(*) FROM brightspace_data_sets_[your_schema_id].questionlibrary_10_10_6
UNION ALL
SELECT 'question_pools', COUNT(*) FROM brightspace_data_sets_[your_schema_id].questionpools_10_10_6
UNION ALL
SELECT 'question_relationships', COUNT(*) FROM brightspace_data_sets_[your_schema_id].questionrelationships_10_10_6
UNION ALL
SELECT 'quiz_attempts', COUNT(*) FROM brightspace_data_sets_[your_schema_id].quizattempts_10_10_6
UNION ALL
SELECT 'quiz_attempts_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].quizattemptslog_10_10_6
UNION ALL
SELECT 'quiz_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].quizobjects_10_10_6
UNION ALL
SELECT 'quiz_survey_sections', COUNT(*) FROM brightspace_data_sets_[your_schema_id].quizsurveysections_10_10_6
UNION ALL
SELECT 'quiz_user_answer_responses', COUNT(*) FROM brightspace_data_sets_[your_schema_id].quizuseranswerresponses_10_10_6
UNION ALL
SELECT 'quiz_user_answers', COUNT(*) FROM brightspace_data_sets_[your_schema_id].quizuseranswers_10_10_6
UNION ALL
SELECT 'release_condition_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].releaseconditionobjects_10_10_6
UNION ALL
SELECT 'release_condition_results', COUNT(*) FROM brightspace_data_sets_[your_schema_id].releaseconditionresults_10_10_6
UNION ALL
SELECT 'reoffer_course', COUNT(*) FROM brightspace_data_sets_[your_schema_id].reoffercourse_10_10_6
UNION ALL
SELECT 'role_details', COUNT(*) FROM brightspace_data_sets_[your_schema_id].roledetails_10_10_6
UNION ALL
SELECT 'rubric_assessment', COUNT(*) FROM brightspace_data_sets_[your_schema_id].rubricassessment_10_10_6
UNION ALL
SELECT 'rubric_assessment_criteria', COUNT(*) FROM brightspace_data_sets_[your_schema_id].rubricassessmentcriteria_10_10_6
UNION ALL
SELECT 'rubric_criteria_levels', COUNT(*) FROM brightspace_data_sets_[your_schema_id].rubriccriterialevels_10_10_6
UNION ALL
SELECT 'rubric_object_criteria', COUNT(*) FROM brightspace_data_sets_[your_schema_id].rubricobjectcriteria_10_10_6
UNION ALL
SELECT 'rubric_object_levels', COUNT(*) FROM brightspace_data_sets_[your_schema_id].rubricobjectlevels_10_10_6
UNION ALL
SELECT 'rubric_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].rubricobjects_10_10_6
UNION ALL
SELECT 'rubrics_edit', COUNT(*) FROM brightspace_data_sets_[your_schema_id].rubricsedit_10_10_6
UNION ALL
SELECT 'scorm_activities', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scormactivities_10_10_6
UNION ALL
SELECT 'scorm_activity_attempts', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scormactivityattempts_10_10_6
UNION ALL
SELECT 'scorm_interaction_attempts', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scorminteractionattempts_10_10_6
UNION ALL
SELECT 'scorm_interaction_objectives', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scorminteractionobjectives_10_10_6
UNION ALL
SELECT 'scorm_interactions', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scorminteractions_10_10_6
UNION ALL
SELECT 'scorm_objective_attempts', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scormobjectiveattempts_10_10_6
UNION ALL
SELECT 'scorm_objectives', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scormobjectives_10_10_6
UNION ALL
SELECT 'scorm_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scormobjects_10_10_6
UNION ALL
SELECT 'scorm_visits', COUNT(*) FROM brightspace_data_sets_[your_schema_id].scormvisits_10_10_6
UNION ALL
SELECT 'session_history', COUNT(*) FROM brightspace_data_sets_[your_schema_id].sessionhistory_10_10_6
UNION ALL
SELECT 'sis_course_merge_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].siscoursemergelog_10_10_6
UNION ALL
SELECT 'source_course_deploy_history', COUNT(*) FROM brightspace_data_sets_[your_schema_id].sourcecoursedeployhistory_10_10_6
UNION ALL
SELECT 'survey_attempts', COUNT(*) FROM brightspace_data_sets_[your_schema_id].surveyattempts_10_10_6
UNION ALL
SELECT 'survey_objects', COUNT(*) FROM brightspace_data_sets_[your_schema_id].surveyobjects_10_10_6
UNION ALL
SELECT 'survey_user_answer_responses', COUNT(*) FROM brightspace_data_sets_[your_schema_id].surveyuseranswerresponses_10_10_6
UNION ALL
SELECT 'survey_user_answers', COUNT(*) FROM brightspace_data_sets_[your_schema_id].surveyuseranswers_10_10_6
UNION ALL
SELECT 'system_access_log', COUNT(*) FROM brightspace_data_sets_[your_schema_id].systemaccesslog_10_10_6
UNION ALL
SELECT 'system_access_summary', COUNT(*) FROM brightspace_data_sets_[your_schema_id].systemaccesssummary_10_10_6
UNION ALL
SELECT 'tools', COUNT(*) FROM brightspace_data_sets_[your_schema_id].tools_10_10_6
UNION ALL
SELECT 'turnitin_submissions', COUNT(*) FROM brightspace_data_sets_[your_schema_id].turnitinsubmissions_10_10_6
UNION ALL
SELECT 'user_attribute_definitions', COUNT(*) FROM brightspace_data_sets_[your_schema_id].userattributedefinitions_10_10_6
UNION ALL
SELECT 'user_attribute_values', COUNT(*) FROM brightspace_data_sets_[your_schema_id].userattributevalues_10_10_6
UNION ALL
SELECT 'user_enrollments', COUNT(*) FROM brightspace_data_sets_[your_schema_id].userenrollments_10_10_6
UNION ALL
SELECT 'user_logins', COUNT(*) FROM brightspace_data_sets_[your_schema_id].userlogins_10_10_6
UNION ALL
SELECT 'users', COUNT(*) FROM brightspace_data_sets_[your_schema_id].users_10_10_6