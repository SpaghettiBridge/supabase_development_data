drop view if exists "public"."contextualoverview_view";

drop view if exists "public"."get_admission_detail";

drop view if exists "public"."get_admission_detail_for_report";

drop view if exists "public"."get_all_activities";

drop view if exists "public"."get_all_admission_history";

drop view if exists "public"."get_all_referrals";

drop view if exists "public"."get_all_student_profiles";

drop view if exists "public"."get_ilp_report_ehcp";

drop view if exists "public"."get_ilp_report_pillar";

drop view if exists "public"."get_risk_data";

drop view if exists "public"."getallstudents";

drop view if exists "public"."getselectedstudent";

drop view if exists "public"."getservices";

drop view if exists "public"."rep_get_curr_map_data";

drop view if exists "public"."statushistory";

drop view if exists "public"."view_merge_test_services";

drop view if exists "public"."vw_all_tickets";

alter table "public"."services" alter column "new_col" set data type boolean using "new_col"::boolean;

set check_function_bodies = off;

create or replace view "public"."contextualoverview_view" as  SELECT co.referral_id,
    ch.child_name,
    s.service_name,
    co.risk_score,
    co.created_at
   FROM (((contextual_overview co
     JOIN referrals r ON ((co.referral_id = r.id)))
     JOIN children ch ON ((r.child_id = ch.id)))
     JOIN services s ON ((co.service_id = s.id)));


create or replace view "public"."get_admission_detail" as  SELECT rh.pk_referral_header_id,
    rh.fk_service_id,
    rh.fk_child_id,
    rh.fk_status_id,
    rh.fk_organisation_id,
    rh.display_child,
    rh.date_referral,
    rh.source,
    rh.assess,
    rh.placement_offered,
    rh.barrier_to_placement,
    rh.diagnosis,
    rh.probablity_rating,
    rh.source_location,
    rh.proposed_start,
    rh.link,
    rh.status AS header_status,
    rh.date_created,
    rh.source_address_zip,
    rh.source_address_country,
    rh.la_closed,
    rh.closed_reason,
    rh.closed_summary,
    rh.is_stage_recommended,
    rh.entry_status,
    rh.fk_caring_authority_id,
    rh.current_school,
    rh.new_or_existing,
    rh.document_link,
    rh.all_days_count,
    rh.other_services,
    rh.send_officer,
    referral_details.fk_referral_header_id,
    referral_details.views_education_school,
    referral_details.previous_education_setting,
    referral_details.placement_reason,
    referral_details.need_prior,
    referral_details.primary_diagnosis,
    referral_details.other_diagnoses,
    referral_details.undiagnosed_presentations,
    referral_details.previous_support,
    referral_details.care_needs,
    referral_details.health_needs,
    referral_details.placement_risk,
    referral_details.summary_risk,
    referral_details.criminal_convictions,
    referral_details.outcomes_antisocial_behaviour,
    referral_details.current_sg_status,
    referral_details.previous_sg_status,
    referral_details.attendance_summary,
    referral_details.youth_offending_team,
    referral_details.days_per_week,
    referral_details.social_worker_assigned,
    referral_details.family_support_assigned,
    referral_details.residence,
    referral_details.sg_reports_requested,
    referral_details.cognition_learning_needs,
    referral_details.comm_interaction_needs,
    referral_details.sensory_physical_needs,
    referral_details.semh_needs,
    referral_details.adverse_childhood_experiences,
    referral_details.hours_per_week,
    referral_details.date_consent,
    referral_details.consent_contact_school,
    referral_details.is_age_related_level,
    referral_details.is_parents_carers_contacted,
    referral_details.is_previous_placement_contacted,
    referral_details.is_meeting_with_cyp,
    referral_details.is_aware_cyp,
    referral_details.is_placement_available,
    referral_details.is_placement_incompatible,
    referral_details.is_placement_suitable,
    referral_details.who_spoken,
    referral_details.consult_deadline,
    referral_details.year_group,
    referral_details.discussed_with,
    referral_details.needs_safeguarding_followup,
    referral_details.education_needs,
    referral_details.previous_education_setting_name,
    referral_details.response_type,
    referral_details.school_home_visit_notes,
    referral_details.student_voice,
    referral_details.summary_of_need,
    referral_details.primary_need,
    referral_details.provision_cost_notes,
    referral_details.summary_of_information,
    referral_details.summary_education,
    referral_details.summary_current_family,
    referral_details.summary_diagnosis,
    referral_details.summary_current_provider,
    referral_details.summary_peer_integration,
    referral_details.summary_communication,
    referral_details.summary_environment,
    referral_details.summary_needs_skills,
    referral_details.summary_professionals,
    referral_details.summary_general,
    referral_details.summary_placement,
    referral_details.summary_support_reqs,
    referral_details.checklist,
    referral_details.date_completion,
    referral_details.cyp_needs_met,
    referral_details.cyp_needs_not_met,
    referral_details.pk_referral_details_id,
    referral_details.other_areas_of_need,
    referral_details.offer_signed,
    referral_details.offer_returned,
    referral_details.ipa_received,
    referral_details.ipa_signed,
    referral_details.ipa_returned,
    referral_details.framework,
    referral_details.offer_made,
    referral_details.la_paperwork_complete,
    referral_details.outside_core,
    referral_details.transition_notes,
    referral_details.safeguarding_notes,
    services.id,
    services.service_name,
    lu_ref_status.sequence AS current_sequence,
    lu_ref_status.status AS current_status,
    lu_ref_stage.stage AS stage_name,
    children.child_name,
    children.name_first,
    children.name_last,
    children.name_preferred,
    children.date_of_birth,
    children.age,
    children.sex,
    children.diagnosis AS child_diagnosis,
    children.interests,
    children.date_start,
    children.date_end,
    children.current_home_address,
    children.current_home_address_street1,
    children.current_home_address_street2,
    children.current_home_address_city,
    children.current_home_address_state,
    children.current_home_address_country,
    children.current_home_address_zip,
    children.last_school_attended,
    care_org.organisation_name AS caring_authority
   FROM (((((((referral_header rh
     JOIN referral_details ON ((referral_details.fk_referral_header_id = rh.pk_referral_header_id)))
     JOIN services ON ((services.id = rh.fk_service_id)))
     JOIN lu_ref_stage ON ((lu_ref_stage.id = rh.fk_stage_id)))
     JOIN lu_ref_status ON ((lu_ref_status.id = rh.fk_status_id)))
     JOIN children ON ((children.id = rh.fk_child_id)))
     LEFT JOIN organisations ON ((organisations.id = rh.fk_organisation_id)))
     LEFT JOIN organisations care_org ON ((care_org.id = rh.fk_caring_authority_id)));


create or replace view "public"."get_admission_detail_for_report" as  SELECT rh.pk_referral_header_id,
    rh.fk_service_id,
    rh.fk_child_id,
    rh.fk_status_id,
    rh.fk_organisation_id,
    rh.display_child,
    rh.date_referral,
    rh.source,
    rh.assess,
    rh.placement_offered,
    rh.barrier_to_placement,
    rh.diagnosis,
    rh.probablity_rating,
    rh.source_location,
    rh.proposed_start,
    rh.link,
    rh.status AS header_status,
    rh.date_created,
    rh.source_address_zip,
    rh.source_address_country,
    rh.la_closed,
    rh.closed_reason,
    rh.closed_summary,
    rh.is_stage_recommended,
    rh.entry_status,
    rh.fk_caring_authority_id,
    rh.current_school,
    rh.new_or_existing,
    rh.document_link,
    rh.all_days_count,
    rh.other_services,
    rh.send_officer,
    referral_details.fk_referral_header_id,
    referral_details.views_education_school,
    referral_details.previous_education_setting,
    referral_details.placement_reason,
    referral_details.need_prior,
    referral_details.primary_diagnosis,
    referral_details.other_diagnoses,
    referral_details.undiagnosed_presentations,
    referral_details.previous_support,
    referral_details.care_needs,
    referral_details.health_needs,
    referral_details.placement_risk,
    referral_details.summary_risk,
    referral_details.criminal_convictions,
    referral_details.outcomes_antisocial_behaviour,
    referral_details.current_sg_status,
    referral_details.previous_sg_status,
    referral_details.attendance_summary,
    referral_details.youth_offending_team,
    referral_details.days_per_week,
    referral_details.social_worker_assigned,
    referral_details.family_support_assigned,
    referral_details.residence,
    referral_details.sg_reports_requested,
    referral_details.cognition_learning_needs,
    referral_details.comm_interaction_needs,
    referral_details.sensory_physical_needs,
    referral_details.semh_needs,
    referral_details.adverse_childhood_experiences,
    referral_details.hours_per_week,
    referral_details.date_consent,
    referral_details.consent_contact_school,
    referral_details.is_age_related_level,
    referral_details.is_parents_carers_contacted,
    referral_details.is_previous_placement_contacted,
    referral_details.is_meeting_with_cyp,
    referral_details.is_aware_cyp,
    referral_details.is_placement_available,
    referral_details.is_placement_incompatible,
    referral_details.is_placement_suitable,
    referral_details.who_spoken,
    referral_details.consult_deadline,
    referral_details.year_group,
    referral_details.discussed_with,
    referral_details.needs_safeguarding_followup,
    referral_details.education_needs,
    referral_details.previous_education_setting_name,
    referral_details.response_type,
    referral_details.school_home_visit_notes,
    referral_details.student_voice,
    referral_details.summary_of_need,
    referral_details.primary_need,
    referral_details.provision_cost_notes,
    referral_details.summary_of_information,
    referral_details.summary_education,
    referral_details.summary_current_family,
    referral_details.summary_diagnosis,
    referral_details.summary_current_provider,
    referral_details.summary_peer_integration,
    referral_details.summary_communication,
    referral_details.summary_environment,
    referral_details.summary_needs_skills,
    referral_details.summary_professionals,
    referral_details.summary_general,
    referral_details.summary_placement,
    referral_details.summary_support_reqs,
    referral_details.checklist,
    referral_details.date_completion,
    referral_details.cyp_needs_met,
    referral_details.cyp_needs_not_met,
    referral_details.pk_referral_details_id,
    referral_details.other_areas_of_need,
    referral_details.offer_signed,
    referral_details.offer_returned,
    referral_details.ipa_received,
    referral_details.ipa_signed,
    referral_details.ipa_returned,
    referral_details.framework,
    referral_details.offer_made,
    referral_details.la_paperwork_complete,
    referral_details.outside_core,
    services.id,
    services.service_name,
    lu_ref_status.sequence AS current_sequence,
    lu_ref_status.status AS current_status,
    lu_ref_stage.stage AS stage_name,
    children.child_name,
    children.name_first,
    children.name_last,
    children.name_preferred,
    children.date_of_birth,
    children.age,
    children.sex,
    children.diagnosis AS child_diagnosis,
    children.interests,
    children.date_start,
    children.date_end,
    children.current_home_address,
    children.current_home_address_street1,
    children.current_home_address_street2,
    children.current_home_address_city,
    children.current_home_address_state,
    children.current_home_address_country,
    children.current_home_address_zip,
    children.last_school_attended,
    care_org.organisation_name AS caring_authority,
    contacts.contact_name,
    contacts.address
   FROM (((((((((referral_header rh
     JOIN referral_details ON ((referral_details.fk_referral_header_id = rh.pk_referral_header_id)))
     JOIN services ON ((services.id = rh.fk_service_id)))
     JOIN lu_ref_stage ON ((lu_ref_stage.id = rh.fk_stage_id)))
     JOIN lu_ref_status ON ((lu_ref_status.id = rh.fk_status_id)))
     JOIN children ON ((children.id = rh.fk_child_id)))
     LEFT JOIN join_child_contacts jcc ON (((jcc.child_id = children.id) AND (jcc.lives_with_this_contact = true))))
     LEFT JOIN contacts ON ((contacts.id = jcc.contact_id)))
     LEFT JOIN organisations ON ((organisations.id = rh.fk_organisation_id)))
     LEFT JOIN organisations care_org ON ((care_org.id = rh.fk_caring_authority_id)));


create or replace view "public"."get_all_activities" as  SELECT a.id AS activity_id,
    a.record_type,
    a.entry_id,
    a.date,
    a.details,
    a.is_confidential,
    a.is_child_on_child,
    a.is_esafety,
    a.count_notifications,
    a.count_actions,
    a.count_reviews,
    a.count_risks,
    a.count_interventions,
    a.updated_at,
    a.updated_account_id,
    a.linked_record_id,
    a.academic_year_id,
    a.record_type_number,
    a.created_by,
    a.status,
    a.is_subject,
    a.is_object,
    a.object_info,
    a."time",
    a.duration,
    a."where",
    a.location,
    a.involvement,
    a.antecedent_category,
    a.antecedent_sub_category,
    a.antecedent_more,
    a.category,
    a.sub_category,
    a.trigger,
    a.trigger_more,
    a.need_category,
    a.need_sub_category,
    a.need_more,
    a.function_category,
    a.function_more,
    a.emergent_behaviours,
    a.emergent_behaviours_more,
    a.strategies,
    a.strategies_more,
    a.primary_area_of_need,
    a.is_disruption,
    a.disruption_category,
    a.disruption_more,
    a.is_harm_caused,
    a.is_student_injured,
    a.student_injured_who,
    a.is_staff_injured,
    a.staff_injured_who,
    a.is_guided_pi,
    a.is_restrictive_pi,
    a.engagement,
    a.support,
    s.service_name,
    ac.name AS activty_creator,
    st.name_full AS student
   FROM (((activities a
     LEFT JOIN services s ON ((a.service_id = s.id)))
     LEFT JOIN accounts ac ON ((ac.id = a.account_id)))
     LEFT JOIN students st ON ((st.id = a.student_id)));


create or replace view "public"."get_all_admission_history" as  SELECT services.service_name,
    rh.fk_service_id,
    rh.display_child,
    rh.entry_status,
    rh.status,
    rh.fk_status_id,
    rsh.id,
    rsh.fk_referral_header_id,
    rsh.created_at AS stage_date,
    rsh.fk_account_id AS account_id,
    rsh.days_at_stage,
    olrs.display_name AS old_status,
    olrs.id AS old_status_id,
    olrs.sequence AS old_sequence,
    olsg.stage AS old_stage,
    nlrs.display_name AS new_status,
    nlrs.id AS new_status_id,
    nlrs.sequence AS new_sequence,
    nlsg.stage AS new_stage,
    children.child_name,
    rh.all_days_count
   FROM ((((((((referral_status_history rsh
     JOIN referral_header rh ON ((rh.pk_referral_header_id = rsh.fk_referral_header_id)))
     JOIN children ON ((children.id = rh.fk_child_id)))
     JOIN lu_ref_stage olsg ON ((olsg.id = rsh.fk_old_stage_id)))
     JOIN lu_ref_stage nlsg ON ((nlsg.id = rsh.fk_new_stage_id)))
     JOIN lu_ref_status olrs ON ((olrs.stage_id = rsh.fk_old_stage_id)))
     JOIN lu_ref_status nlrs ON ((nlrs.stage_id = rsh.fk_new_stage_id)))
     JOIN services ON ((services.id = rh.fk_service_id)))
     JOIN accounts ON ((accounts.id = rsh.fk_account_id)));


create or replace view "public"."get_all_referrals" as  SELECT children.id AS child_id,
    referral_header.pk_referral_header_id AS referral_id,
    children.child_name,
    referral_header.display_child,
    referral_header.fk_status_id AS status_id,
    lu_ref_status.display_name AS status_name,
    lu_ref_status.status,
    referral_header.fk_service_id,
    referral_header.other_services,
    referral_header.fk_stage_id AS stage_id,
    referral_header.is_stage_recommended,
    referral_header.date_referral,
    referral_header.current_school,
    referral_header.entry_status,
    referral_header.all_days_count,
    lu_ref_stage.stage,
    lu_ref_status.display_name,
    services.service_name,
    services.initials,
    placing_org.organisation_name AS placing_auth,
    caring_org.organisation_name AS caring_auth
   FROM ((((((referral_header
     JOIN children ON (((children.id = referral_header.fk_child_id) AND (children.child_name <> ''::text))))
     JOIN services ON ((services.id = referral_header.fk_service_id)))
     JOIN lu_ref_stage ON ((lu_ref_stage.id = referral_header.fk_stage_id)))
     JOIN lu_ref_status ON ((lu_ref_status.id = referral_header.fk_status_id)))
     LEFT JOIN organisations placing_org ON ((placing_org.id = referral_header.fk_organisation_id)))
     LEFT JOIN organisations caring_org ON ((caring_org.id = referral_header.fk_caring_authority_id)))
  WHERE (referral_header.is_deleted <> true);


create or replace view "public"."get_all_student_profiles" as  SELECT students.id,
    students.display_student_name,
    students.name_first,
    students.name_last,
    students.name_preferred,
    students.group_id,
    student_admissions.date_of_birth,
    student_admissions.age,
    student_admissions.sex,
    student_admissions.gender_identity,
    student_admissions.status,
    student_admissions.current_home_address,
    services.id AS service_id,
    services.service_name,
    base_groups.name AS base_group_name
   FROM (((students
     JOIN student_admissions ON (((student_admissions.student_id = students.id) AND (student_admissions.service_id = students.service_id))))
     JOIN services ON ((services.id = students.service_id)))
     LEFT JOIN base_groups ON (((base_groups.service_id = students.service_id) AND (base_groups.id = students.group_id))));


create or replace view "public"."get_ilp_report_ehcp" as  SELECT sm.milestone,
    sm.status,
    sm.id AS milestone_id,
    st.student_id,
    st.display_target,
    st.id AS target_id,
    lec.category,
    lec.name AS areaofneed,
    jti.ilp_header_id AS join_target_ilps_id,
    sta.target_completed AS target_assessment,
    sma.milestone_completed AS assessment,
    sma.evidence AS milestone_evidence,
    sno.description AS outcome,
    sma.id AS sma_id,
    students.name_full AS student_name,
    students.service_id,
    cmh.display_name,
    services.service_name
   FROM ((((((((((student_targets st
     JOIN join_target_ilps jti ON ((jti.target_id = st.id)))
     JOIN lu_ehcp_categories lec ON ((lec.id = st.ehcp_category_id)))
     JOIN students ON ((students.id = st.student_id)))
     JOIN student_target_assessments sta ON ((sta.fk_target_id = st.id)))
     JOIN student_ilp_header sih ON ((sih.id = jti.ilp_header_id)))
     JOIN curr_map_header cmh ON ((cmh.id = sih.curr_map_header_id)))
     LEFT JOIN student_needsoutcomes sno ON (((sno.student_id = st.student_id) AND (sno.id = st.needsoutcomes_id))))
     LEFT JOIN student_milestones sm ON ((st.id = sm.target_id)))
     JOIN student_milestone_assessments sma ON ((sma.milestone_id = sm.id)))
     JOIN services ON ((services.id = students.service_id)))
  WHERE ((sm.status = 'Active'::text) OR (sm.status IS NULL));


create or replace view "public"."get_ilp_report_pillar" as  SELECT sm.milestone,
    sm.status,
    sm.id AS milestone_id,
    st.student_id,
    st.display_target,
    st.id AS target_id,
    lptc.category,
    lpsc.subject,
    ltop.topic,
    lpc.pillar,
    jti.ilp_header_id AS join_target_ilps_id,
    sta.target_completed AS target_assessment,
    sma.evidence AS milestone_evidence,
    sma.milestone_completed AS milestone_assessment,
    sma.id AS sma_id,
    spl.level,
    students.name_full AS student_name,
    students.service_id,
    services.service_name,
    cmh.display_name
   FROM ((((((((((((((student_targets st
     JOIN lu_pillar_target_cache lptc ON ((lptc.id = st.target_cache_id)))
     JOIN lu_pillar_topic_cache ltop ON ((ltop.id = lptc.topic_id)))
     LEFT JOIN lu_pillar_subject_cache lpsc ON ((lpsc.id = ltop.subject_id)))
     JOIN lu_pillar_cache lpc ON ((lpc.id = ltop.pillar_id)))
     JOIN join_target_ilps jti ON ((jti.target_id = st.id)))
     JOIN student_ilp_header sih ON ((sih.id = jti.ilp_header_id)))
     JOIN curr_map_header cmh ON ((cmh.id = sih.curr_map_header_id)))
     JOIN student_target_assessments sta ON ((sta.fk_target_id = st.id)))
     JOIN students ON ((students.id = st.student_id)))
     JOIN services ON ((services.id = students.service_id)))
     LEFT JOIN student_needsoutcomes sno ON (((sno.student_id = st.student_id) AND (sno.id = st.needsoutcomes_id))))
     LEFT JOIN student_milestones sm ON ((st.id = sm.target_id)))
     LEFT JOIN student_milestone_assessments sma ON ((sma.milestone_id = sm.id)))
     LEFT JOIN student_pillar_levels spl ON (((spl.student_id = st.student_id) AND (spl.subject_id = lptc.subject_id) AND (spl.pillar_id = lptc.pillar_id))))
  WHERE ((sm.status = 'Active'::text) OR (sm.status IS NULL));


create or replace view "public"."get_risk_data" as  SELECT rm_risks.pk_risk_id,
    rm_risks.title,
    rm_risks.entry_id,
    rm_risks.fk_service_id,
    rm_risks.fk_created_by,
    rm_risks.fk_risk_owner,
    rm_risks.area,
    rm_risks.description,
    rm_risks.risk_type,
    rm_risks.risk_rating,
    rm_risks.control_measure,
    rm_risks.status AS risk_status,
    rm_risks.created_at,
    rm_risks.last_review_date,
    ro.name AS risk_owner_name,
    rc.name AS risk_creator_name,
    "substring"(rm_risks.description, 1, 60) AS tinydesc,
    "substring"(rm_risks.description, 1, 200) AS shortdesc,
    "substring"(rm_risks.control_measure, 1, 200) AS shortcontrol,
    services.service_name
   FROM (((rm_risks
     JOIN accounts ro ON ((ro.id = rm_risks.fk_risk_owner)))
     JOIN accounts rc ON ((rc.id = rm_risks.fk_created_by)))
     JOIN services ON ((services.id = rm_risks.fk_service_id)));


create or replace view "public"."getallstudents" as  SELECT students.id,
    students.display_student_name,
    students.name_first,
    students.name_last,
    students.name_preferred,
    student_admissions.date_of_birth,
    student_admissions.age,
    student_admissions.sex,
    student_admissions.gender_identity,
    student_admissions.status,
    student_admissions.current_home_address,
    services.id AS service_id,
    services.service_name,
    base_groups.name
   FROM (((students
     JOIN student_admissions ON (((student_admissions.student_id = students.id) AND (student_admissions.service_id = students.service_id))))
     JOIN services ON ((services.id = students.service_id)))
     LEFT JOIN base_groups ON (((base_groups.service_id = students.service_id) AND (base_groups.id = students.group_id))));


create or replace view "public"."getselectedstudent" as  SELECT students.id AS student_id,
    students.name_full,
    students.name_first,
    students.name_last,
    students.name_preferred,
    students.display_student_name,
    students.has_ap,
    students.ap_type,
    students.has_isp,
    students.is_lac,
    students.has_cpp,
    students.is_cin,
    students.has_taf,
    students.group_id,
    students.context,
    student_admissions.start_date,
    student_admissions.local_authority_id,
    student_admissions.end_date,
    student_admissions.date_of_birth,
    student_admissions.age,
    student_admissions.sex,
    student_admissions.gender_identity,
    student_admissions.status,
    student_admissions.uln_uci,
    student_admissions.nationality,
    student_admissions.ethnicity,
    student_admissions.religion,
    student_admissions.last_school_attended,
    student_admissions.current_home_address,
    student_admissions.current_home_address_street1,
    student_admissions.current_home_address_street2,
    student_admissions.current_home_address_city,
    student_admissions.current_home_address_state,
    student_admissions.current_home_address_zip,
    student_admissions.previous_home_address,
    student_admissions.previous_home_address_street1,
    student_admissions.previous_home_address_street2,
    student_admissions.previous_home_address_city,
    student_admissions.previous_home_address_state,
    student_admissions.previous_home_address_zip,
    student_admissions.destination,
    student_admissions.diagnosis,
    student_admissions.previous_placement_info,
    services.service_name,
    services.id AS service_id
   FROM ((students
     JOIN student_admissions ON ((student_admissions.student_id = students.id)))
     JOIN services ON ((services.id = students.service_id)));


create or replace view "public"."getservices" as  SELECT accounts.id AS account_id,
    accounts.name,
    accounts.name_first,
    accounts.name_last,
    accounts.email,
    jas.service_id,
    jas.service_name,
    services.status
   FROM ((accounts
     JOIN join_account_services jas ON ((accounts.id = jas.account_id)))
     JOIN services ON ((services.id = jas.service_id)));


create or replace view "public"."rep_get_curr_map_data" as  SELECT cmh.id,
    cmh.service_id,
    cmh.academic_year_id,
    cmh.term_id,
    cmh.year_number,
    cmh.yearly_theme,
    cmh.termly_theme,
    cmh.safeguarding_theme,
    cmh.pshe_theme,
    cmh.fbv_theme,
    cmh.real_world_focus,
    cmh.driving_question,
    cmh.community_impact,
    cmh.display_name,
    lup.display_name AS phase_name,
    cmp.phase_id,
    cmtop.topic_id,
    lup.name,
    lup.phase,
    lup.status,
    lup.sorting,
    lptc.pillar,
    lptc.cache_type,
    lptc.subject,
    lptc.topic,
    lptc.pillar_id,
    lptc.subject_id,
    lut.year_group,
    lut.term,
    lut.pshe_topics,
    lut.title,
    lut.author,
    lut.published_year,
    lut.contextual_year,
    lut.genre,
    lut.summary AS textsummary,
    ss.summary AS sowsummary,
    sh.summary AS shsummary,
    sh.industry_expert,
    sh.beautiful_work,
    sh.public_presentation,
    sh.resources_required,
    sh.pshe_links,
    sh.pfa_links,
    sh.category,
    sh.task,
    sh.formative_assesment,
    sh.extension_task,
    sh.fk_created_by,
    sh.sow_active,
    st.curr_map_topic_id,
    ss.sow_header_id,
    ss.step_name,
    sl.url,
    sl.student_id,
    sl.referral_id,
    sl.type,
    sl.sow_plan_id,
    cmt.literacy_text_id
   FROM (((((((((((curr_map_header cmh
     JOIN services ON ((services.id = cmh.service_id)))
     JOIN curr_map_phases cmp ON ((cmp.curr_map_header_id = cmh.id)))
     JOIN curr_map_topics cmtop ON ((cmtop.curr_map_header_id = cmh.id)))
     JOIN lu_phases lup ON ((lup.id = cmp.phase_id)))
     JOIN lu_pillar_topic_cache lptc ON ((lptc.id = cmtop.topic_id)))
     LEFT JOIN sow_header sh ON ((sh.curr_map_header_id = cmh.id)))
     LEFT JOIN sow_topics st ON ((st.sow_header_id = sh.id)))
     LEFT JOIN sow_steps ss ON ((ss.sow_header_id = sh.id)))
     LEFT JOIN links sl ON ((sl.sow_header_id = sh.id)))
     LEFT JOIN curr_map_texts cmt ON ((cmt.curr_map_header_id = cmt.id)))
     LEFT JOIN lu_literacy_texts lut ON ((lut.id = cmt.literacy_text_id)));


CREATE OR REPLACE FUNCTION public.select_merge_test2()
 RETURNS record
 LANGUAGE plpgsql
AS $function$BEGIN
  update merge_test set full_name = null;
END;$function$
;

create or replace view "public"."statushistory" as  SELECT jrs.id AS join_referral_status_id,
    jrs.old_status_id,
    jrs.new_status_id,
    jrs.new_stage_id,
    jrs.old_stage_id,
    r.display_child,
    r.date_referral,
    r.source,
    r.placement_offered,
    r.barrier_to_placement,
    r.diagnosis,
    s.service_name,
    s.location,
    o.organisation_name,
    o.address,
    o.local_authority,
    o.general_email_address,
    o.phone_number,
    jrs.id AS histid,
    r.id AS referralid,
    o.id AS orgid,
    s.id AS servid
   FROM (((join_referral_status jrs
     JOIN referrals r ON ((r.id = jrs.referral_id)))
     JOIN organisations o ON ((r.organisation_id = o.id)))
     JOIN services s ON ((r.service_id = s.id)));


create or replace view "public"."view_merge_test_services" as  SELECT services.id,
    services.service_name,
    services.location,
    services.status,
    services.created_at,
    services.initials
   FROM services;


create or replace view "public"."vw_all_tickets" as  SELECT tic.id,
    tic.location,
    tic.priority,
    tic.links,
    tic.details,
    tic.title,
    tic.urgency,
    tic.importance,
    tic.fk_ticket_queue,
    tic.ticket_number,
    tic.screenshot1,
    tic.screenshot2,
    tic.screenshot3,
    tic.status_history,
    tic.created_at AS entered_date,
    tic.fk_status_id,
    tic.fk_agent_id,
    tic.fk_type_id,
    tic.fk_creator_id,
    tic.fk_external_thread_id,
    tic.fk_internal_thread_id,
    tic.fk_development_thread_id,
    tic.fk_category_id,
    tic.fk_subcategory_id,
    tic.fk_ticket_group_id,
    tic.fk_merged_user_id,
    tic.fk_ticket_reason,
    tic.last_response,
    ac.name AS creator,
    acc.name AS agent,
    lts.name AS status,
    ltt.name AS ticket_type,
    apps.app_name,
    ltc.name AS category,
    ltsc.name AS subcategory,
    ltg.group_name,
    th.thread_content AS external_thread,
    thr.thread_content AS internal_thread,
    thre.thread_content AS development_thread,
    tic.fk_type_id AS ticket_type_id,
    tic.fk_service_id AS service_id,
    sr.initials AS service_name,
    tic.fk_awaiting_response,
    ltq.name AS queue
   FROM (((((((((((((tickets tic
     LEFT JOIN lu_ticket_queue ltq ON ((tic.fk_ticket_queue = ltq.id)))
     LEFT JOIN accounts ac ON ((tic.fk_creator_id = ac.id)))
     LEFT JOIN accounts acc ON ((tic.fk_agent_id = acc.id)))
     LEFT JOIN lu_ticket_status lts ON ((tic.fk_status_id = lts.id)))
     LEFT JOIN lu_ticket_types ltt ON ((tic.fk_type_id = ltt.id)))
     LEFT JOIN applications apps ON ((tic.fk_app_id = apps.id)))
     LEFT JOIN lu_ticket_categories ltc ON ((tic.fk_category_id = ltc.id)))
     LEFT JOIN lu_ticket_subcategories ltsc ON ((tic.fk_subcategory_id = ltsc.id)))
     LEFT JOIN lu_ticket_group ltg ON ((tic.fk_ticket_group_id = ltg.id)))
     LEFT JOIN threads th ON ((th.id = tic.fk_external_thread_id)))
     LEFT JOIN threads thr ON ((thr.id = tic.fk_internal_thread_id)))
     LEFT JOIN threads thre ON ((thre.id = tic.fk_development_thread_id)))
     LEFT JOIN services sr ON ((sr.id = tic.fk_service_id)))
  WHERE (tic.active = 'Active'::text)
  ORDER BY tic.ticket_number;



