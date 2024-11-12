create extension if not exists "http" with schema "extensions";


create extension if not exists "autoinc" with schema "public" version '1.0';

create sequence "public"."tickets_ticket_number_seq";

create table "public"."Student_target_assessment_history" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_student_target_id" uuid,
    "fk_updated_by" uuid,
    "old_assessment" text,
    "new_assessment" text
);


alter table "public"."Student_target_assessment_history" enable row level security;

create table "public"."academic_years" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "name" text,
    "sorting" bigint,
    "start_date" date,
    "end_date" date
);


alter table "public"."academic_years" enable row level security;

create table "public"."accounts" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text,
    "name_first" text,
    "name_last" text,
    "email" character varying,
    "user_status" text default 'Active'::text,
    "created_at" timestamp with time zone default now()
);


alter table "public"."accounts" enable row level security;

create table "public"."actions" (
    "id" uuid not null default uuid_generate_v4(),
    "service_id" uuid,
    "referral_id" uuid,
    "account_id" uuid,
    "assigned_to_id" uuid,
    "service_name" text,
    "display_child" text,
    "account_name" text,
    "assigned_to_name" text,
    "date" date,
    "details" text,
    "type" text,
    "due_date" date,
    "editable" boolean,
    "rating" text,
    "created_at" timestamp with time zone default now(),
    "stage_name" text,
    "source" text,
    "project_id" uuid,
    "tasklist_id" uuid,
    "parent_action_id" uuid,
    "title" text,
    "status" text default 'Open'::text,
    "aim_id" uuid,
    "activity_id" uuid,
    "activity_followup_header_id" uuid,
    "student_id" uuid,
    "fk_rm_risk_id" uuid,
    "fk_referral_header_id" uuid
);


alter table "public"."actions" enable row level security;

create table "public"."activities" (
    "id" uuid not null default gen_random_uuid(),
    "service_id" uuid,
    "student_id" uuid,
    "account_id" uuid,
    "record_type" text not null default ''''''::text,
    "entry_id" text default ''''''::text,
    "date" date not null,
    "details" text default ''''''::text,
    "is_confidential" boolean default false,
    "is_child_on_child" boolean default false,
    "is_esafety" boolean default false,
    "count_notifications" numeric default '0'::numeric,
    "count_actions" numeric default '0'::numeric,
    "count_reviews" numeric default '0'::numeric,
    "count_risks" numeric default '0'::numeric,
    "count_interventions" numeric default '0'::numeric,
    "updated_at" timestamp with time zone,
    "updated_account_id" uuid,
    "linked_record_id" uuid,
    "academic_year_id" uuid,
    "record_type_number" smallint,
    "created_by" uuid,
    "status" text,
    "is_subject" boolean,
    "is_object" boolean,
    "object_info" text,
    "time" character varying,
    "duration" text,
    "where" text,
    "location" text,
    "involvement" text,
    "antecedent_category" text,
    "antecedent_sub_category" text,
    "antecedent_more" text,
    "category" text,
    "sub_category" text,
    "trigger" text,
    "trigger_more" text,
    "need_category" text,
    "need_sub_category" text,
    "need_more" text,
    "function_category" text,
    "function_more" text,
    "emergent_behaviours" text,
    "emergent_behaviours_more" text,
    "strategies" text,
    "strategies_more" text,
    "primary_area_of_need" text,
    "is_disruption" boolean,
    "disruption_category" text,
    "disruption_more" text,
    "is_harm_caused" boolean,
    "is_student_injured" boolean,
    "student_injured_who" text,
    "is_staff_injured" boolean,
    "staff_injured_who" text,
    "is_guided_pi" boolean,
    "is_restrictive_pi" boolean,
    "engagement" text,
    "support" text,
    "created_at" timestamp with time zone not null default now(),
    "main_student" uuid
);


alter table "public"."activities" enable row level security;

create table "public"."activity_followup_header" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "activity_id" uuid,
    "student_id" uuid,
    "date" date,
    "type" text,
    "details" text,
    "is_change_rsp" boolean,
    "is_change_ra" boolean
);


alter table "public"."activity_followup_header" enable row level security;

create table "public"."activity_followup_incident_safeguarding" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "followup_header_id" uuid,
    "activity_id" uuid,
    "has_staff_feedback" boolean,
    "escalation_assessment" text,
    "risk_assessment" text,
    "risk_value" numeric,
    "frequency" text,
    "frequency_value" numeric
);


alter table "public"."activity_followup_incident_safeguarding" enable row level security;

create table "public"."activity_followup_notification" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "followup_header_id" uuid,
    "activity_id" uuid,
    "external_agency" text,
    "reference" text,
    "note" text,
    "social_care_decision" text,
    "notification_date" date
);


alter table "public"."activity_followup_notification" enable row level security;

create table "public"."activity_followup_pi" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "followup_header_id" uuid,
    "activity_id" uuid,
    "student_injuries" text,
    "is_bodymap" boolean,
    "is_student_debrief_offered" boolean,
    "reflection" text
);


alter table "public"."activity_followup_pi" enable row level security;

create table "public"."activity_header" (
    "id" uuid not null default gen_random_uuid(),
    "service_id" uuid,
    "student_id" uuid,
    "account_id" uuid,
    "record_type" text not null default ''''''::text,
    "entry_id" text default ''''''::text,
    "date" date not null,
    "details" text default ''''''::text,
    "is_confidential" boolean default false,
    "is_child_on_child" boolean default false,
    "is_esafety" boolean default false,
    "count_notifications" numeric default '0'::numeric,
    "count_actions" numeric default '0'::numeric,
    "count_reviews" numeric default '0'::numeric,
    "count_risks" numeric default '0'::numeric,
    "count_interventions" numeric default '0'::numeric,
    "created_at" timestamp with time zone,
    "updated_at" timestamp with time zone,
    "updated_account_id" uuid,
    "linked_record_id" uuid,
    "academic_year_id" uuid,
    "record_type_number" smallint,
    "created_by" uuid,
    "status" text
);


alter table "public"."activity_header" enable row level security;

create table "public"."activity_incident" (
    "id" uuid not null default gen_random_uuid(),
    "activity_id" uuid,
    "is_subject" boolean,
    "is_object" boolean,
    "object_info" text,
    "time" character varying,
    "duration" text,
    "where" text,
    "location" text,
    "antecedent_category" text,
    "antecedent_sub_category" text,
    "antecedent_more" text,
    "trigger" text,
    "trigger_more" text,
    "need_category" text,
    "need_sub_category" text,
    "need_more" text,
    "function_category" text,
    "function_more" text,
    "emergent_behaviours" text,
    "emergent_behaviours_more" text,
    "strategies" text,
    "strategies_more" text,
    "primary_area_of_need" text,
    "is_disruption" boolean,
    "disruption_category" text,
    "disruption_more" text,
    "is_harm_caused" boolean,
    "is_student_injured" boolean,
    "student_injured_who" text,
    "is_staff_injured" boolean,
    "staff_injured_who" text,
    "is_guided_pi" boolean,
    "is_restrictive_pi" boolean,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone,
    "injured_student" character varying default ''::character varying,
    "injured_staff" character varying default ''::character varying
);


alter table "public"."activity_incident" enable row level security;

create table "public"."activity_log" (
    "id" uuid not null default gen_random_uuid(),
    "activity_id" uuid,
    "category" text,
    "sub_category" text,
    "created_at" timestamp with time zone default now(),
    "engagement" text,
    "support" text,
    "updated_at" timestamp with time zone,
    "is_subject" boolean
);


alter table "public"."activity_log" enable row level security;

create table "public"."activity_pi" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "activity_id" uuid,
    "where" text,
    "events_prior" text,
    "steps_strategies" text
);


alter table "public"."activity_pi" enable row level security;

create table "public"."activity_pi_interventions" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "activity_id" uuid,
    "account_id" uuid,
    "role" text,
    "type" text,
    "duration" text,
    "rationale" text,
    "de-escalation_attempted" text
);


alter table "public"."activity_pi_interventions" enable row level security;

create table "public"."activity_safeguarding" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "activity_id" uuid,
    "is_subject" boolean
);


alter table "public"."activity_safeguarding" enable row level security;

create table "public"."activity_welfare" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "activity_id" uuid,
    "category" text,
    "updated_at" timestamp with time zone,
    "is_subject" boolean
);


alter table "public"."activity_welfare" enable row level security;

create table "public"."aims" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "description" text,
    "type" text,
    "academic_year_id" uuid,
    "status" text,
    "title" text
);


alter table "public"."aims" enable row level security;

create table "public"."applications" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "app_name" text,
    "show_in_reports" boolean default false
);


alter table "public"."applications" enable row level security;

create table "public"."attendance" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "week_number_id" uuid,
    "student_id" uuid,
    "monday_am" uuid,
    "monday_am_comment" text,
    "monday_pm" uuid,
    "monday_pm_comment" text,
    "tuesday_am" uuid,
    "tuesday_am_comment" text,
    "tuesday_pm" uuid,
    "tuesday_pm_comment" text,
    "wednesday_am" uuid,
    "wednesday_am_comment" text,
    "wednesday_pm" uuid,
    "wednesday_pm_comment" text,
    "thursday_am" uuid,
    "thursday_am_comment" text,
    "thursday_pm" uuid,
    "thursday_pm_comment" text,
    "friday_am" uuid,
    "friday_am_comment" text,
    "friday_pm" uuid,
    "friday_pm_comment" text,
    "date_updated" date,
    "entered_by" uuid,
    "updated_by" uuid
);


alter table "public"."attendance" enable row level security;

create table "public"."base_groups" (
    "id" uuid not null default gen_random_uuid(),
    "service_id" uuid not null,
    "created_at" timestamp with time zone default now(),
    "name" text,
    "base_number" bigint,
    "base_teacher_id" uuid
);


alter table "public"."base_groups" enable row level security;

create table "public"."children" (
    "id" uuid not null default uuid_generate_v4(),
    "child_name" text,
    "name_first" text,
    "name_last" text,
    "name_preferred" text,
    "date_of_birth" date,
    "age" numeric default '0'::numeric,
    "sex" text,
    "diagnosis" text,
    "risk_initial_paperwork" text,
    "interests" text,
    "date_start" date,
    "date_end" date,
    "current_home_address" text,
    "current_home_address_street1" text,
    "current_home_address_street2" text,
    "current_home_address_city" text,
    "current_home_address_state" text,
    "current_home_address_zip" text,
    "current_home_address_country" text,
    "last_school_attended" text,
    "date_created" date,
    "display_child" text,
    "bupdate" boolean,
    "created_at" timestamp with time zone default now(),
    "service_id" uuid,
    "organisation_id" uuid,
    "type" text,
    "referral_id" uuid default gen_random_uuid(),
    "risk_initial" text
);


alter table "public"."children" enable row level security;

create table "public"."contacts" (
    "id" uuid not null default uuid_generate_v4(),
    "organisation_id" uuid,
    "organisation_name" text default ''::text,
    "contact_name" text default ''::text,
    "name_first" text default ''::text,
    "name_last" text default ''::text,
    "job_title" text default ''::text,
    "department" text default ''::text,
    "comments" text default ''::text,
    "email" text default ''::text,
    "address" text default ''::text,
    "address_street1" text default ''::text,
    "address_street2" text default ''::text,
    "address_city" text default ''::text,
    "address_state" text default ''::text,
    "address_zip" text default ''::text,
    "phone" text default ''::text,
    "mobile" text default ''::text,
    "bupdate" text default ''::text,
    "created_at" timestamp without time zone default now(),
    "name_title" text default ''::text,
    "address_country" text default ''::text
);


alter table "public"."contacts" enable row level security;

create table "public"."contextual_overview" (
    "id" uuid not null default uuid_generate_v4(),
    "created_at" timestamp with time zone default now(),
    "referral_id" uuid,
    "child_id" uuid,
    "service_id" uuid,
    "risk_score" numeric default '0'::numeric,
    "student_id" uuid
);


alter table "public"."contextual_overview" enable row level security;

create table "public"."curr_map_header" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "service_id" uuid,
    "academic_year_id" uuid,
    "term_id" uuid,
    "year_number" bigint,
    "yearly_theme" text,
    "termly_theme" text,
    "safeguarding_theme" text,
    "pshe_theme" text,
    "fbv_theme" text,
    "real_world_focus" text,
    "driving_question" text,
    "community_impact" text,
    "display_name" text
);


alter table "public"."curr_map_header" enable row level security;

create table "public"."curr_map_phases" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "curr_map_header_id" uuid not null,
    "phase_id" uuid not null
);


alter table "public"."curr_map_phases" enable row level security;

create table "public"."curr_map_texts" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "curr_map_header_id" uuid not null,
    "literacy_text_id" uuid not null
);


alter table "public"."curr_map_texts" enable row level security;

create table "public"."curr_map_topics" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "curr_map_header_id" uuid not null,
    "topic_id" uuid not null
);


alter table "public"."curr_map_topics" enable row level security;

create table "public"."debriefs" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone default now(),
    "area" text,
    "notes" text,
    "risk level" numeric default '0'::numeric
);


alter table "public"."debriefs" enable row level security;

create table "public"."development_items" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_application_id" uuid,
    "fk_status_id" uuid,
    "title" text,
    "esitmated_time" numeric,
    "details" text,
    "fk_thread_id" uuid,
    "task_number" numeric
);


alter table "public"."development_items" enable row level security;

create table "public"."duplicate_children_in_referrals" (
    "child_id" uuid
);


alter table "public"."duplicate_children_in_referrals" enable row level security;

create table "public"."join_account_activity" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "account_id" uuid,
    "is_primary" boolean,
    "activity_id" uuid
);


alter table "public"."join_account_activity" enable row level security;

create table "public"."join_account_services" (
    "account_id" uuid,
    "service_id" uuid,
    "service_name" text,
    "name" text,
    "id" uuid not null default uuid_generate_v4(),
    "user_role" text,
    "created_at" timestamp with time zone default now()
);


alter table "public"."join_account_services" enable row level security;

create table "public"."join_application_accounts" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "account_id" uuid,
    "app_id" uuid,
    "role" text
);


alter table "public"."join_application_accounts" enable row level security;

create table "public"."join_child_contacts" (
    "id" uuid not null default uuid_generate_v4(),
    "service_id" uuid,
    "contact_id" uuid,
    "child_id" uuid,
    "display_child" text,
    "service_name" text,
    "contact_name" text,
    "relationship" text,
    "emergency_contact" boolean,
    "lives_with_this_contact" boolean,
    "created_at" timestamp with time zone default now(),
    "is_primary_contact" boolean,
    "student_id" uuid
);


alter table "public"."join_child_contacts" enable row level security;

create table "public"."join_debrief_action" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone default now(),
    "debrief_id" bigint,
    "action_id" uuid
);


alter table "public"."join_debrief_action" enable row level security;

create table "public"."join_plan_steps" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "sow_step_id" uuid,
    "sow_plan_id" uuid
);


alter table "public"."join_plan_steps" enable row level security;

create table "public"."join_plan_student_milestones" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "join_plan_student_id" uuid,
    "student_milestone_id" uuid
);


alter table "public"."join_plan_student_milestones" enable row level security;

create table "public"."join_plan_students" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "sow_plan_id" uuid,
    "student_id" uuid
);


alter table "public"."join_plan_students" enable row level security;

create table "public"."join_project_accounts" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "account_id" uuid,
    "role" text,
    "project_id" uuid
);


alter table "public"."join_project_accounts" enable row level security;

create table "public"."join_project_aims" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "project_id" uuid,
    "service_id" uuid,
    "aim_id" uuid
);


alter table "public"."join_project_aims" enable row level security;

create table "public"."join_referral_status" (
    "id" uuid not null default uuid_generate_v4(),
    "referral_id" uuid,
    "old_status_id" uuid,
    "new_stage_id" uuid,
    "account_id" uuid,
    "new_status_id" uuid,
    "service_id" uuid,
    "created_at" timestamp with time zone default now(),
    "old_stage_id" uuid,
    "status" text,
    "action_set" boolean default false
);


alter table "public"."join_referral_status" enable row level security;

create table "public"."join_service_terms" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "term_id" uuid,
    "start_date" date,
    "end_date" date,
    "weeks" bigint,
    "service_id" uuid
);


alter table "public"."join_service_terms" enable row level security;

create table "public"."join_sow_ent_skup" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "enterprise_sow_id" uuid,
    "skillup_sow_id" uuid
);


alter table "public"."join_sow_ent_skup" enable row level security;

create table "public"."join_student_activity" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "activity_id" uuid,
    "student_id" uuid,
    "is_primary" boolean
);


alter table "public"."join_student_activity" enable row level security;

create table "public"."join_student_assessments" (
    "pk_join_student_assessments_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_student_id" uuid,
    "fk_assessments_id" uuid,
    "date_of_event" date,
    "entrance_status" text,
    "fk_criteria_value_id" uuid,
    "fk_academic_year_id" uuid,
    "fk_term_id" uuid,
    "fk_account_id" uuid,
    "fk_meeting_id" uuid,
    "score_numeric" numeric
);


alter table "public"."join_student_assessments" enable row level security;

create table "public"."join_student_base_group" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "student_id" uuid,
    "base_group_id" uuid
);


alter table "public"."join_student_base_group" enable row level security;

create table "public"."join_student_contacts" (
    "id" uuid not null default gen_random_uuid(),
    "student_id" uuid,
    "service_id" uuid,
    "contact_id" uuid,
    "account_id" uuid,
    "relationship" text default 'Blank'::text,
    "is_emergency_contact" boolean,
    "is_lives_with" boolean,
    "is_parental_responsibility" boolean
);


alter table "public"."join_student_contacts" enable row level security;

create table "public"."join_target_ilps" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "target_id" uuid,
    "ilp_header_id" uuid
);


alter table "public"."join_target_ilps" enable row level security;

create table "public"."join_tasklist_aims" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "tasklist_id" uuid,
    "service_id" uuid,
    "aim_id" uuid
);


alter table "public"."join_tasklist_aims" enable row level security;

create table "public"."join_tickets" (
    "id" uuid not null default gen_random_uuid(),
    "fk_parent_ticket" uuid,
    "fk_child_ticket" uuid
);


alter table "public"."join_tickets" enable row level security;

create table "public"."join_tickets_users" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_account_id" uuid default gen_random_uuid(),
    "fk_ticket_id" uuid default gen_random_uuid(),
    "type" text
);


alter table "public"."join_tickets_users" enable row level security;

create table "public"."links" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "name" text default 'New Link'::text,
    "url" text default 'New Link Address'::text,
    "student_id" uuid,
    "referral_id" uuid,
    "sow_header_id" uuid,
    "type" text,
    "sow_plan_id" uuid
);


alter table "public"."links" enable row level security;

create table "public"."lu_admissions_reports" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone,
    "report_name" text,
    "webhook" text,
    "sequence" bigint,
    "stage" bigint,
    "fk_lu_ref_stage" uuid,
    "status" text
);


alter table "public"."lu_admissions_reports" enable row level security;

create table "public"."lu_attendance_codes" (
    "id" uuid not null default gen_random_uuid(),
    "short_code" text,
    "description" text,
    "display_attendance" text,
    "meaning" text,
    "admin" numeric,
    "authorised" numeric,
    "c_authorised" numeric,
    "present" numeric,
    "unauthorised" numeric
);


alter table "public"."lu_attendance_codes" enable row level security;

create table "public"."lu_criteria_type" (
    "pk_criteria_type_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "criteria_type" text,
    "criteria_number" bigint,
    "min_value" bigint,
    "max_value" bigint
);


alter table "public"."lu_criteria_type" enable row level security;

create table "public"."lu_criteria_values" (
    "pk_criteria_value_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "description" text,
    "value" numeric,
    "fk_criteria_type_id" uuid
);


alter table "public"."lu_criteria_values" enable row level security;

create table "public"."lu_destinations" (
    "id" uuid not null default gen_random_uuid(),
    "codeset" text,
    "destination" text,
    "code" text,
    "sorting" bigint
);


alter table "public"."lu_destinations" enable row level security;

create table "public"."lu_ehcp_categories" (
    "id" uuid not null default gen_random_uuid(),
    "name" text,
    "category" text,
    "display_category_name" text,
    "status" text
);


alter table "public"."lu_ehcp_categories" enable row level security;

create table "public"."lu_literacy_texts" (
    "year_group" text,
    "term" bigint,
    "pshe_topics" text,
    "title" text,
    "author" text,
    "published_year" text,
    "contextual_year" text,
    "genre" text,
    "summary" text,
    "id" uuid not null default gen_random_uuid()
);


alter table "public"."lu_literacy_texts" enable row level security;

create table "public"."lu_phases" (
    "name" text,
    "phase" text,
    "status" text,
    "display_name" text,
    "sorting" bigint,
    "id" uuid not null default gen_random_uuid()
);


alter table "public"."lu_phases" enable row level security;

create table "public"."lu_pillar_cache" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "pillar" text
);


alter table "public"."lu_pillar_cache" enable row level security;

create table "public"."lu_pillar_subject_cache" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "pillar_id" uuid,
    "cache_type" text,
    "subject" text
);


alter table "public"."lu_pillar_subject_cache" enable row level security;

create table "public"."lu_pillar_target_cache" (
    "id" uuid not null default gen_random_uuid(),
    "topic_id" uuid,
    "level" text,
    "category" text,
    "target" text,
    "subject_id" uuid,
    "pillar_id" uuid
);


alter table "public"."lu_pillar_target_cache" enable row level security;

create table "public"."lu_pillar_topic_cache" (
    "id" uuid not null default gen_random_uuid(),
    "pillar" text,
    "cache_type" text,
    "subject" text,
    "topic" text,
    "pillar_id" uuid,
    "subject_id" uuid
);


alter table "public"."lu_pillar_topic_cache" enable row level security;

create table "public"."lu_record_categories" (
    "id" uuid not null default gen_random_uuid(),
    "name" text,
    "status" text,
    "type" text
);


alter table "public"."lu_record_categories" enable row level security;

create table "public"."lu_record_subcategories" (
    "id" uuid not null default gen_random_uuid(),
    "name" text,
    "record_category_id" uuid,
    "status" text,
    "type" text,
    "display_record_category_name" text
);


alter table "public"."lu_record_subcategories" enable row level security;

create table "public"."lu_ref_stage" (
    "id" uuid not null,
    "stage" text,
    "description" text,
    "sequence" numeric
);


alter table "public"."lu_ref_stage" enable row level security;

create table "public"."lu_ref_status" (
    "id" uuid not null,
    "stage_id" uuid,
    "status" text,
    "sequence" numeric,
    "display_name" text,
    "color" text
);


alter table "public"."lu_ref_status" enable row level security;

create table "public"."lu_risk_categories" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text,
    "type" text[],
    "status" text
);


alter table "public"."lu_risk_categories" enable row level security;

create table "public"."lu_risk_subcategories" (
    "id" uuid not null default uuid_generate_v4(),
    "category_id" uuid,
    "name" text,
    "status" text,
    "type" text[],
    "category_name" text
);


alter table "public"."lu_risk_subcategories" enable row level security;

create table "public"."lu_sow_steps" (
    "id" uuid not null default gen_random_uuid(),
    "step_name" text,
    "sorting" bigint,
    "type" text
);


alter table "public"."lu_sow_steps" enable row level security;

create table "public"."lu_themes" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "type" text,
    "name" text
);


alter table "public"."lu_themes" enable row level security;

create table "public"."lu_ticket_categories" (
    "id" uuid not null default gen_random_uuid(),
    "name" text,
    "status" text default 'Active'::text
);


alter table "public"."lu_ticket_categories" enable row level security;

create table "public"."lu_ticket_group" (
    "id" uuid not null default gen_random_uuid(),
    "fk_subcategory_id" uuid,
    "group_name" text,
    "status" text default 'Active'::text
);


alter table "public"."lu_ticket_group" enable row level security;

create table "public"."lu_ticket_queue" (
    "id" uuid not null default gen_random_uuid(),
    "name" text,
    "status" text default 'Active'::text
);


alter table "public"."lu_ticket_queue" enable row level security;

create table "public"."lu_ticket_reasons" (
    "id" uuid not null default gen_random_uuid(),
    "reason" text,
    "note" text,
    "status" text default 'Active'::text,
    "sorting" numeric
);


alter table "public"."lu_ticket_reasons" enable row level security;

create table "public"."lu_ticket_status" (
    "id" uuid not null default gen_random_uuid(),
    "name" text,
    "sequence" numeric,
    "type" text,
    "status" text default 'Active'::text
);


alter table "public"."lu_ticket_status" enable row level security;

create table "public"."lu_ticket_sub_reasons" (
    "id" uuid not null default gen_random_uuid(),
    "sub reason" text,
    "note" text,
    "status" text default 'Active'::text
);


alter table "public"."lu_ticket_sub_reasons" enable row level security;

create table "public"."lu_ticket_subcategories" (
    "name" text,
    "fk_category_id" uuid default gen_random_uuid(),
    "id" uuid not null default gen_random_uuid(),
    "status" text default 'Active'::text
);


alter table "public"."lu_ticket_subcategories" enable row level security;

create table "public"."lu_ticket_types" (
    "id" uuid not null default gen_random_uuid(),
    "name" text,
    "fk_agent_id" uuid,
    "role" text,
    "status" text default 'Active'::text,
    "fk_queue_id" uuid
);


alter table "public"."lu_ticket_types" enable row level security;

create table "public"."meetings" (
    "pk_meetings_id" uuid not null default gen_random_uuid(),
    "meeting_date" date not null,
    "meeting_time" time without time zone,
    "meeting_notes" text
);


alter table "public"."meetings" enable row level security;

create table "public"."notification_distribution" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone,
    "recipient_id" uuid,
    "status" text,
    "notification_header_id" uuid
);


alter table "public"."notification_distribution" enable row level security;

create table "public"."notification_header" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone,
    "fk_referral_header_id" uuid,
    "body" text,
    "sender-id" uuid,
    "date_sent" date,
    "subject" text
);


alter table "public"."notification_header" enable row level security;

create table "public"."organisations" (
    "id" uuid not null default uuid_generate_v4(),
    "organisation_name" text,
    "local_authority" text,
    "general_email_address" text,
    "phone_number" text,
    "address" text,
    "address_street1" text,
    "address_street2" text,
    "address_city" text,
    "address_state" text,
    "address_zip" text,
    "address_country" text,
    "created_at" timestamp with time zone default now()
);


alter table "public"."organisations" enable row level security;

create table "public"."progress_notes" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "action_id" uuid,
    "notes" text,
    "account_id" uuid,
    "editable" boolean default true
);


alter table "public"."progress_notes" enable row level security;

create table "public"."projects" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "project_name" text,
    "type" text,
    "start_date" date,
    "end_date" date,
    "status" text,
    "template" boolean,
    "category" text,
    "dept" text,
    "count_tasklists" numeric,
    "count_actions" numeric,
    "count_open_actions" numeric,
    "count_completed_actions" numeric,
    "count_overdue_actions" numeric,
    "service_id" uuid default gen_random_uuid(),
    "academic_year_id" uuid,
    "objectives" text,
    "intent" text,
    "sdp_area" text,
    "exp_impact" text,
    "overall_impact" text,
    "link_iss" text
);


alter table "public"."projects" enable row level security;

create table "public"."referral_details" (
    "fk_referral_header_id" uuid not null,
    "views_education_school" text,
    "previous_education_setting" text,
    "placement_reason" text,
    "need_prior" boolean,
    "primary_diagnosis" text,
    "other_diagnoses" text,
    "undiagnosed_presentations" text,
    "previous_support" text,
    "care_needs" text,
    "health_needs" text,
    "placement_risk" text[],
    "summary_risk" text,
    "criminal_convictions" boolean,
    "outcomes_antisocial_behaviour" text,
    "current_sg_status" text,
    "previous_sg_status" text,
    "attendance_summary" text,
    "part_time_timetable" boolean,
    "days_per_week" text,
    "social_worker_assigned" boolean,
    "family_support_assigned" boolean,
    "residence" text,
    "sg_reports_requested" boolean,
    "cognition_learning_needs" text,
    "comm_interaction_needs" text,
    "sensory_physical_needs" text,
    "semh_needs" text,
    "adverse_childhood_experiences" text,
    "hours_per_week" text,
    "date_consent" date,
    "consent_contact_school" boolean,
    "is_age_related_level" boolean,
    "is_parents_carers_contacted" boolean,
    "is_previous_placement_contacted" boolean,
    "is_meeting_with_cyp" boolean,
    "is_aware_cyp" boolean,
    "is_placement_available" boolean,
    "is_placement_incompatible" boolean,
    "is_placement_suitable" boolean,
    "who_spoken" text,
    "consult_deadline" text,
    "year_group" text,
    "discussed_with" text,
    "needs_safeguarding_followup" text,
    "education_needs" text,
    "previous_education_setting_name" text,
    "response_type" text,
    "school_home_visit_notes" text,
    "student_voice" text,
    "summary_of_need" text,
    "primary_need" text,
    "summary_of_information" text,
    "summary_education" text,
    "summary_current_family" text,
    "summary_diagnosis" text,
    "summary_current_provider" text,
    "summary_peer_integration" text,
    "summary_communication" text,
    "summary_environment" text,
    "summary_needs_skills" text,
    "summary_professionals" text,
    "summary_general" text,
    "summary_placement" text,
    "summary_support_reqs" text,
    "checklist" text,
    "date_completion" date,
    "cyp_needs_met" text,
    "cyp_needs_not_met" text,
    "pk_referral_details_id" uuid not null default gen_random_uuid(),
    "other_areas_of_need" text,
    "provision_cost_notes" text,
    "la_paperwork_complete" boolean,
    "offer_made" boolean,
    "youth_offending_team" text,
    "offer_signed" boolean,
    "offer_returned" boolean,
    "ipa_received" boolean,
    "ipa_signed" boolean,
    "ipa_returned" boolean,
    "framework" boolean,
    "outside_core" text,
    "transition_notes" text,
    "safeguarding_notes" text
);


alter table "public"."referral_details" enable row level security;

create table "public"."referral_export" (
    "myrecno" bigint,
    "pk_referral_header_id" uuid,
    "fk_service_id" uuid,
    "fk_child_id" uuid,
    "fk_stage_id" uuid,
    "fk_status_id" uuid,
    "fk_completed_by" uuid,
    "fk_organisation_id" uuid,
    "fk_service_name" text,
    "display_child" text,
    "organisation_name" text,
    "date_referral" date,
    "source" text,
    "assess" boolean,
    "placement_offered" boolean,
    "barrier_to_placement" text,
    "diagnosis" text,
    "probablity_rating" text,
    "source_location" text,
    "proposed_start" date,
    "link" text,
    "status" text,
    "date_created" date,
    "source_address_zip" text,
    "source_address_country" text,
    "closed_reason" text,
    "la_closed" boolean,
    "views_education" text,
    "previous_education_setting" text,
    "placement_reason" text,
    "need_prior" boolean,
    "primary_diagnosis" text,
    "other_diagnoses" text[],
    "undiagnosed_presentations" text,
    "previous_support" text,
    "care_needs" text,
    "health_needs" text,
    "placement_risk" text[],
    "summary_risk" text,
    "criminal_convictions" boolean,
    "outcomes_antisocial_behaviour" text[],
    "current_sg_status" text,
    "previous_sg_status" text[],
    "previous_attendance" boolean,
    "part_time_timetable_stage2" boolean,
    "days_per_week_stage2" text,
    "social_worker_assigned_stage2" boolean,
    "family_support_assigned_stage2" boolean,
    "residence_stage2" text,
    "sg_reports_requested_stage2" boolean,
    "cognition_learning_needs_stage2" text,
    "comm_interaction_needs_stage2" text,
    "sensory_physical_needs_stage2" text,
    "semh_needs_stage2" text,
    "adverse_childhood_experiences_stage2" text[],
    "half_days_stage2" boolean,
    "date_consent_stage2" date,
    "consent_contact_school_stage2" boolean,
    "summary_of_information" text,
    "summary_education" text,
    "summary_current_family" text,
    "summary_diagnosis" text,
    "summary_current_provider" text,
    "summary_peer_integration" text,
    "summary_communication" text,
    "summary_environment" text,
    "summary_needs_skills" text,
    "summary_professionals" text,
    "summary_general" text,
    "summary_placement" text,
    "summary_support_reqs" text,
    "checklist_stage5" text[],
    "date_completion_stage5" date,
    "cyp_needs_met" text,
    "cyp_needs_not_met" text
);


alter table "public"."referral_export" enable row level security;

create table "public"."referral_header" (
    "pk_referral_header_id" uuid not null default gen_random_uuid(),
    "fk_service_id" uuid,
    "fk_child_id" uuid,
    "fk_stage_id" uuid,
    "fk_status_id" uuid,
    "fk_completed_by" uuid,
    "fk_organisation_id" uuid,
    "display_child" text,
    "date_referral" date,
    "source" text,
    "assess" boolean,
    "placement_offered" boolean,
    "barrier_to_placement" text,
    "diagnosis" text,
    "probablity_rating" text,
    "source_location" text,
    "proposed_start" date,
    "link" text,
    "status" text,
    "date_created" date,
    "source_address_zip" text,
    "source_address_country" text,
    "la_closed" text,
    "closed_reason" text,
    "is_stage_recommended" boolean,
    "closed_summary" text,
    "entry_status" text,
    "current_school" text,
    "new_or_existing" text,
    "document_link" text,
    "fk_caring_authority_id" uuid,
    "all_days_count" numeric,
    "is_deleted" boolean default false,
    "other_services" text[],
    "send_officer" text
);


alter table "public"."referral_header" enable row level security;

create table "public"."referral_status_history" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "fk_referral_header_id" uuid,
    "fk_old_status_id" uuid,
    "fk_new_status_id" uuid,
    "fk_old_stage_id" uuid,
    "fk_new_stage_id" uuid,
    "fk_account_id" uuid,
    "status" text,
    "service_id" uuid,
    "action_set" boolean,
    "days_at_stage" numeric,
    "history_closed_reason" text,
    "history_closed_summary" text
);


alter table "public"."referral_status_history" enable row level security;

create table "public"."referrals" (
    "id" uuid not null default uuid_generate_v4(),
    "service_id" uuid,
    "child_id" uuid,
    "organisation_id" uuid,
    "service_name" text,
    "display_child" text,
    "organisation_name" text,
    "date_referral" date,
    "source" text,
    "assess" boolean,
    "placement_offered" boolean,
    "barrier_to_placement" text,
    "diagnosis" text,
    "probablity_rating" text,
    "source_location" text,
    "proposed_start" date,
    "link" text,
    "status" text,
    "date_created" date,
    "source_address_zip" text,
    "source_address_country" text,
    "status_id" uuid,
    "stage_id" uuid,
    "completed_by" uuid,
    "created_at" timestamp with time zone default now(),
    "closed_reason" text,
    "la_closed" boolean
);


alter table "public"."referrals" enable row level security;

create table "public"."referrals_stage1" (
    "id" uuid not null default uuid_generate_v4(),
    "created_at" timestamp with time zone default now(),
    "referral_id" uuid,
    "service_id" uuid,
    "child_id" uuid,
    "stage_id" uuid,
    "status_id" uuid,
    "views_education_school" text,
    "previous_education_setting" text,
    "placement_reason" text,
    "need_prior" boolean,
    "neet_years" numeric,
    "neet_months" numeric,
    "primary_diagnosis" text,
    "other_diagnoses" text[],
    "undiagnosed_presentations" text,
    "working_level_literacy" text,
    "date_literary_assessment" date,
    "working_level_maths" text,
    "date_maths_assessment" date,
    "previous_support" text,
    "care_needs" text,
    "health_needs" text,
    "fields_total" numeric default '16'::numeric,
    "fields_completed" numeric default '0'::numeric,
    "perc_complete" numeric default '0'::numeric
);


alter table "public"."referrals_stage1" enable row level security;

create table "public"."referrals_stage2" (
    "id" uuid not null default uuid_generate_v4(),
    "created_at" timestamp with time zone default now(),
    "referral_id" uuid,
    "service_id" uuid,
    "child_id" uuid,
    "stage_id" uuid,
    "status_id" uuid,
    "placement_risk" text[],
    "summary_risk" text,
    "criminal_convictions" boolean,
    "summary_convictions" text,
    "outcomes_antisocial_behaviour" text[],
    "summary_antisocial" text,
    "consent_contact_school" boolean,
    "date_consent" date,
    "current_sg_status" text,
    "previous_sg_status" text[],
    "previous_attendance" boolean,
    "part_time_timetable" boolean,
    "days_per_week" text,
    "half_days" boolean,
    "social_worker_assigned" boolean,
    "family_support_assigned" boolean,
    "residence" text,
    "adverse_childhood_experiences" text[],
    "reports_requested" boolean,
    "summary_reports" text,
    "cognition_learning_needs" text,
    "comm_interaction_needs" text,
    "sensory_physical_needs" text,
    "semh_needs" text,
    "contextual_id" uuid,
    "fields_total" numeric default '24'::numeric,
    "fields_completed" numeric default '0'::numeric,
    "perc_complete" numeric default '0'::numeric
);


alter table "public"."referrals_stage2" enable row level security;

create table "public"."referrals_stage3" (
    "id" uuid not null default uuid_generate_v4(),
    "created_at" timestamp with time zone default now(),
    "referral_id" uuid,
    "service_id" uuid,
    "child_id" uuid,
    "stage_id" uuid,
    "status_id" uuid,
    "current_school_status" text,
    "ehcp_status" text,
    "school_experience" text,
    "family_situation" text,
    "family_siblings" text,
    "family_history" text,
    "family_support" text,
    "cyp_in_home" text,
    "cyp_dev_history" text,
    "cyp_diagnosis" text,
    "cyp_milestones" text,
    "cyp_illness_hospital" text,
    "cyp_separation_carers" text,
    "staffing_school_community" text,
    "cyp_staff_team" text,
    "staff_training_needs" text,
    "cyp_staff_groups" text,
    "cyp_staff_directions" text,
    "cyp_relate_peers" text,
    "cyp_social_skills" text,
    "cyp_friends" text,
    "cyp_group_activities" text,
    "cyp_play" text,
    "cyp_communication" text,
    "cyp_expressive_language" text,
    "cyp_receptive_language" text,
    "cyp_empathy" text,
    "cyp_comm_resources" text,
    "cyp_environment" text,
    "cyp_edu_environment" text,
    "cyp_avoid_environment" text,
    "cyp_environment_difficulties" text,
    "cyp_sensory_seeking" text,
    "cyp_sensory_avoidance" text,
    "cyp_motor_skills" text,
    "cyp_risk_strategies" text,
    "cyp_learning_strategies" text,
    "cyp_current_professionals" text,
    "cyp_previous_professionals" text,
    "cyp_general_health" text,
    "cyp_diet_habits" text,
    "cyp_allergies_meds" text,
    "cyp_culture_religion" text,
    "cyp_dietary_requirements" text,
    "date_last_ehcp_review" date,
    "cyp_attendance" boolean,
    "edu_setting" text,
    "current_attendance" text,
    "preferred_subjects" text,
    "placement_successes" text,
    "placement_challenges" text,
    "education_attitude" text,
    "family_communication" text,
    "family_relationship_school" text,
    "family_environment" text,
    "cyp_sensory_needs" text,
    "further_education" text,
    "cyp_same_school" text,
    "cyp_needs_met" text,
    "cyp_needs_not_met" text,
    "cyp_support_safe" text,
    "cyp_support_engaged" text,
    "barriers_details" text,
    "strengths" text,
    "hobbies_interests" text,
    "ehcp_relevant" text,
    "care_details" text,
    "care_professionals" text,
    "fields_total" numeric default '56'::numeric,
    "fields_completed" numeric default '0'::numeric,
    "perc_complete" numeric default '0'::numeric
);


alter table "public"."referrals_stage3" enable row level security;

create table "public"."referrals_stage4" (
    "id" uuid not null default uuid_generate_v4(),
    "created_at" timestamp with time zone default now(),
    "referral_id" uuid,
    "service_id" uuid,
    "child_id" uuid,
    "stage_id" uuid,
    "status_id" uuid,
    "fields_total" numeric,
    "fields_completed" numeric default '0'::numeric,
    "perc_complete" numeric default '0'::numeric
);


alter table "public"."referrals_stage4" enable row level security;

create table "public"."referrals_stage5" (
    "id" uuid not null default uuid_generate_v4(),
    "created_at" timestamp with time zone default now(),
    "referral_id" uuid,
    "service_id" uuid,
    "child_id" uuid,
    "stage_id" uuid,
    "status_id" uuid,
    "checklist" text[],
    "date_completion" date,
    "completed_by" uuid,
    "fields_total" numeric default '20'::numeric,
    "fields_completed" numeric default '0'::numeric,
    "perc_complete" numeric default '0'::numeric
);


alter table "public"."referrals_stage5" enable row level security;

create table "public"."referrals_stage6" (
    "id" uuid not null default uuid_generate_v4(),
    "created_at" timestamp with time zone default now(),
    "referral_id" uuid,
    "service_id" uuid,
    "child_id" uuid,
    "stage_id" uuid,
    "status_id" uuid,
    "fields_total" numeric,
    "fields_completed" numeric default '0'::numeric,
    "perc_complete" numeric default '0'::numeric
);


alter table "public"."referrals_stage6" enable row level security;

create table "public"."report_details" (
    "pk_report_details_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone,
    "fk_report_header_id" uuid default gen_random_uuid(),
    "criteria_name" text,
    "criteria_data" text,
    "criteria_url_part" text,
    "criteria_number" bigint
);


alter table "public"."report_details" enable row level security;

create table "public"."report_header" (
    "pk_report_header_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "fk_app_id" uuid,
    "report_name" text,
    "category" text,
    "description" text,
    "criteria_notes" text,
    "report_url" text,
    "image_url" text,
    "sequence" numeric,
    "criteria1_type" text default 'UUID'::text,
    "criteria1_name" text,
    "criteria2_type" text default 'DATE'::text,
    "criteria2_name" text,
    "criteria1_sql" text default ''::text,
    "criteria2_sql" text default ''::text,
    "multi1" boolean default false,
    "multi2" boolean default false,
    "criteria1_url_part" text,
    "criteria2_url_part" text
);


create table "public"."risks" (
    "id" uuid not null default uuid_generate_v4(),
    "created_at" timestamp with time zone default now(),
    "service_id" uuid,
    "child_id" uuid,
    "contextual_id" uuid,
    "referral_id" uuid,
    "category_id" uuid,
    "subcategory_id" uuid,
    "record_type" text,
    "date" date,
    "created_by" uuid,
    "location" text,
    "esafety" boolean,
    "child_on_child" boolean,
    "severity" text,
    "frequency" text,
    "severity_value" numeric,
    "frequency_value" numeric,
    "total_risk" numeric,
    "activity_id" uuid,
    "student_id" uuid,
    "fk_referral_header_id" uuid default gen_random_uuid()
);


alter table "public"."risks" enable row level security;

create table "public"."rm_risks" (
    "pk_risk_id" uuid not null default gen_random_uuid(),
    "fk_service_id" uuid,
    "fk_created_by" uuid,
    "fk_risk_owner" uuid,
    "area" text,
    "description" text,
    "risk_type" text,
    "risk_rating" numeric,
    "control_measure" text,
    "status" text,
    "created_at" timestamp with time zone not null default now(),
    "last_review_date" timestamp without time zone default now(),
    "entry_id" numeric,
    "title" text,
    "referral_header_id" text
);


alter table "public"."rm_risks" enable row level security;

create table "public"."service_profiles" (
    "pk_service_profile_id" uuid not null default gen_random_uuid(),
    "fk_service_id" uuid,
    "status" text,
    "total_on_roll_2023" numeric,
    "service_pan_2023" numeric,
    "total_on_roll_2024" numeric,
    "head_teacher_photo" text,
    "head_teacher_photo_url" text,
    "head_teacher_signature" text,
    "head_teacher_signature_url" text,
    "service_pan_2024" numeric,
    "address_line1" text,
    "address_line2" text,
    "address_city" text,
    "address_county" text,
    "address_postcode" text,
    "phone" text,
    "head_teacher_name" text,
    "admission_email" text,
    "admin_name" text,
    "admin_email" text,
    "student_drive_path" text,
    "logo_url" text,
    "logo" text,
    "survey_link" text,
    "head_teacher_message" text,
    "safeguarding_group" text,
    "regional" text,
    "rol" text
);


alter table "public"."service_profiles" enable row level security;

create table "public"."services" (
    "id" uuid not null default uuid_generate_v4(),
    "service_name" text,
    "location" text,
    "status" text,
    "created_at" timestamp with time zone default now(),
    "initials" text
);


alter table "public"."services" enable row level security;

create table "public"."sow_header" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "curr_map_header_id" uuid,
    "base_group_id" uuid,
    "sow_type" text,
    "name" text,
    "summary" text,
    "industry_expert" text,
    "beautiful_work" text,
    "public_presentation" text,
    "community_impact" text,
    "resources_required" text,
    "pshe_links" text,
    "pfa_links" text,
    "category" text,
    "task" text,
    "formative_assesment" text,
    "extension_task" text,
    "fk_created_by" uuid,
    "sow_active" boolean default true
);


alter table "public"."sow_header" enable row level security;

create table "public"."sow_plan" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "sow_header_id" uuid,
    "week_id" uuid,
    "resources" text,
    "pfa_links" text,
    "task" text,
    "extension" text,
    "pillar_focus" text,
    "assessment" text
);


alter table "public"."sow_plan" enable row level security;

create table "public"."sow_steps" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "sow_header_id" uuid,
    "step_name" text,
    "summary" text,
    "sorting" bigint
);


alter table "public"."sow_steps" enable row level security;

create table "public"."sow_texts" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "sow_header_id" uuid,
    "curr_map_text_id" uuid
);


alter table "public"."sow_texts" enable row level security;

create table "public"."sow_topics" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "curr_map_topic_id" uuid,
    "sow_header_id" uuid
);


alter table "public"."sow_topics" enable row level security;

create table "public"."student_admissions" (
    "id" uuid not null default gen_random_uuid(),
    "student_id" uuid,
    "service_id" uuid,
    "local_authority_id" uuid,
    "date_of_birth" date,
    "age" bigint,
    "start_date" date,
    "end_date" date,
    "status" text,
    "uln_uci" text,
    "diagnosis" text,
    "nationality" text,
    "ethnicity" text,
    "religion" text,
    "sex" text,
    "gender_identity" text,
    "last_school_attended" text,
    "previous_placement_info" text,
    "current_home_address" text,
    "current_home_address_city" text,
    "current_home_address_state" text,
    "current_home_address_zip" text,
    "current_home_address_street1" text,
    "current_home_address_street2" text,
    "previous_home_address" text,
    "previous_home_address_city" text,
    "previous_home_address_state" text,
    "previous_home_address_zip" text,
    "previous_home_address_street1" text,
    "previous_home_address_street2" text,
    "destination" text,
    "created_at" timestamp with time zone default now(),
    "knack_id" text
);


alter table "public"."student_admissions" enable row level security;

create table "public"."student_ap" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "student_id" uuid,
    "date_start" date,
    "date_end" date,
    "status" text,
    "provider_id" uuid,
    "reason" text
);


alter table "public"."student_ap" enable row level security;

create table "public"."student_assessment_tracking" (
    "pk_student_assesment_tracking_id" uuid not null default gen_random_uuid(),
    "fk_account_id" uuid,
    "fk_join_student_assessment_id" uuid,
    "fk_previous_score_id" uuid,
    "fk_new_score_id" uuid,
    "created_at" timestamp with time zone not null default now(),
    "old_date" date,
    "new_date" date,
    "old_entrance_status" text,
    "new_entrance_status" text,
    "old_pillar_level" text,
    "new_pillar_level" text,
    "fk_student_pillar_level_id" uuid,
    "old_score_numeric " numeric,
    "new_score_numeric " numeric
);


alter table "public"."student_assessment_tracking" enable row level security;

create table "public"."student_assessments" (
    "pk_assessments_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "assessment_name" text,
    "assessment_type" text,
    "assessment_date" date,
    "fk_criteria_type_id" uuid,
    "show_on_profile" boolean,
    "grouping_name" text,
    "grouping_order" bigint,
    "status" text,
    "entrance_status_required" boolean default true,
    "display_colour" text
);


alter table "public"."student_assessments" enable row level security;

create table "public"."student_ilp_header" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "student_id" uuid,
    "curr_map_header_id" uuid,
    "status" text
);


alter table "public"."student_ilp_header" enable row level security;

create table "public"."student_milestone_assessments" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "milestone_id" uuid,
    "milestone_completed" boolean,
    "evidence" text,
    "updated_at" timestamp with time zone
);


alter table "public"."student_milestone_assessments" enable row level security;

create table "public"."student_milestones" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "target_id" uuid,
    "milestone" text,
    "status" text default 'Active'::text
);


alter table "public"."student_milestones" enable row level security;

create table "public"."student_needsoutcomes" (
    "id" uuid not null default gen_random_uuid(),
    "service_id" uuid,
    "student_id" uuid,
    "ehcp_category_id" uuid,
    "description" text default ''::text,
    "source" text default ''::text,
    "status" text default ''::text,
    "type" text default ''::text,
    "when" text default ''::text,
    "created_at" timestamp with time zone default now(),
    "knack_id" text
);


alter table "public"."student_needsoutcomes" enable row level security;

create table "public"."student_pillar_levels" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "student_id" uuid,
    "subject_id" uuid,
    "level" text,
    "pillar_id" uuid,
    "updated_at" timestamp with time zone
);


alter table "public"."student_pillar_levels" enable row level security;

create table "public"."student_target_assessments" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_target_id" uuid,
    "target_completed" text,
    "updated_at" timestamp with time zone
);


alter table "public"."student_target_assessments" enable row level security;

create table "public"."student_targets" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "service_id" uuid,
    "student_id" uuid,
    "needsoutcomes_id" uuid,
    "ehcp_category_id" uuid,
    "target_cache_id" uuid,
    "type" text,
    "ehcp_target" text,
    "display_target" text,
    "status" text default 'Active'::text
);


alter table "public"."student_targets" enable row level security;

create table "public"."students" (
    "id" uuid not null default gen_random_uuid(),
    "service_id" uuid,
    "group_id" uuid,
    "name_full" text default ''::text,
    "name_first" text default ''::text,
    "name_last" text default ''::text,
    "name_preferred" text default ''::text,
    "display_student_name" text default ''::text,
    "initials" text default ''::text,
    "context" text default ''::text,
    "has_ap" boolean default false,
    "ap_type" text default ''::text,
    "has_cpp" boolean default false,
    "has_isp" boolean default false,
    "has_medical_consent" boolean default false,
    "has_medication" boolean default false,
    "has_peep" boolean default false,
    "has_taf" boolean default false,
    "health_needs" text default ''::text,
    "is_cin" boolean default false,
    "is_lac" boolean default false,
    "count_ilps" numeric default '0'::numeric,
    "count_needs" numeric default '0'::numeric,
    "count_outcomes" numeric default '0'::numeric,
    "created_at" timestamp with time zone default now(),
    "knack_id" text
);


alter table "public"."students" enable row level security;

create table "public"."tasklists" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "project_id" uuid,
    "name" text
);


alter table "public"."tasklists" enable row level security;

create table "public"."temp_import_student_admissions" (
    "Service" text,
    "Student" text,
    "StartDate" text,
    "EndDate" text,
    "LocalAuthority" text,
    "DOB" text,
    "Age" text,
    "Status" text,
    "Nationality" text,
    "Ethnicity" text,
    "Religion" text,
    "Diagnosis" text,
    "CurrentHomeAddress" text,
    "CurrentHomeAddress : Street 1" text,
    "CurrentHomeAddress : Street 2" text,
    "CurrentHomeAddress : City" text,
    "CurrentHomeAddress : State" text,
    "CurrentHomeAddress : Zip" text,
    "CurrentHomeAddress : Country" text,
    "CurrentHomeAddress : Latitude" text,
    "CurrentHomeAddress : Longitude" text,
    "PreviousHomeAddress" text,
    "PreviousHomeAddress : Street 1" text,
    "PreviousHomeAddress : Street 2" text,
    "PreviousHomeAddress : City" text,
    "PreviousHomeAddress : State" text,
    "PreviousHomeAddress : Zip" text,
    "PreviousHomeAddress : Country" text,
    "PreviousHomeAddress : Latitude" text,
    "PreviousHomeAddress : Longitude" text,
    "LastSchoolAttended" text,
    "DateCreated" text,
    "PreviousPlacementAdditionalInfo" text,
    "ULN/UCI" text,
    "Destination" text,
    "bUpdate" text,
    "AutoIncrement" text,
    "EntryID" text,
    "bLAC" text,
    "Sex" text,
    "LastUpdated" text,
    "SGSent" text,
    "supabase_id" text,
    "student_supabase_id" text,
    "id" uuid not null default gen_random_uuid()
);


alter table "public"."temp_import_student_admissions" enable row level security;

create table "public"."temp_import_students" (
    "fullname" text,
    "FullName : Title" text,
    "first_name" text,
    "FullName : Middle" text,
    "last_name" text,
    "initials" text,
    "Service" text,
    "Group" text,
    "context" text,
    "healthneeds" text,
    "status" text,
    "ap" boolean,
    "aptype" text,
    "isp" boolean,
    "blac" boolean,
    "bcpp" boolean,
    "bcin" boolean,
    "btaf" boolean,
    "dstudentname" text,
    "AutoIncrement" text,
    "EntryID" text,
    "bUpdate" text,
    "countneeds" numeric,
    "countoutcomes" numeric,
    "CountNeedsCard" text,
    "dSmallInitials" text,
    "dColour" text,
    "dInitials" text,
    "PEEP" text,
    "medicalconsent" boolean,
    "medication" boolean,
    "supabase_id" uuid,
    "service_supabase_id" uuid,
    "id" uuid not null default gen_random_uuid()
);


alter table "public"."temp_import_students" enable row level security;

create table "public"."temp_imported_outcomes" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "description" text,
    "type" text,
    "ehcp_category" text,
    "source" text,
    "when" text,
    "status" text,
    "service" text,
    "student" text,
    "datecreated" text,
    "dateupdated" text,
    "entryid" numeric,
    "lookup" text,
    "service_id" uuid,
    "student_id" uuid,
    "ehcp_category_id" uuid,
    "already_imported" text default 'no'::text
);


alter table "public"."temp_imported_outcomes" enable row level security;

create table "public"."temp_targetcheck" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "topicid" uuid default gen_random_uuid(),
    "subjectid" uuid default gen_random_uuid(),
    "pillarid" uuid default gen_random_uuid(),
    "target" text,
    "oldid" uuid
);


alter table "public"."temp_targetcheck" enable row level security;

create table "public"."terms" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone default now(),
    "name" text,
    "academic_year_id" uuid,
    "sorting" bigint,
    "start_date" date,
    "end_date" date
);


alter table "public"."terms" enable row level security;

create table "public"."test_mr" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "test_data" character varying
);


create table "public"."threads" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "thread_type" text,
    "thread_content" jsonb
);


alter table "public"."threads" enable row level security;

create table "public"."ticket_messages" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_account_id" uuid,
    "message" text,
    "message_type" text,
    "fk_ticket_id" uuid,
    "message_attachment" text
);


alter table "public"."ticket_messages" enable row level security;

create table "public"."ticket_status_history" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_updated_by" uuid default gen_random_uuid(),
    "fk_ticket_id" uuid,
    "change" text
);


alter table "public"."ticket_status_history" enable row level security;

create table "public"."tickets" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_creator_id" uuid,
    "fk_agent_id" uuid,
    "fk_status_id" uuid,
    "fk_merged_user_id" text[],
    "fk_type_id" uuid,
    "fk_app_id" uuid,
    "fk_internal_thread_id" uuid,
    "fk_external_thread_id" uuid,
    "fk_category_id" uuid,
    "location" text,
    "priority" text,
    "links" text,
    "details" text,
    "title" text,
    "urgency" text,
    "importance" text,
    "assigned_queue" text,
    "fk_subcategory_id" uuid,
    "fk_development_thread_id" uuid,
    "ticket_number" bigint not null default nextval('tickets_ticket_number_seq'::regclass),
    "screenshot1" text,
    "screenshot2" text,
    "screenshot3" text,
    "fk_service_id" uuid,
    "fk_awaiting_response" uuid,
    "status_history" jsonb,
    "fk_ticket_group_id" uuid,
    "last_response" date,
    "fk_ticket_reason" uuid,
    "fk_ticket_sub_reason" uuid,
    "fk_ticket_queue" uuid,
    "active" text default 'Active'::text,
    "times_chased" numeric default '0'::numeric
);


alter table "public"."tickets" enable row level security;

create table "public"."tmp_live_status" (
    "created_at" timestamp with time zone not null default now(),
    "display_child" text,
    "fk_status_id" text,
    "service_name" text,
    "service_id" text,
    "status" text,
    "entry_status" text,
    "days_at_stage" text,
    "all_days_count" text,
    "id" text not null
);


alter table "public"."tmp_live_status" enable row level security;

create table "public"."weeks" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "week_number" smallint,
    "term_id" uuid,
    "week_start" date
);


alter table "public"."weeks" enable row level security;

create table "public"."weweb_events" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "start_date" timestamp without time zone,
    "end_date" timestamp without time zone,
    "icon_url" character varying,
    "header" character varying,
    "body" character varying,
    "link" character varying,
    "calendar_id" uuid,
    "category_id" uuid,
    "category_name" character varying
);


create table "public"."weweb_students" (
    "pk_student_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "fk_year_group_id" uuid default gen_random_uuid(),
    "forename" text,
    "surname" text,
    "photo" text,
    "fk_form_group_id" uuid
);


create table "public"."weweb_year_groups" (
    "pk_year_group_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "name" text,
    "student_count" numeric,
    "sequence" numeric
);


create table "public"."workflows" (
    "created_at" timestamp with time zone not null default now(),
    "workflow_name" text,
    "last_run" timestamp without time zone default now(),
    "id" uuid not null default gen_random_uuid()
);


alter table "public"."workflows" enable row level security;

alter sequence "public"."tickets_ticket_number_seq" owned by "public"."tickets"."ticket_number";

CREATE UNIQUE INDEX "Student_target_assessment_history_pkey" ON public."Student_target_assessment_history" USING btree (id);

CREATE UNIQUE INDEX "Workflows_pkey" ON public.workflows USING btree (id);

CREATE UNIQUE INDEX academic_years_pkey ON public.academic_years USING btree (id);

CREATE INDEX account_index ON public.accounts USING btree (email);

CREATE UNIQUE INDEX account_services_id_key ON public.join_account_services USING btree (id);

CREATE UNIQUE INDEX account_services_pkey ON public.join_account_services USING btree (id);

CREATE UNIQUE INDEX accounts_id_key ON public.accounts USING btree (id);

CREATE UNIQUE INDEX accounts_pkey ON public.accounts USING btree (id);

CREATE UNIQUE INDEX actions_id_key ON public.actions USING btree (id);

CREATE UNIQUE INDEX actions_pkey ON public.actions USING btree (id);

CREATE UNIQUE INDEX activities_pkey ON public.activities USING btree (id);

CREATE UNIQUE INDEX activity_followup_header_pkey ON public.activity_followup_header USING btree (id);

CREATE UNIQUE INDEX activity_followup_incident_safeguarding_pkey ON public.activity_followup_incident_safeguarding USING btree (id);

CREATE UNIQUE INDEX activity_followup_notification_pkey ON public.activity_followup_notification USING btree (id);

CREATE UNIQUE INDEX activity_followup_pi_pkey ON public.activity_followup_pi USING btree (id);

CREATE UNIQUE INDEX activity_pi_interventions_pkey ON public.activity_pi_interventions USING btree (id);

CREATE UNIQUE INDEX activity_pi_pkey ON public.activity_pi USING btree (id);

CREATE UNIQUE INDEX activity_safeguarding_pkey ON public.activity_safeguarding USING btree (id);

CREATE UNIQUE INDEX aims_pkey ON public.aims USING btree (id);

CREATE UNIQUE INDEX applications_pkey ON public.applications USING btree (id);

CREATE UNIQUE INDEX assessments_pkey ON public.student_assessments USING btree (pk_assessments_id);

CREATE UNIQUE INDEX attendance_pkey ON public.attendance USING btree (id);

CREATE UNIQUE INDEX audit_pkey ON public.student_assessment_tracking USING btree (pk_student_assesment_tracking_id);

CREATE UNIQUE INDEX child_contacts_pkey ON public.join_child_contacts USING btree (id);

CREATE INDEX child_index ON public.children USING btree (child_name);

CREATE UNIQUE INDEX children_pkey ON public.children USING btree (id);

CREATE UNIQUE INDEX contacts_pkey ON public.contacts USING btree (id);

CREATE UNIQUE INDEX contextual_overview_pkey ON public.contextual_overview USING btree (id);

CREATE UNIQUE INDEX curr_map_header_pkey ON public.curr_map_header USING btree (id);

CREATE UNIQUE INDEX curr_map_phases_pkey ON public.curr_map_phases USING btree (id);

CREATE UNIQUE INDEX curr_map_texts_pkey ON public.curr_map_texts USING btree (id);

CREATE UNIQUE INDEX curr_map_topics_pkey ON public.curr_map_topics USING btree (id);

CREATE UNIQUE INDEX debriefs_pkey ON public.debriefs USING btree (id);

CREATE UNIQUE INDEX development_items_pkey ON public.development_items USING btree (id);

CREATE UNIQUE INDEX join_account_activity_pkey ON public.join_account_activity USING btree (id);

CREATE UNIQUE INDEX join_application_accounts_pkey ON public.join_application_accounts USING btree (id);

CREATE UNIQUE INDEX join_debrief_action_pkey ON public.join_debrief_action USING btree (id);

CREATE UNIQUE INDEX join_plan_steps_pkey ON public.join_plan_steps USING btree (id);

CREATE UNIQUE INDEX join_plan_student_milestones_pkey ON public.join_plan_student_milestones USING btree (id);

CREATE UNIQUE INDEX join_plan_students_pkey ON public.join_plan_students USING btree (id);

CREATE UNIQUE INDEX join_project_accounts_pkey ON public.join_project_accounts USING btree (id);

CREATE UNIQUE INDEX join_project_aims_pkey ON public.join_project_aims USING btree (id);

CREATE UNIQUE INDEX join_service_terms_pkey ON public.join_service_terms USING btree (id);

CREATE UNIQUE INDEX join_sow_ent_skup_pkey ON public.join_sow_ent_skup USING btree (id);

CREATE UNIQUE INDEX join_student_activity_pkey ON public.join_student_activity USING btree (id);

CREATE UNIQUE INDEX join_student_assessments2_pkey ON public.join_student_assessments USING btree (pk_join_student_assessments_id);

CREATE UNIQUE INDEX join_student_base_group_pkey ON public.join_student_base_group USING btree (id);

CREATE UNIQUE INDEX join_student_contacts_pkey ON public.join_student_contacts USING btree (id);

CREATE UNIQUE INDEX join_target_ilps_pkey ON public.join_target_ilps USING btree (id);

CREATE UNIQUE INDEX join_tasklist_aims_pkey ON public.join_tasklist_aims USING btree (id);

CREATE UNIQUE INDEX join_tickets_pkey ON public.join_tickets USING btree (id);

CREATE UNIQUE INDEX join_tickets_users_pkey ON public.join_tickets_users USING btree (id);

CREATE UNIQUE INDEX links_pkey ON public.links USING btree (id);

CREATE UNIQUE INDEX lu_admissions_reports_pkey ON public.lu_admissions_reports USING btree (id);

CREATE UNIQUE INDEX lu_attendance_codes_pkey ON public.lu_attendance_codes USING btree (id);

CREATE UNIQUE INDEX lu_criteria_type_pkey ON public.lu_criteria_type USING btree (pk_criteria_type_id);

CREATE UNIQUE INDEX lu_criteria_values_pkey ON public.lu_criteria_values USING btree (pk_criteria_value_id);

CREATE UNIQUE INDEX lu_destinations_pkey ON public.lu_destinations USING btree (id);

CREATE UNIQUE INDEX lu_ehcp_categories_pkey ON public.lu_ehcp_categories USING btree (id);

CREATE UNIQUE INDEX lu_literacy_texts_pkey ON public.lu_literacy_texts USING btree (id);

CREATE UNIQUE INDEX lu_phases_pkey ON public.lu_phases USING btree (id);

CREATE UNIQUE INDEX lu_pillar_cache_pkey ON public.lu_pillar_cache USING btree (id);

CREATE UNIQUE INDEX lu_pillar_subject_cache_pkey ON public.lu_pillar_subject_cache USING btree (id);

CREATE UNIQUE INDEX lu_record_categories_pkey ON public.lu_record_categories USING btree (id);

CREATE UNIQUE INDEX lu_record_subcategories_pkey ON public.lu_record_subcategories USING btree (id);

CREATE UNIQUE INDEX lu_risk_categories_pkey ON public.lu_risk_categories USING btree (id);

CREATE UNIQUE INDEX lu_risk_subcategories_pkey ON public.lu_risk_subcategories USING btree (id);

CREATE UNIQUE INDEX lu_sow_steps_pkey ON public.lu_sow_steps USING btree (id);

CREATE UNIQUE INDEX lu_target_cache_pkey ON public.lu_pillar_target_cache USING btree (id);

CREATE UNIQUE INDEX lu_themes_pkey ON public.lu_themes USING btree (id);

CREATE UNIQUE INDEX lu_ticket_categories_pkey ON public.lu_ticket_categories USING btree (id);

CREATE UNIQUE INDEX lu_ticket_group_pkey ON public.lu_ticket_group USING btree (id);

CREATE UNIQUE INDEX lu_ticket_queue_pkey ON public.lu_ticket_queue USING btree (id);

CREATE UNIQUE INDEX lu_ticket_reasons_pkey ON public.lu_ticket_reasons USING btree (id);

CREATE UNIQUE INDEX lu_ticket_status_pkey ON public.lu_ticket_status USING btree (id);

CREATE UNIQUE INDEX lu_ticket_sub_reasons_pkey ON public.lu_ticket_sub_reasons USING btree (id);

CREATE UNIQUE INDEX lu_ticket_subcategories_pkey ON public.lu_ticket_subcategories USING btree (id);

CREATE UNIQUE INDEX lu_ticket_types_pkey ON public.lu_ticket_types USING btree (id);

CREATE UNIQUE INDEX lu_topic_cache_pkey ON public.lu_pillar_topic_cache USING btree (id);

CREATE UNIQUE INDEX meetings_pkey ON public.meetings USING btree (pk_meetings_id);

CREATE UNIQUE INDEX notification_distribution_pkey ON public.notification_distribution USING btree (id);

CREATE UNIQUE INDEX notification_header_pkey ON public.notification_header USING btree (id);

CREATE UNIQUE INDEX organisations_id_key ON public.organisations USING btree (id);

CREATE UNIQUE INDEX organisations_pkey ON public.organisations USING btree (id);

CREATE UNIQUE INDEX progress_notes_pkey ON public.progress_notes USING btree (id);

CREATE UNIQUE INDEX projects_pkey ON public.projects USING btree (id);

CREATE UNIQUE INDEX ref_statuses_pkey ON public.lu_ref_status USING btree (id);

CREATE UNIQUE INDEX referral_details_pkey ON public.referral_details USING btree (pk_referral_details_id);

CREATE UNIQUE INDEX referral_header_pkey ON public.referral_header USING btree (pk_referral_header_id);

CREATE INDEX referral_index ON public.referrals USING btree (display_child);

CREATE UNIQUE INDEX referral_stages_pkey ON public.lu_ref_stage USING btree (id);

CREATE UNIQUE INDEX referral_status_history_pkey ON public.referral_status_history USING btree (id);

CREATE UNIQUE INDEX referral_status_pkey ON public.join_referral_status USING btree (id);

CREATE UNIQUE INDEX referrals_id_key ON public.referrals USING btree (id);

CREATE UNIQUE INDEX referrals_pkey ON public.referrals USING btree (id);

CREATE UNIQUE INDEX referrals_stage1_pkey ON public.referrals_stage1 USING btree (id);

CREATE UNIQUE INDEX referrals_stage2_pkey ON public.referrals_stage2 USING btree (id);

CREATE UNIQUE INDEX referrals_stage3_pkey ON public.referrals_stage3 USING btree (id);

CREATE UNIQUE INDEX referrals_stage4_pkey ON public.referrals_stage4 USING btree (id);

CREATE UNIQUE INDEX referrals_stage5_pkey ON public.referrals_stage5 USING btree (id);

CREATE UNIQUE INDEX referrals_stage6_pkey ON public.referrals_stage6 USING btree (id);

CREATE UNIQUE INDEX report_details_pkey ON public.report_details USING btree (pk_report_details_id);

CREATE UNIQUE INDEX report_header_pkey ON public.report_header USING btree (pk_report_header_id);

CREATE UNIQUE INDEX risks_pkey ON public.risks USING btree (id);

CREATE UNIQUE INDEX rm_risks_pkey ON public.rm_risks USING btree (pk_risk_id);

CREATE UNIQUE INDEX service_groups_pkey ON public.base_groups USING btree (id);

CREATE UNIQUE INDEX service_profiles_pkey ON public.service_profiles USING btree (pk_service_profile_id);

CREATE UNIQUE INDEX services_id_key ON public.services USING btree (id);

CREATE UNIQUE INDEX services_pkey ON public.services USING btree (id);

CREATE UNIQUE INDEX sow_header_pkey ON public.sow_header USING btree (id);

CREATE UNIQUE INDEX sow_plan_pkey ON public.sow_plan USING btree (id);

CREATE UNIQUE INDEX sow_steps_pkey ON public.sow_steps USING btree (id);

CREATE UNIQUE INDEX sow_texts_pkey ON public.sow_texts USING btree (id);

CREATE UNIQUE INDEX sow_topics_pkey ON public.sow_topics USING btree (id);

CREATE UNIQUE INDEX student_activity_incidents_pkey ON public.activity_incident USING btree (id);

CREATE UNIQUE INDEX student_activity_logs_pkey ON public.activity_log USING btree (id);

CREATE UNIQUE INDEX student_activity_pkey ON public.activity_header USING btree (id);

CREATE UNIQUE INDEX student_activity_welfare_pkey ON public.activity_welfare USING btree (id);

CREATE UNIQUE INDEX student_admissions_pkey ON public.student_admissions USING btree (id);

CREATE UNIQUE INDEX student_ap_pkey ON public.student_ap USING btree (id);

CREATE UNIQUE INDEX student_ilp_header_pkey ON public.student_ilp_header USING btree (id);

CREATE UNIQUE INDEX student_milestone_assessments_pkey ON public.student_milestone_assessments USING btree (id);

CREATE UNIQUE INDEX student_milestones_pkey ON public.student_milestones USING btree (id);

CREATE UNIQUE INDEX student_needsoutcomes_pkey ON public.student_needsoutcomes USING btree (id);

CREATE UNIQUE INDEX student_pillar_levels_pkey ON public.student_pillar_levels USING btree (id);

CREATE UNIQUE INDEX student_target_assessments_pkey ON public.student_target_assessments USING btree (id);

CREATE UNIQUE INDEX student_targets_pkey ON public.student_targets USING btree (id);

CREATE UNIQUE INDEX students_pkey ON public.students USING btree (id);

CREATE UNIQUE INDEX tasklists_pkey ON public.tasklists USING btree (id);

CREATE UNIQUE INDEX "temp_Target_Check_pkey" ON public.temp_targetcheck USING btree (id);

CREATE UNIQUE INDEX temp_import_student_admissions_pkey ON public.temp_import_student_admissions USING btree (id);

CREATE UNIQUE INDEX temp_import_students_pkey ON public.temp_import_students USING btree (id);

CREATE UNIQUE INDEX temp_imported_outcomes_pkey ON public.temp_imported_outcomes USING btree (id);

CREATE UNIQUE INDEX terms_pkey ON public.terms USING btree (id);

CREATE UNIQUE INDEX test_mr_pkey ON public.test_mr USING btree (id);

CREATE UNIQUE INDEX threads_pkey ON public.threads USING btree (id);

CREATE UNIQUE INDEX ticket_messages_pkey ON public.ticket_messages USING btree (id);

CREATE UNIQUE INDEX ticket_status_history_pkey ON public.ticket_status_history USING btree (id);

CREATE UNIQUE INDEX tickets_pkey ON public.tickets USING btree (id);

CREATE UNIQUE INDEX tmp_live_status_pkey ON public.tmp_live_status USING btree (id);

CREATE UNIQUE INDEX weeks_pkey ON public.weeks USING btree (id);

CREATE UNIQUE INDEX weweb_events_pkey ON public.weweb_events USING btree (id);

CREATE UNIQUE INDEX weweb_students_pkey ON public.weweb_students USING btree (pk_student_id);

CREATE UNIQUE INDEX weweb_year_groups_pkey ON public.weweb_year_groups USING btree (pk_year_group_id);

alter table "public"."Student_target_assessment_history" add constraint "Student_target_assessment_history_pkey" PRIMARY KEY using index "Student_target_assessment_history_pkey";

alter table "public"."academic_years" add constraint "academic_years_pkey" PRIMARY KEY using index "academic_years_pkey";

alter table "public"."accounts" add constraint "accounts_pkey" PRIMARY KEY using index "accounts_pkey";

alter table "public"."actions" add constraint "actions_pkey" PRIMARY KEY using index "actions_pkey";

alter table "public"."activities" add constraint "activities_pkey" PRIMARY KEY using index "activities_pkey";

alter table "public"."activity_followup_header" add constraint "activity_followup_header_pkey" PRIMARY KEY using index "activity_followup_header_pkey";

alter table "public"."activity_followup_incident_safeguarding" add constraint "activity_followup_incident_safeguarding_pkey" PRIMARY KEY using index "activity_followup_incident_safeguarding_pkey";

alter table "public"."activity_followup_notification" add constraint "activity_followup_notification_pkey" PRIMARY KEY using index "activity_followup_notification_pkey";

alter table "public"."activity_followup_pi" add constraint "activity_followup_pi_pkey" PRIMARY KEY using index "activity_followup_pi_pkey";

alter table "public"."activity_header" add constraint "student_activity_pkey" PRIMARY KEY using index "student_activity_pkey";

alter table "public"."activity_incident" add constraint "student_activity_incidents_pkey" PRIMARY KEY using index "student_activity_incidents_pkey";

alter table "public"."activity_log" add constraint "student_activity_logs_pkey" PRIMARY KEY using index "student_activity_logs_pkey";

alter table "public"."activity_pi" add constraint "activity_pi_pkey" PRIMARY KEY using index "activity_pi_pkey";

alter table "public"."activity_pi_interventions" add constraint "activity_pi_interventions_pkey" PRIMARY KEY using index "activity_pi_interventions_pkey";

alter table "public"."activity_safeguarding" add constraint "activity_safeguarding_pkey" PRIMARY KEY using index "activity_safeguarding_pkey";

alter table "public"."activity_welfare" add constraint "student_activity_welfare_pkey" PRIMARY KEY using index "student_activity_welfare_pkey";

alter table "public"."aims" add constraint "aims_pkey" PRIMARY KEY using index "aims_pkey";

alter table "public"."applications" add constraint "applications_pkey" PRIMARY KEY using index "applications_pkey";

alter table "public"."attendance" add constraint "attendance_pkey" PRIMARY KEY using index "attendance_pkey";

alter table "public"."base_groups" add constraint "service_groups_pkey" PRIMARY KEY using index "service_groups_pkey";

alter table "public"."children" add constraint "children_pkey" PRIMARY KEY using index "children_pkey";

alter table "public"."contacts" add constraint "contacts_pkey" PRIMARY KEY using index "contacts_pkey";

alter table "public"."contextual_overview" add constraint "contextual_overview_pkey" PRIMARY KEY using index "contextual_overview_pkey";

alter table "public"."curr_map_header" add constraint "curr_map_header_pkey" PRIMARY KEY using index "curr_map_header_pkey";

alter table "public"."curr_map_phases" add constraint "curr_map_phases_pkey" PRIMARY KEY using index "curr_map_phases_pkey";

alter table "public"."curr_map_texts" add constraint "curr_map_texts_pkey" PRIMARY KEY using index "curr_map_texts_pkey";

alter table "public"."curr_map_topics" add constraint "curr_map_topics_pkey" PRIMARY KEY using index "curr_map_topics_pkey";

alter table "public"."debriefs" add constraint "debriefs_pkey" PRIMARY KEY using index "debriefs_pkey";

alter table "public"."development_items" add constraint "development_items_pkey" PRIMARY KEY using index "development_items_pkey";

alter table "public"."join_account_activity" add constraint "join_account_activity_pkey" PRIMARY KEY using index "join_account_activity_pkey";

alter table "public"."join_account_services" add constraint "account_services_pkey" PRIMARY KEY using index "account_services_pkey";

alter table "public"."join_application_accounts" add constraint "join_application_accounts_pkey" PRIMARY KEY using index "join_application_accounts_pkey";

alter table "public"."join_child_contacts" add constraint "child_contacts_pkey" PRIMARY KEY using index "child_contacts_pkey";

alter table "public"."join_debrief_action" add constraint "join_debrief_action_pkey" PRIMARY KEY using index "join_debrief_action_pkey";

alter table "public"."join_plan_steps" add constraint "join_plan_steps_pkey" PRIMARY KEY using index "join_plan_steps_pkey";

alter table "public"."join_plan_student_milestones" add constraint "join_plan_student_milestones_pkey" PRIMARY KEY using index "join_plan_student_milestones_pkey";

alter table "public"."join_plan_students" add constraint "join_plan_students_pkey" PRIMARY KEY using index "join_plan_students_pkey";

alter table "public"."join_project_accounts" add constraint "join_project_accounts_pkey" PRIMARY KEY using index "join_project_accounts_pkey";

alter table "public"."join_project_aims" add constraint "join_project_aims_pkey" PRIMARY KEY using index "join_project_aims_pkey";

alter table "public"."join_referral_status" add constraint "referral_status_pkey" PRIMARY KEY using index "referral_status_pkey";

alter table "public"."join_service_terms" add constraint "join_service_terms_pkey" PRIMARY KEY using index "join_service_terms_pkey";

alter table "public"."join_sow_ent_skup" add constraint "join_sow_ent_skup_pkey" PRIMARY KEY using index "join_sow_ent_skup_pkey";

alter table "public"."join_student_activity" add constraint "join_student_activity_pkey" PRIMARY KEY using index "join_student_activity_pkey";

alter table "public"."join_student_assessments" add constraint "join_student_assessments2_pkey" PRIMARY KEY using index "join_student_assessments2_pkey";

alter table "public"."join_student_base_group" add constraint "join_student_base_group_pkey" PRIMARY KEY using index "join_student_base_group_pkey";

alter table "public"."join_student_contacts" add constraint "join_student_contacts_pkey" PRIMARY KEY using index "join_student_contacts_pkey";

alter table "public"."join_target_ilps" add constraint "join_target_ilps_pkey" PRIMARY KEY using index "join_target_ilps_pkey";

alter table "public"."join_tasklist_aims" add constraint "join_tasklist_aims_pkey" PRIMARY KEY using index "join_tasklist_aims_pkey";

alter table "public"."join_tickets" add constraint "join_tickets_pkey" PRIMARY KEY using index "join_tickets_pkey";

alter table "public"."join_tickets_users" add constraint "join_tickets_users_pkey" PRIMARY KEY using index "join_tickets_users_pkey";

alter table "public"."links" add constraint "links_pkey" PRIMARY KEY using index "links_pkey";

alter table "public"."lu_admissions_reports" add constraint "lu_admissions_reports_pkey" PRIMARY KEY using index "lu_admissions_reports_pkey";

alter table "public"."lu_attendance_codes" add constraint "lu_attendance_codes_pkey" PRIMARY KEY using index "lu_attendance_codes_pkey";

alter table "public"."lu_criteria_type" add constraint "lu_criteria_type_pkey" PRIMARY KEY using index "lu_criteria_type_pkey";

alter table "public"."lu_criteria_values" add constraint "lu_criteria_values_pkey" PRIMARY KEY using index "lu_criteria_values_pkey";

alter table "public"."lu_destinations" add constraint "lu_destinations_pkey" PRIMARY KEY using index "lu_destinations_pkey";

alter table "public"."lu_ehcp_categories" add constraint "lu_ehcp_categories_pkey" PRIMARY KEY using index "lu_ehcp_categories_pkey";

alter table "public"."lu_literacy_texts" add constraint "lu_literacy_texts_pkey" PRIMARY KEY using index "lu_literacy_texts_pkey";

alter table "public"."lu_phases" add constraint "lu_phases_pkey" PRIMARY KEY using index "lu_phases_pkey";

alter table "public"."lu_pillar_cache" add constraint "lu_pillar_cache_pkey" PRIMARY KEY using index "lu_pillar_cache_pkey";

alter table "public"."lu_pillar_subject_cache" add constraint "lu_pillar_subject_cache_pkey" PRIMARY KEY using index "lu_pillar_subject_cache_pkey";

alter table "public"."lu_pillar_target_cache" add constraint "lu_target_cache_pkey" PRIMARY KEY using index "lu_target_cache_pkey";

alter table "public"."lu_pillar_topic_cache" add constraint "lu_topic_cache_pkey" PRIMARY KEY using index "lu_topic_cache_pkey";

alter table "public"."lu_record_categories" add constraint "lu_record_categories_pkey" PRIMARY KEY using index "lu_record_categories_pkey";

alter table "public"."lu_record_subcategories" add constraint "lu_record_subcategories_pkey" PRIMARY KEY using index "lu_record_subcategories_pkey";

alter table "public"."lu_ref_stage" add constraint "referral_stages_pkey" PRIMARY KEY using index "referral_stages_pkey";

alter table "public"."lu_ref_status" add constraint "ref_statuses_pkey" PRIMARY KEY using index "ref_statuses_pkey";

alter table "public"."lu_risk_categories" add constraint "lu_risk_categories_pkey" PRIMARY KEY using index "lu_risk_categories_pkey";

alter table "public"."lu_risk_subcategories" add constraint "lu_risk_subcategories_pkey" PRIMARY KEY using index "lu_risk_subcategories_pkey";

alter table "public"."lu_sow_steps" add constraint "lu_sow_steps_pkey" PRIMARY KEY using index "lu_sow_steps_pkey";

alter table "public"."lu_themes" add constraint "lu_themes_pkey" PRIMARY KEY using index "lu_themes_pkey";

alter table "public"."lu_ticket_categories" add constraint "lu_ticket_categories_pkey" PRIMARY KEY using index "lu_ticket_categories_pkey";

alter table "public"."lu_ticket_group" add constraint "lu_ticket_group_pkey" PRIMARY KEY using index "lu_ticket_group_pkey";

alter table "public"."lu_ticket_queue" add constraint "lu_ticket_queue_pkey" PRIMARY KEY using index "lu_ticket_queue_pkey";

alter table "public"."lu_ticket_reasons" add constraint "lu_ticket_reasons_pkey" PRIMARY KEY using index "lu_ticket_reasons_pkey";

alter table "public"."lu_ticket_status" add constraint "lu_ticket_status_pkey" PRIMARY KEY using index "lu_ticket_status_pkey";

alter table "public"."lu_ticket_sub_reasons" add constraint "lu_ticket_sub_reasons_pkey" PRIMARY KEY using index "lu_ticket_sub_reasons_pkey";

alter table "public"."lu_ticket_subcategories" add constraint "lu_ticket_subcategories_pkey" PRIMARY KEY using index "lu_ticket_subcategories_pkey";

alter table "public"."lu_ticket_types" add constraint "lu_ticket_types_pkey" PRIMARY KEY using index "lu_ticket_types_pkey";

alter table "public"."meetings" add constraint "meetings_pkey" PRIMARY KEY using index "meetings_pkey";

alter table "public"."notification_distribution" add constraint "notification_distribution_pkey" PRIMARY KEY using index "notification_distribution_pkey";

alter table "public"."notification_header" add constraint "notification_header_pkey" PRIMARY KEY using index "notification_header_pkey";

alter table "public"."organisations" add constraint "organisations_pkey" PRIMARY KEY using index "organisations_pkey";

alter table "public"."progress_notes" add constraint "progress_notes_pkey" PRIMARY KEY using index "progress_notes_pkey";

alter table "public"."projects" add constraint "projects_pkey" PRIMARY KEY using index "projects_pkey";

alter table "public"."referral_details" add constraint "referral_details_pkey" PRIMARY KEY using index "referral_details_pkey";

alter table "public"."referral_header" add constraint "referral_header_pkey" PRIMARY KEY using index "referral_header_pkey";

alter table "public"."referral_status_history" add constraint "referral_status_history_pkey" PRIMARY KEY using index "referral_status_history_pkey";

alter table "public"."referrals" add constraint "referrals_pkey" PRIMARY KEY using index "referrals_pkey";

alter table "public"."referrals_stage1" add constraint "referrals_stage1_pkey" PRIMARY KEY using index "referrals_stage1_pkey";

alter table "public"."referrals_stage2" add constraint "referrals_stage2_pkey" PRIMARY KEY using index "referrals_stage2_pkey";

alter table "public"."referrals_stage3" add constraint "referrals_stage3_pkey" PRIMARY KEY using index "referrals_stage3_pkey";

alter table "public"."referrals_stage4" add constraint "referrals_stage4_pkey" PRIMARY KEY using index "referrals_stage4_pkey";

alter table "public"."referrals_stage5" add constraint "referrals_stage5_pkey" PRIMARY KEY using index "referrals_stage5_pkey";

alter table "public"."referrals_stage6" add constraint "referrals_stage6_pkey" PRIMARY KEY using index "referrals_stage6_pkey";

alter table "public"."report_details" add constraint "report_details_pkey" PRIMARY KEY using index "report_details_pkey";

alter table "public"."report_header" add constraint "report_header_pkey" PRIMARY KEY using index "report_header_pkey";

alter table "public"."risks" add constraint "risks_pkey" PRIMARY KEY using index "risks_pkey";

alter table "public"."rm_risks" add constraint "rm_risks_pkey" PRIMARY KEY using index "rm_risks_pkey";

alter table "public"."service_profiles" add constraint "service_profiles_pkey" PRIMARY KEY using index "service_profiles_pkey";

alter table "public"."services" add constraint "services_pkey" PRIMARY KEY using index "services_pkey";

alter table "public"."sow_header" add constraint "sow_header_pkey" PRIMARY KEY using index "sow_header_pkey";

alter table "public"."sow_plan" add constraint "sow_plan_pkey" PRIMARY KEY using index "sow_plan_pkey";

alter table "public"."sow_steps" add constraint "sow_steps_pkey" PRIMARY KEY using index "sow_steps_pkey";

alter table "public"."sow_texts" add constraint "sow_texts_pkey" PRIMARY KEY using index "sow_texts_pkey";

alter table "public"."sow_topics" add constraint "sow_topics_pkey" PRIMARY KEY using index "sow_topics_pkey";

alter table "public"."student_admissions" add constraint "student_admissions_pkey" PRIMARY KEY using index "student_admissions_pkey";

alter table "public"."student_ap" add constraint "student_ap_pkey" PRIMARY KEY using index "student_ap_pkey";

alter table "public"."student_assessment_tracking" add constraint "audit_pkey" PRIMARY KEY using index "audit_pkey";

alter table "public"."student_assessments" add constraint "assessments_pkey" PRIMARY KEY using index "assessments_pkey";

alter table "public"."student_ilp_header" add constraint "student_ilp_header_pkey" PRIMARY KEY using index "student_ilp_header_pkey";

alter table "public"."student_milestone_assessments" add constraint "student_milestone_assessments_pkey" PRIMARY KEY using index "student_milestone_assessments_pkey";

alter table "public"."student_milestones" add constraint "student_milestones_pkey" PRIMARY KEY using index "student_milestones_pkey";

alter table "public"."student_needsoutcomes" add constraint "student_needsoutcomes_pkey" PRIMARY KEY using index "student_needsoutcomes_pkey";

alter table "public"."student_pillar_levels" add constraint "student_pillar_levels_pkey" PRIMARY KEY using index "student_pillar_levels_pkey";

alter table "public"."student_target_assessments" add constraint "student_target_assessments_pkey" PRIMARY KEY using index "student_target_assessments_pkey";

alter table "public"."student_targets" add constraint "student_targets_pkey" PRIMARY KEY using index "student_targets_pkey";

alter table "public"."students" add constraint "students_pkey" PRIMARY KEY using index "students_pkey";

alter table "public"."tasklists" add constraint "tasklists_pkey" PRIMARY KEY using index "tasklists_pkey";

alter table "public"."temp_import_student_admissions" add constraint "temp_import_student_admissions_pkey" PRIMARY KEY using index "temp_import_student_admissions_pkey";

alter table "public"."temp_import_students" add constraint "temp_import_students_pkey" PRIMARY KEY using index "temp_import_students_pkey";

alter table "public"."temp_imported_outcomes" add constraint "temp_imported_outcomes_pkey" PRIMARY KEY using index "temp_imported_outcomes_pkey";

alter table "public"."temp_targetcheck" add constraint "temp_Target_Check_pkey" PRIMARY KEY using index "temp_Target_Check_pkey";

alter table "public"."terms" add constraint "terms_pkey" PRIMARY KEY using index "terms_pkey";

alter table "public"."test_mr" add constraint "test_mr_pkey" PRIMARY KEY using index "test_mr_pkey";

alter table "public"."threads" add constraint "threads_pkey" PRIMARY KEY using index "threads_pkey";

alter table "public"."ticket_messages" add constraint "ticket_messages_pkey" PRIMARY KEY using index "ticket_messages_pkey";

alter table "public"."ticket_status_history" add constraint "ticket_status_history_pkey" PRIMARY KEY using index "ticket_status_history_pkey";

alter table "public"."tickets" add constraint "tickets_pkey" PRIMARY KEY using index "tickets_pkey";

alter table "public"."tmp_live_status" add constraint "tmp_live_status_pkey" PRIMARY KEY using index "tmp_live_status_pkey";

alter table "public"."weeks" add constraint "weeks_pkey" PRIMARY KEY using index "weeks_pkey";

alter table "public"."weweb_events" add constraint "weweb_events_pkey" PRIMARY KEY using index "weweb_events_pkey";

alter table "public"."weweb_students" add constraint "weweb_students_pkey" PRIMARY KEY using index "weweb_students_pkey";

alter table "public"."weweb_year_groups" add constraint "weweb_year_groups_pkey" PRIMARY KEY using index "weweb_year_groups_pkey";

alter table "public"."workflows" add constraint "Workflows_pkey" PRIMARY KEY using index "Workflows_pkey";

alter table "public"."Student_target_assessment_history" add constraint "Student_target_assessment_history_fk_student_target_id_fkey" FOREIGN KEY (fk_student_target_id) REFERENCES student_targets(id) not valid;

alter table "public"."Student_target_assessment_history" validate constraint "Student_target_assessment_history_fk_student_target_id_fkey";

alter table "public"."Student_target_assessment_history" add constraint "Student_target_assessment_history_fk_updated_by_fkey" FOREIGN KEY (fk_updated_by) REFERENCES accounts(id) not valid;

alter table "public"."Student_target_assessment_history" validate constraint "Student_target_assessment_history_fk_updated_by_fkey";

alter table "public"."accounts" add constraint "accounts_id_key" UNIQUE using index "accounts_id_key";

alter table "public"."actions" add constraint "actions_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."actions" validate constraint "actions_account_id_fkey";

alter table "public"."actions" add constraint "actions_activity_followup_header_id_fkey" FOREIGN KEY (activity_followup_header_id) REFERENCES activity_followup_header(id) not valid;

alter table "public"."actions" validate constraint "actions_activity_followup_header_id_fkey";

alter table "public"."actions" add constraint "actions_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."actions" validate constraint "actions_activity_id_fkey";

alter table "public"."actions" add constraint "actions_aim_id_fkey" FOREIGN KEY (aim_id) REFERENCES aims(id) not valid;

alter table "public"."actions" validate constraint "actions_aim_id_fkey";

alter table "public"."actions" add constraint "actions_assigned_to_id_fkey" FOREIGN KEY (assigned_to_id) REFERENCES accounts(id) not valid;

alter table "public"."actions" validate constraint "actions_assigned_to_id_fkey";

alter table "public"."actions" add constraint "actions_fk_rm_risk_id_fkey" FOREIGN KEY (fk_rm_risk_id) REFERENCES rm_risks(pk_risk_id) not valid;

alter table "public"."actions" validate constraint "actions_fk_rm_risk_id_fkey";

alter table "public"."actions" add constraint "actions_id_key" UNIQUE using index "actions_id_key";

alter table "public"."actions" add constraint "actions_parent_action_id_fkey" FOREIGN KEY (parent_action_id) REFERENCES actions(id) not valid;

alter table "public"."actions" validate constraint "actions_parent_action_id_fkey";

alter table "public"."actions" add constraint "actions_project_id_fkey" FOREIGN KEY (project_id) REFERENCES projects(id) not valid;

alter table "public"."actions" validate constraint "actions_project_id_fkey";

alter table "public"."actions" add constraint "actions_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."actions" validate constraint "actions_referral_id_fkey";

alter table "public"."actions" add constraint "actions_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."actions" validate constraint "actions_service_id_fkey";

alter table "public"."actions" add constraint "actions_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."actions" validate constraint "actions_student_id_fkey";

alter table "public"."actions" add constraint "actions_tasklist_id_fkey" FOREIGN KEY (tasklist_id) REFERENCES tasklists(id) not valid;

alter table "public"."actions" validate constraint "actions_tasklist_id_fkey";

alter table "public"."actions" add constraint "public_actions_fk_referral_header_id_fkey" FOREIGN KEY (fk_referral_header_id) REFERENCES referral_header(pk_referral_header_id) not valid;

alter table "public"."actions" validate constraint "public_actions_fk_referral_header_id_fkey";

alter table "public"."activities" add constraint "activities_academic_year_id_fkey" FOREIGN KEY (academic_year_id) REFERENCES academic_years(id) not valid;

alter table "public"."activities" validate constraint "activities_academic_year_id_fkey";

alter table "public"."activities" add constraint "activities_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."activities" validate constraint "activities_account_id_fkey";

alter table "public"."activities" add constraint "activities_created_by_fkey" FOREIGN KEY (created_by) REFERENCES accounts(id) not valid;

alter table "public"."activities" validate constraint "activities_created_by_fkey";

alter table "public"."activities" add constraint "activities_main_student_fkey" FOREIGN KEY (main_student) REFERENCES students(id) not valid;

alter table "public"."activities" validate constraint "activities_main_student_fkey";

alter table "public"."activities" add constraint "activities_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."activities" validate constraint "activities_service_id_fkey";

alter table "public"."activities" add constraint "activities_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."activities" validate constraint "activities_student_id_fkey";

alter table "public"."activities" add constraint "activities_updated_account_id_fkey" FOREIGN KEY (updated_account_id) REFERENCES accounts(id) not valid;

alter table "public"."activities" validate constraint "activities_updated_account_id_fkey";

alter table "public"."activity_followup_header" add constraint "activity_followup_header_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_followup_header" validate constraint "activity_followup_header_activity_id_fkey";

alter table "public"."activity_followup_header" add constraint "activity_followup_header_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."activity_followup_header" validate constraint "activity_followup_header_student_id_fkey";

alter table "public"."activity_followup_incident_safeguarding" add constraint "activity_followup_incident_safeguarding_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_followup_incident_safeguarding" validate constraint "activity_followup_incident_safeguarding_activity_id_fkey";

alter table "public"."activity_followup_incident_safeguarding" add constraint "activity_followup_incident_safeguarding_followup_header_id_fkey" FOREIGN KEY (followup_header_id) REFERENCES activity_followup_header(id) not valid;

alter table "public"."activity_followup_incident_safeguarding" validate constraint "activity_followup_incident_safeguarding_followup_header_id_fkey";

alter table "public"."activity_followup_notification" add constraint "activity_followup_notification_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_followup_notification" validate constraint "activity_followup_notification_activity_id_fkey";

alter table "public"."activity_followup_notification" add constraint "activity_followup_notification_followup_header_id_fkey" FOREIGN KEY (followup_header_id) REFERENCES activity_followup_header(id) not valid;

alter table "public"."activity_followup_notification" validate constraint "activity_followup_notification_followup_header_id_fkey";

alter table "public"."activity_followup_pi" add constraint "activity_followup_pi_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_followup_pi" validate constraint "activity_followup_pi_activity_id_fkey";

alter table "public"."activity_followup_pi" add constraint "activity_followup_pi_followup_header_id_fkey" FOREIGN KEY (followup_header_id) REFERENCES activity_followup_header(id) not valid;

alter table "public"."activity_followup_pi" validate constraint "activity_followup_pi_followup_header_id_fkey";

alter table "public"."activity_header" add constraint "activity_header_academic_year_id_fkey" FOREIGN KEY (academic_year_id) REFERENCES academic_years(id) not valid;

alter table "public"."activity_header" validate constraint "activity_header_academic_year_id_fkey";

alter table "public"."activity_header" add constraint "activity_header_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."activity_header" validate constraint "activity_header_account_id_fkey";

alter table "public"."activity_header" add constraint "activity_header_created_by_fkey" FOREIGN KEY (created_by) REFERENCES accounts(id) not valid;

alter table "public"."activity_header" validate constraint "activity_header_created_by_fkey";

alter table "public"."activity_header" add constraint "activity_header_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."activity_header" validate constraint "activity_header_service_id_fkey";

alter table "public"."activity_header" add constraint "activity_header_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."activity_header" validate constraint "activity_header_student_id_fkey";

alter table "public"."activity_header" add constraint "activity_header_updated_account_id_fkey" FOREIGN KEY (updated_account_id) REFERENCES accounts(id) not valid;

alter table "public"."activity_header" validate constraint "activity_header_updated_account_id_fkey";

alter table "public"."activity_incident" add constraint "activity_incident_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_incident" validate constraint "activity_incident_activity_id_fkey";

alter table "public"."activity_log" add constraint "activity_log_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_log" validate constraint "activity_log_activity_id_fkey";

alter table "public"."activity_pi" add constraint "activity_pi_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_pi" validate constraint "activity_pi_activity_id_fkey";

alter table "public"."activity_pi_interventions" add constraint "activity_pi_interventions_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."activity_pi_interventions" validate constraint "activity_pi_interventions_account_id_fkey";

alter table "public"."activity_pi_interventions" add constraint "activity_pi_interventions_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_pi_interventions" validate constraint "activity_pi_interventions_activity_id_fkey";

alter table "public"."activity_safeguarding" add constraint "activity_safeguarding_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_safeguarding" validate constraint "activity_safeguarding_activity_id_fkey";

alter table "public"."activity_welfare" add constraint "activity_welfare_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."activity_welfare" validate constraint "activity_welfare_activity_id_fkey";

alter table "public"."aims" add constraint "aims_academic_year_id_fkey" FOREIGN KEY (academic_year_id) REFERENCES academic_years(id) not valid;

alter table "public"."aims" validate constraint "aims_academic_year_id_fkey";

alter table "public"."attendance" add constraint "attendance_entered_by_fkey" FOREIGN KEY (entered_by) REFERENCES accounts(id) not valid;

alter table "public"."attendance" validate constraint "attendance_entered_by_fkey";

alter table "public"."attendance" add constraint "attendance_friday_am_fkey" FOREIGN KEY (friday_am) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_friday_am_fkey";

alter table "public"."attendance" add constraint "attendance_friday_pm_fkey" FOREIGN KEY (friday_pm) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_friday_pm_fkey";

alter table "public"."attendance" add constraint "attendance_monday_am_fkey" FOREIGN KEY (monday_am) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_monday_am_fkey";

alter table "public"."attendance" add constraint "attendance_monday_pm_fkey" FOREIGN KEY (monday_pm) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_monday_pm_fkey";

alter table "public"."attendance" add constraint "attendance_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE not valid;

alter table "public"."attendance" validate constraint "attendance_student_id_fkey";

alter table "public"."attendance" add constraint "attendance_thursday_am_fkey" FOREIGN KEY (thursday_am) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_thursday_am_fkey";

alter table "public"."attendance" add constraint "attendance_thursday_pm_fkey" FOREIGN KEY (thursday_pm) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_thursday_pm_fkey";

alter table "public"."attendance" add constraint "attendance_tuesday_am_fkey" FOREIGN KEY (tuesday_am) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_tuesday_am_fkey";

alter table "public"."attendance" add constraint "attendance_tuesday_pm_fkey" FOREIGN KEY (tuesday_pm) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_tuesday_pm_fkey";

alter table "public"."attendance" add constraint "attendance_updated_by_fkey" FOREIGN KEY (updated_by) REFERENCES accounts(id) not valid;

alter table "public"."attendance" validate constraint "attendance_updated_by_fkey";

alter table "public"."attendance" add constraint "attendance_wednesday_am_fkey" FOREIGN KEY (wednesday_am) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_wednesday_am_fkey";

alter table "public"."attendance" add constraint "attendance_wednesday_pm_fkey" FOREIGN KEY (wednesday_pm) REFERENCES lu_attendance_codes(id) not valid;

alter table "public"."attendance" validate constraint "attendance_wednesday_pm_fkey";

alter table "public"."base_groups" add constraint "base_groups_base_teacher_id_fkey" FOREIGN KEY (base_teacher_id) REFERENCES accounts(id) not valid;

alter table "public"."base_groups" validate constraint "base_groups_base_teacher_id_fkey";

alter table "public"."base_groups" add constraint "base_groups_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."base_groups" validate constraint "base_groups_service_id_fkey";

alter table "public"."children" add constraint "children_organisation_id_fkey" FOREIGN KEY (organisation_id) REFERENCES organisations(id) not valid;

alter table "public"."children" validate constraint "children_organisation_id_fkey";

alter table "public"."children" add constraint "children_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."children" validate constraint "children_service_id_fkey";

alter table "public"."contacts" add constraint "contacts_organisation_id_fkey" FOREIGN KEY (organisation_id) REFERENCES organisations(id) not valid;

alter table "public"."contacts" validate constraint "contacts_organisation_id_fkey";

alter table "public"."contextual_overview" add constraint "contextual_overview_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."contextual_overview" validate constraint "contextual_overview_child_id_fkey";

alter table "public"."contextual_overview" add constraint "contextual_overview_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."contextual_overview" validate constraint "contextual_overview_referral_id_fkey";

alter table "public"."contextual_overview" add constraint "contextual_overview_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."contextual_overview" validate constraint "contextual_overview_service_id_fkey";

alter table "public"."curr_map_header" add constraint "curr_map_header_academic_year_id_fkey" FOREIGN KEY (academic_year_id) REFERENCES academic_years(id) not valid;

alter table "public"."curr_map_header" validate constraint "curr_map_header_academic_year_id_fkey";

alter table "public"."curr_map_header" add constraint "curr_map_header_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."curr_map_header" validate constraint "curr_map_header_service_id_fkey";

alter table "public"."curr_map_header" add constraint "curr_map_header_term_id_fkey" FOREIGN KEY (term_id) REFERENCES terms(id) not valid;

alter table "public"."curr_map_header" validate constraint "curr_map_header_term_id_fkey";

alter table "public"."curr_map_phases" add constraint "curr_map_phases_curr_map_header_id_fkey" FOREIGN KEY (curr_map_header_id) REFERENCES curr_map_header(id) not valid;

alter table "public"."curr_map_phases" validate constraint "curr_map_phases_curr_map_header_id_fkey";

alter table "public"."curr_map_phases" add constraint "curr_map_phases_phase_id_fkey" FOREIGN KEY (phase_id) REFERENCES lu_phases(id) not valid;

alter table "public"."curr_map_phases" validate constraint "curr_map_phases_phase_id_fkey";

alter table "public"."curr_map_texts" add constraint "curr_map_texts_curr_map_header_id_fkey" FOREIGN KEY (curr_map_header_id) REFERENCES curr_map_header(id) not valid;

alter table "public"."curr_map_texts" validate constraint "curr_map_texts_curr_map_header_id_fkey";

alter table "public"."curr_map_texts" add constraint "curr_map_texts_literacy_text_id_fkey" FOREIGN KEY (literacy_text_id) REFERENCES lu_literacy_texts(id) not valid;

alter table "public"."curr_map_texts" validate constraint "curr_map_texts_literacy_text_id_fkey";

alter table "public"."curr_map_topics" add constraint "curr_map_topics_curr_map_header_id_fkey" FOREIGN KEY (curr_map_header_id) REFERENCES curr_map_header(id) not valid;

alter table "public"."curr_map_topics" validate constraint "curr_map_topics_curr_map_header_id_fkey";

alter table "public"."curr_map_topics" add constraint "curr_map_topics_topic_id_fkey" FOREIGN KEY (topic_id) REFERENCES lu_pillar_topic_cache(id) not valid;

alter table "public"."curr_map_topics" validate constraint "curr_map_topics_topic_id_fkey";

alter table "public"."development_items" add constraint "development_items_fk_application_id_fkey" FOREIGN KEY (fk_application_id) REFERENCES applications(id) not valid;

alter table "public"."development_items" validate constraint "development_items_fk_application_id_fkey";

alter table "public"."development_items" add constraint "development_items_fk_status_id_fkey" FOREIGN KEY (fk_status_id) REFERENCES lu_ticket_status(id) not valid;

alter table "public"."development_items" validate constraint "development_items_fk_status_id_fkey";

alter table "public"."development_items" add constraint "development_items_fk_thread_id_fkey" FOREIGN KEY (fk_thread_id) REFERENCES threads(id) not valid;

alter table "public"."development_items" validate constraint "development_items_fk_thread_id_fkey";

alter table "public"."join_account_activity" add constraint "join_account_activity_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."join_account_activity" validate constraint "join_account_activity_account_id_fkey";

alter table "public"."join_account_activity" add constraint "join_account_activity_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."join_account_activity" validate constraint "join_account_activity_activity_id_fkey";

alter table "public"."join_account_services" add constraint "account_services_id_key" UNIQUE using index "account_services_id_key";

alter table "public"."join_account_services" add constraint "join_account_services_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."join_account_services" validate constraint "join_account_services_account_id_fkey";

alter table "public"."join_account_services" add constraint "join_account_services_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."join_account_services" validate constraint "join_account_services_service_id_fkey";

alter table "public"."join_application_accounts" add constraint "join_application_accounts_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."join_application_accounts" validate constraint "join_application_accounts_account_id_fkey";

alter table "public"."join_application_accounts" add constraint "join_application_accounts_app_id_fkey" FOREIGN KEY (app_id) REFERENCES applications(id) not valid;

alter table "public"."join_application_accounts" validate constraint "join_application_accounts_app_id_fkey";

alter table "public"."join_child_contacts" add constraint "join_child_contacts_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."join_child_contacts" validate constraint "join_child_contacts_child_id_fkey";

alter table "public"."join_child_contacts" add constraint "join_child_contacts_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."join_child_contacts" validate constraint "join_child_contacts_service_id_fkey";

alter table "public"."join_child_contacts" add constraint "join_child_contacts_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."join_child_contacts" validate constraint "join_child_contacts_student_id_fkey";

alter table "public"."join_debrief_action" add constraint "join_debrief_action_action_id_fkey" FOREIGN KEY (action_id) REFERENCES actions(id) not valid;

alter table "public"."join_debrief_action" validate constraint "join_debrief_action_action_id_fkey";

alter table "public"."join_debrief_action" add constraint "join_debrief_action_debrief_id_fkey" FOREIGN KEY (debrief_id) REFERENCES debriefs(id) not valid;

alter table "public"."join_debrief_action" validate constraint "join_debrief_action_debrief_id_fkey";

alter table "public"."join_plan_steps" add constraint "join_plan_steps_sow_plan_id_fkey" FOREIGN KEY (sow_plan_id) REFERENCES sow_plan(id) not valid;

alter table "public"."join_plan_steps" validate constraint "join_plan_steps_sow_plan_id_fkey";

alter table "public"."join_plan_steps" add constraint "join_plan_steps_sow_step_id_fkey" FOREIGN KEY (sow_step_id) REFERENCES sow_steps(id) not valid;

alter table "public"."join_plan_steps" validate constraint "join_plan_steps_sow_step_id_fkey";

alter table "public"."join_plan_student_milestones" add constraint "join_plan_student_milestones_join_plan_student_id_fkey" FOREIGN KEY (join_plan_student_id) REFERENCES join_plan_students(id) not valid;

alter table "public"."join_plan_student_milestones" validate constraint "join_plan_student_milestones_join_plan_student_id_fkey";

alter table "public"."join_plan_student_milestones" add constraint "join_plan_student_milestones_student_milestone_id_fkey" FOREIGN KEY (student_milestone_id) REFERENCES student_milestones(id) not valid;

alter table "public"."join_plan_student_milestones" validate constraint "join_plan_student_milestones_student_milestone_id_fkey";

alter table "public"."join_plan_students" add constraint "join_plan_students_sow_plan_id_fkey" FOREIGN KEY (sow_plan_id) REFERENCES sow_plan(id) not valid;

alter table "public"."join_plan_students" validate constraint "join_plan_students_sow_plan_id_fkey";

alter table "public"."join_plan_students" add constraint "join_plan_students_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."join_plan_students" validate constraint "join_plan_students_student_id_fkey";

alter table "public"."join_project_accounts" add constraint "join_project_accounts_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."join_project_accounts" validate constraint "join_project_accounts_account_id_fkey";

alter table "public"."join_project_accounts" add constraint "join_project_accounts_project_id_fkey" FOREIGN KEY (project_id) REFERENCES projects(id) not valid;

alter table "public"."join_project_accounts" validate constraint "join_project_accounts_project_id_fkey";

alter table "public"."join_project_aims" add constraint "join_project_aims_aim_id_fkey" FOREIGN KEY (aim_id) REFERENCES aims(id) not valid;

alter table "public"."join_project_aims" validate constraint "join_project_aims_aim_id_fkey";

alter table "public"."join_project_aims" add constraint "join_project_aims_project_id_fkey" FOREIGN KEY (project_id) REFERENCES projects(id) not valid;

alter table "public"."join_project_aims" validate constraint "join_project_aims_project_id_fkey";

alter table "public"."join_project_aims" add constraint "join_project_aims_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."join_project_aims" validate constraint "join_project_aims_service_id_fkey";

alter table "public"."join_referral_status" add constraint "join_referral_status_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."join_referral_status" validate constraint "join_referral_status_account_id_fkey";

alter table "public"."join_referral_status" add constraint "join_referral_status_new_stage_id_fkey" FOREIGN KEY (new_stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."join_referral_status" validate constraint "join_referral_status_new_stage_id_fkey";

alter table "public"."join_referral_status" add constraint "join_referral_status_new_status_id_fkey" FOREIGN KEY (new_status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."join_referral_status" validate constraint "join_referral_status_new_status_id_fkey";

alter table "public"."join_referral_status" add constraint "join_referral_status_old_stage_id_fkey" FOREIGN KEY (old_stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."join_referral_status" validate constraint "join_referral_status_old_stage_id_fkey";

alter table "public"."join_referral_status" add constraint "join_referral_status_old_status_id_fkey" FOREIGN KEY (old_status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."join_referral_status" validate constraint "join_referral_status_old_status_id_fkey";

alter table "public"."join_referral_status" add constraint "join_referral_status_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."join_referral_status" validate constraint "join_referral_status_referral_id_fkey";

alter table "public"."join_referral_status" add constraint "join_referral_status_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."join_referral_status" validate constraint "join_referral_status_service_id_fkey";

alter table "public"."join_service_terms" add constraint "join_service_terms_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."join_service_terms" validate constraint "join_service_terms_service_id_fkey";

alter table "public"."join_service_terms" add constraint "join_service_terms_term_id_fkey" FOREIGN KEY (term_id) REFERENCES terms(id) not valid;

alter table "public"."join_service_terms" validate constraint "join_service_terms_term_id_fkey";

alter table "public"."join_sow_ent_skup" add constraint "join_sow_ent_skup_enterprise_sow_id_fkey" FOREIGN KEY (enterprise_sow_id) REFERENCES sow_header(id) not valid;

alter table "public"."join_sow_ent_skup" validate constraint "join_sow_ent_skup_enterprise_sow_id_fkey";

alter table "public"."join_sow_ent_skup" add constraint "join_sow_ent_skup_skillup_sow_id_fkey" FOREIGN KEY (skillup_sow_id) REFERENCES sow_header(id) not valid;

alter table "public"."join_sow_ent_skup" validate constraint "join_sow_ent_skup_skillup_sow_id_fkey";

alter table "public"."join_student_activity" add constraint "join_student_activity_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."join_student_activity" validate constraint "join_student_activity_activity_id_fkey";

alter table "public"."join_student_activity" add constraint "join_student_activity_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."join_student_activity" validate constraint "join_student_activity_student_id_fkey";

alter table "public"."join_student_assessments" add constraint "join_student_assessments_fk_academic_year_id_fkey" FOREIGN KEY (fk_academic_year_id) REFERENCES academic_years(id) not valid;

alter table "public"."join_student_assessments" validate constraint "join_student_assessments_fk_academic_year_id_fkey";

alter table "public"."join_student_assessments" add constraint "join_student_assessments_fk_account_id_fkey" FOREIGN KEY (fk_account_id) REFERENCES accounts(id) not valid;

alter table "public"."join_student_assessments" validate constraint "join_student_assessments_fk_account_id_fkey";

alter table "public"."join_student_assessments" add constraint "join_student_assessments_fk_assessments_id_fkey" FOREIGN KEY (fk_assessments_id) REFERENCES student_assessments(pk_assessments_id) not valid;

alter table "public"."join_student_assessments" validate constraint "join_student_assessments_fk_assessments_id_fkey";

alter table "public"."join_student_assessments" add constraint "join_student_assessments_fk_criteria_value_id_fkey" FOREIGN KEY (fk_criteria_value_id) REFERENCES lu_criteria_values(pk_criteria_value_id) not valid;

alter table "public"."join_student_assessments" validate constraint "join_student_assessments_fk_criteria_value_id_fkey";

alter table "public"."join_student_assessments" add constraint "join_student_assessments_fk_meeting_id_fkey" FOREIGN KEY (fk_meeting_id) REFERENCES meetings(pk_meetings_id) not valid;

alter table "public"."join_student_assessments" validate constraint "join_student_assessments_fk_meeting_id_fkey";

alter table "public"."join_student_assessments" add constraint "join_student_assessments_fk_student_id_fkey" FOREIGN KEY (fk_student_id) REFERENCES students(id) not valid;

alter table "public"."join_student_assessments" validate constraint "join_student_assessments_fk_student_id_fkey";

alter table "public"."join_student_assessments" add constraint "join_student_assessments_fk_term_id_fkey" FOREIGN KEY (fk_term_id) REFERENCES terms(id) not valid;

alter table "public"."join_student_assessments" validate constraint "join_student_assessments_fk_term_id_fkey";

alter table "public"."join_student_base_group" add constraint "join_student_base_group_base_group_id_fkey" FOREIGN KEY (base_group_id) REFERENCES base_groups(id) not valid;

alter table "public"."join_student_base_group" validate constraint "join_student_base_group_base_group_id_fkey";

alter table "public"."join_student_base_group" add constraint "join_student_base_group_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."join_student_base_group" validate constraint "join_student_base_group_student_id_fkey";

alter table "public"."join_student_contacts" add constraint "join_student_contacts_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."join_student_contacts" validate constraint "join_student_contacts_account_id_fkey";

alter table "public"."join_student_contacts" add constraint "join_student_contacts_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contacts(id) not valid;

alter table "public"."join_student_contacts" validate constraint "join_student_contacts_contact_id_fkey";

alter table "public"."join_student_contacts" add constraint "join_student_contacts_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."join_student_contacts" validate constraint "join_student_contacts_service_id_fkey";

alter table "public"."join_student_contacts" add constraint "join_student_contacts_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."join_student_contacts" validate constraint "join_student_contacts_student_id_fkey";

alter table "public"."join_target_ilps" add constraint "join_target_ilps_ilp_header_id_fkey" FOREIGN KEY (ilp_header_id) REFERENCES student_ilp_header(id) not valid;

alter table "public"."join_target_ilps" validate constraint "join_target_ilps_ilp_header_id_fkey";

alter table "public"."join_target_ilps" add constraint "join_target_ilps_target_id_fkey" FOREIGN KEY (target_id) REFERENCES student_targets(id) not valid;

alter table "public"."join_target_ilps" validate constraint "join_target_ilps_target_id_fkey";

alter table "public"."join_tasklist_aims" add constraint "join_tasklist_aims_aim_id_fkey" FOREIGN KEY (aim_id) REFERENCES aims(id) not valid;

alter table "public"."join_tasklist_aims" validate constraint "join_tasklist_aims_aim_id_fkey";

alter table "public"."join_tasklist_aims" add constraint "join_tasklist_aims_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."join_tasklist_aims" validate constraint "join_tasklist_aims_service_id_fkey";

alter table "public"."join_tasklist_aims" add constraint "join_tasklist_aims_tasklist_id_fkey" FOREIGN KEY (tasklist_id) REFERENCES tasklists(id) not valid;

alter table "public"."join_tasklist_aims" validate constraint "join_tasklist_aims_tasklist_id_fkey";

alter table "public"."join_tickets" add constraint "join_tickets_fk_child_ticket_fkey" FOREIGN KEY (fk_child_ticket) REFERENCES tickets(id) not valid;

alter table "public"."join_tickets" validate constraint "join_tickets_fk_child_ticket_fkey";

alter table "public"."join_tickets" add constraint "join_tickets_fk_parent_ticket_fkey" FOREIGN KEY (fk_parent_ticket) REFERENCES tickets(id) not valid;

alter table "public"."join_tickets" validate constraint "join_tickets_fk_parent_ticket_fkey";

alter table "public"."join_tickets_users" add constraint "join_tickets_users_fk_account_id_fkey" FOREIGN KEY (fk_account_id) REFERENCES accounts(id) not valid;

alter table "public"."join_tickets_users" validate constraint "join_tickets_users_fk_account_id_fkey";

alter table "public"."join_tickets_users" add constraint "join_tickets_users_fk_ticket_id_fkey" FOREIGN KEY (fk_ticket_id) REFERENCES tickets(id) not valid;

alter table "public"."join_tickets_users" validate constraint "join_tickets_users_fk_ticket_id_fkey";

alter table "public"."links" add constraint "links_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."links" validate constraint "links_referral_id_fkey";

alter table "public"."links" add constraint "links_sow_header_id_fkey" FOREIGN KEY (sow_header_id) REFERENCES sow_header(id) not valid;

alter table "public"."links" validate constraint "links_sow_header_id_fkey";

alter table "public"."links" add constraint "links_sow_plan_id_fkey" FOREIGN KEY (sow_plan_id) REFERENCES sow_plan(id) not valid;

alter table "public"."links" validate constraint "links_sow_plan_id_fkey";

alter table "public"."links" add constraint "links_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."links" validate constraint "links_student_id_fkey";

alter table "public"."lu_admissions_reports" add constraint "public_lu_admissions_reports_fk_lu_ref_stage_fkey" FOREIGN KEY (fk_lu_ref_stage) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."lu_admissions_reports" validate constraint "public_lu_admissions_reports_fk_lu_ref_stage_fkey";

alter table "public"."lu_criteria_values" add constraint "lu_criteria_values_fk_criteria_type_id_fkey" FOREIGN KEY (fk_criteria_type_id) REFERENCES lu_criteria_type(pk_criteria_type_id) not valid;

alter table "public"."lu_criteria_values" validate constraint "lu_criteria_values_fk_criteria_type_id_fkey";

alter table "public"."lu_pillar_subject_cache" add constraint "lu_pillar_subject_cache_pillar_id_fkey" FOREIGN KEY (pillar_id) REFERENCES lu_pillar_cache(id) not valid;

alter table "public"."lu_pillar_subject_cache" validate constraint "lu_pillar_subject_cache_pillar_id_fkey";

alter table "public"."lu_pillar_target_cache" add constraint "lu_pillar_target_cache_pillar_id_fkey" FOREIGN KEY (pillar_id) REFERENCES lu_pillar_cache(id) not valid;

alter table "public"."lu_pillar_target_cache" validate constraint "lu_pillar_target_cache_pillar_id_fkey";

alter table "public"."lu_pillar_target_cache" add constraint "lu_pillar_target_cache_subject_id_fkey" FOREIGN KEY (subject_id) REFERENCES lu_pillar_subject_cache(id) not valid;

alter table "public"."lu_pillar_target_cache" validate constraint "lu_pillar_target_cache_subject_id_fkey";

alter table "public"."lu_pillar_target_cache" add constraint "lu_pillar_target_cache_topic_id_fkey" FOREIGN KEY (topic_id) REFERENCES lu_pillar_topic_cache(id) not valid;

alter table "public"."lu_pillar_target_cache" validate constraint "lu_pillar_target_cache_topic_id_fkey";

alter table "public"."lu_pillar_topic_cache" add constraint "lu_pillar_topic_cache_pillar_id_fkey" FOREIGN KEY (pillar_id) REFERENCES lu_pillar_cache(id) not valid;

alter table "public"."lu_pillar_topic_cache" validate constraint "lu_pillar_topic_cache_pillar_id_fkey";

alter table "public"."lu_pillar_topic_cache" add constraint "lu_pillar_topic_cache_subject_id_fkey" FOREIGN KEY (subject_id) REFERENCES lu_pillar_subject_cache(id) not valid;

alter table "public"."lu_pillar_topic_cache" validate constraint "lu_pillar_topic_cache_subject_id_fkey";

alter table "public"."lu_record_subcategories" add constraint "lu_record_subcategories_record_category_id_fkey" FOREIGN KEY (record_category_id) REFERENCES lu_record_categories(id) not valid;

alter table "public"."lu_record_subcategories" validate constraint "lu_record_subcategories_record_category_id_fkey";

alter table "public"."lu_ref_status" add constraint "lu_ref_status_stage_id_fkey" FOREIGN KEY (stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."lu_ref_status" validate constraint "lu_ref_status_stage_id_fkey";

alter table "public"."lu_risk_subcategories" add constraint "lu_risk_subcategories_category_id_fkey" FOREIGN KEY (category_id) REFERENCES lu_risk_categories(id) not valid;

alter table "public"."lu_risk_subcategories" validate constraint "lu_risk_subcategories_category_id_fkey";

alter table "public"."lu_ticket_group" add constraint "lu_ticket_group_fk_subcategory_id_fkey" FOREIGN KEY (fk_subcategory_id) REFERENCES lu_ticket_subcategories(id) not valid;

alter table "public"."lu_ticket_group" validate constraint "lu_ticket_group_fk_subcategory_id_fkey";

alter table "public"."lu_ticket_subcategories" add constraint "lu_ticket_subcategories_fk_category_id_fkey" FOREIGN KEY (fk_category_id) REFERENCES lu_ticket_categories(id) not valid;

alter table "public"."lu_ticket_subcategories" validate constraint "lu_ticket_subcategories_fk_category_id_fkey";

alter table "public"."lu_ticket_types" add constraint "lu_ticket_types_fk_agent_id_fkey" FOREIGN KEY (fk_agent_id) REFERENCES accounts(id) not valid;

alter table "public"."lu_ticket_types" validate constraint "lu_ticket_types_fk_agent_id_fkey";

alter table "public"."lu_ticket_types" add constraint "lu_ticket_types_fk_queue_id_fkey" FOREIGN KEY (fk_queue_id) REFERENCES lu_ticket_queue(id) not valid;

alter table "public"."lu_ticket_types" validate constraint "lu_ticket_types_fk_queue_id_fkey";

alter table "public"."notification_distribution" add constraint "notification_distribution_notification_header_id_fkey" FOREIGN KEY (notification_header_id) REFERENCES notification_header(id) not valid;

alter table "public"."notification_distribution" validate constraint "notification_distribution_notification_header_id_fkey";

alter table "public"."notification_distribution" add constraint "notification_distribution_recipient_id_fkey" FOREIGN KEY (recipient_id) REFERENCES accounts(id) not valid;

alter table "public"."notification_distribution" validate constraint "notification_distribution_recipient_id_fkey";

alter table "public"."notification_header" add constraint "notification_header_fk_referral_header_id_fkey" FOREIGN KEY (fk_referral_header_id) REFERENCES referral_header(pk_referral_header_id) not valid;

alter table "public"."notification_header" validate constraint "notification_header_fk_referral_header_id_fkey";

alter table "public"."notification_header" add constraint "notification_header_sender-id_fkey" FOREIGN KEY ("sender-id") REFERENCES accounts(id) not valid;

alter table "public"."notification_header" validate constraint "notification_header_sender-id_fkey";

alter table "public"."organisations" add constraint "organisations_id_key" UNIQUE using index "organisations_id_key";

alter table "public"."progress_notes" add constraint "progress_notes_account_id_fkey" FOREIGN KEY (account_id) REFERENCES accounts(id) not valid;

alter table "public"."progress_notes" validate constraint "progress_notes_account_id_fkey";

alter table "public"."progress_notes" add constraint "progress_notes_action_id_fkey" FOREIGN KEY (action_id) REFERENCES actions(id) not valid;

alter table "public"."progress_notes" validate constraint "progress_notes_action_id_fkey";

alter table "public"."projects" add constraint "projects_academic_year_id_fkey" FOREIGN KEY (academic_year_id) REFERENCES academic_years(id) not valid;

alter table "public"."projects" validate constraint "projects_academic_year_id_fkey";

alter table "public"."projects" add constraint "projects_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."projects" validate constraint "projects_service_id_fkey";

alter table "public"."referral_header" add constraint "public_referral_header_fk_caring_authority_id_fkey" FOREIGN KEY (fk_caring_authority_id) REFERENCES organisations(id) not valid;

alter table "public"."referral_header" validate constraint "public_referral_header_fk_caring_authority_id_fkey";

alter table "public"."referral_header" add constraint "public_referral_header_fk_child_id_fkey" FOREIGN KEY (fk_child_id) REFERENCES children(id) not valid;

alter table "public"."referral_header" validate constraint "public_referral_header_fk_child_id_fkey";

alter table "public"."referral_header" add constraint "public_referral_header_fk_completed_by_fkey" FOREIGN KEY (fk_completed_by) REFERENCES accounts(id) not valid;

alter table "public"."referral_header" validate constraint "public_referral_header_fk_completed_by_fkey";

alter table "public"."referral_header" add constraint "public_referral_header_fk_organisation_id_fkey" FOREIGN KEY (fk_organisation_id) REFERENCES organisations(id) not valid;

alter table "public"."referral_header" validate constraint "public_referral_header_fk_organisation_id_fkey";

alter table "public"."referral_header" add constraint "public_referral_header_fk_service_id_fkey" FOREIGN KEY (fk_service_id) REFERENCES services(id) not valid;

alter table "public"."referral_header" validate constraint "public_referral_header_fk_service_id_fkey";

alter table "public"."referral_header" add constraint "public_referral_header_fk_stage_id_fkey" FOREIGN KEY (fk_stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referral_header" validate constraint "public_referral_header_fk_stage_id_fkey";

alter table "public"."referral_header" add constraint "public_referral_header_fk_status_id_fkey" FOREIGN KEY (fk_status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referral_header" validate constraint "public_referral_header_fk_status_id_fkey";

alter table "public"."referral_status_history" add constraint "public_referral_status_history_fk_account_id_fkey" FOREIGN KEY (fk_account_id) REFERENCES accounts(id) not valid;

alter table "public"."referral_status_history" validate constraint "public_referral_status_history_fk_account_id_fkey";

alter table "public"."referral_status_history" add constraint "public_referral_status_history_fk_new_stage_id_fkey" FOREIGN KEY (fk_new_stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referral_status_history" validate constraint "public_referral_status_history_fk_new_stage_id_fkey";

alter table "public"."referral_status_history" add constraint "public_referral_status_history_fk_new_status_id_fkey" FOREIGN KEY (fk_new_status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referral_status_history" validate constraint "public_referral_status_history_fk_new_status_id_fkey";

alter table "public"."referral_status_history" add constraint "public_referral_status_history_fk_old_stage_id_fkey" FOREIGN KEY (fk_old_stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referral_status_history" validate constraint "public_referral_status_history_fk_old_stage_id_fkey";

alter table "public"."referral_status_history" add constraint "public_referral_status_history_fk_old_status_id_fkey" FOREIGN KEY (fk_old_status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referral_status_history" validate constraint "public_referral_status_history_fk_old_status_id_fkey";

alter table "public"."referral_status_history" add constraint "public_referral_status_history_fk_referral_header_id_fkey" FOREIGN KEY (fk_referral_header_id) REFERENCES referral_header(pk_referral_header_id) not valid;

alter table "public"."referral_status_history" validate constraint "public_referral_status_history_fk_referral_header_id_fkey";

alter table "public"."referral_status_history" add constraint "public_referral_status_history_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."referral_status_history" validate constraint "public_referral_status_history_service_id_fkey";

alter table "public"."referrals" add constraint "referrals_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."referrals" validate constraint "referrals_child_id_fkey";

alter table "public"."referrals" add constraint "referrals_completed_by_fkey" FOREIGN KEY (completed_by) REFERENCES accounts(id) not valid;

alter table "public"."referrals" validate constraint "referrals_completed_by_fkey";

alter table "public"."referrals" add constraint "referrals_id_key" UNIQUE using index "referrals_id_key";

alter table "public"."referrals" add constraint "referrals_organisation_id_fkey" FOREIGN KEY (organisation_id) REFERENCES organisations(id) not valid;

alter table "public"."referrals" validate constraint "referrals_organisation_id_fkey";

alter table "public"."referrals" add constraint "referrals_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."referrals" validate constraint "referrals_service_id_fkey";

alter table "public"."referrals" add constraint "referrals_stage_id_fkey" FOREIGN KEY (stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referrals" validate constraint "referrals_stage_id_fkey";

alter table "public"."referrals" add constraint "referrals_status_id_fkey" FOREIGN KEY (status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referrals" validate constraint "referrals_status_id_fkey";

alter table "public"."referrals_stage1" add constraint "referrals_stage1_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."referrals_stage1" validate constraint "referrals_stage1_child_id_fkey";

alter table "public"."referrals_stage1" add constraint "referrals_stage1_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."referrals_stage1" validate constraint "referrals_stage1_referral_id_fkey";

alter table "public"."referrals_stage1" add constraint "referrals_stage1_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."referrals_stage1" validate constraint "referrals_stage1_service_id_fkey";

alter table "public"."referrals_stage1" add constraint "referrals_stage1_stage_id_fkey" FOREIGN KEY (stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referrals_stage1" validate constraint "referrals_stage1_stage_id_fkey";

alter table "public"."referrals_stage1" add constraint "referrals_stage1_status_id_fkey" FOREIGN KEY (status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referrals_stage1" validate constraint "referrals_stage1_status_id_fkey";

alter table "public"."referrals_stage2" add constraint "referrals_stage2_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."referrals_stage2" validate constraint "referrals_stage2_child_id_fkey";

alter table "public"."referrals_stage2" add constraint "referrals_stage2_contextual_id_fkey" FOREIGN KEY (contextual_id) REFERENCES contextual_overview(id) not valid;

alter table "public"."referrals_stage2" validate constraint "referrals_stage2_contextual_id_fkey";

alter table "public"."referrals_stage2" add constraint "referrals_stage2_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."referrals_stage2" validate constraint "referrals_stage2_referral_id_fkey";

alter table "public"."referrals_stage2" add constraint "referrals_stage2_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."referrals_stage2" validate constraint "referrals_stage2_service_id_fkey";

alter table "public"."referrals_stage2" add constraint "referrals_stage2_stage_id_fkey" FOREIGN KEY (stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referrals_stage2" validate constraint "referrals_stage2_stage_id_fkey";

alter table "public"."referrals_stage2" add constraint "referrals_stage2_status_id_fkey" FOREIGN KEY (status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referrals_stage2" validate constraint "referrals_stage2_status_id_fkey";

alter table "public"."referrals_stage3" add constraint "referrals_stage3_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."referrals_stage3" validate constraint "referrals_stage3_child_id_fkey";

alter table "public"."referrals_stage3" add constraint "referrals_stage3_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."referrals_stage3" validate constraint "referrals_stage3_referral_id_fkey";

alter table "public"."referrals_stage3" add constraint "referrals_stage3_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."referrals_stage3" validate constraint "referrals_stage3_service_id_fkey";

alter table "public"."referrals_stage3" add constraint "referrals_stage3_stage_id_fkey" FOREIGN KEY (stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referrals_stage3" validate constraint "referrals_stage3_stage_id_fkey";

alter table "public"."referrals_stage3" add constraint "referrals_stage3_status_id_fkey" FOREIGN KEY (status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referrals_stage3" validate constraint "referrals_stage3_status_id_fkey";

alter table "public"."referrals_stage4" add constraint "referrals_stage4_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."referrals_stage4" validate constraint "referrals_stage4_child_id_fkey";

alter table "public"."referrals_stage4" add constraint "referrals_stage4_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."referrals_stage4" validate constraint "referrals_stage4_referral_id_fkey";

alter table "public"."referrals_stage4" add constraint "referrals_stage4_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."referrals_stage4" validate constraint "referrals_stage4_service_id_fkey";

alter table "public"."referrals_stage4" add constraint "referrals_stage4_stage_id_fkey" FOREIGN KEY (stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referrals_stage4" validate constraint "referrals_stage4_stage_id_fkey";

alter table "public"."referrals_stage4" add constraint "referrals_stage4_status_id_fkey" FOREIGN KEY (status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referrals_stage4" validate constraint "referrals_stage4_status_id_fkey";

alter table "public"."referrals_stage5" add constraint "referrals_stage5_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."referrals_stage5" validate constraint "referrals_stage5_child_id_fkey";

alter table "public"."referrals_stage5" add constraint "referrals_stage5_completed_by_fkey" FOREIGN KEY (completed_by) REFERENCES accounts(id) not valid;

alter table "public"."referrals_stage5" validate constraint "referrals_stage5_completed_by_fkey";

alter table "public"."referrals_stage5" add constraint "referrals_stage5_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."referrals_stage5" validate constraint "referrals_stage5_referral_id_fkey";

alter table "public"."referrals_stage5" add constraint "referrals_stage5_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."referrals_stage5" validate constraint "referrals_stage5_service_id_fkey";

alter table "public"."referrals_stage5" add constraint "referrals_stage5_stage_id_fkey" FOREIGN KEY (stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referrals_stage5" validate constraint "referrals_stage5_stage_id_fkey";

alter table "public"."referrals_stage5" add constraint "referrals_stage5_status_id_fkey" FOREIGN KEY (status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referrals_stage5" validate constraint "referrals_stage5_status_id_fkey";

alter table "public"."referrals_stage6" add constraint "referrals_stage6_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."referrals_stage6" validate constraint "referrals_stage6_child_id_fkey";

alter table "public"."referrals_stage6" add constraint "referrals_stage6_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."referrals_stage6" validate constraint "referrals_stage6_referral_id_fkey";

alter table "public"."referrals_stage6" add constraint "referrals_stage6_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."referrals_stage6" validate constraint "referrals_stage6_service_id_fkey";

alter table "public"."referrals_stage6" add constraint "referrals_stage6_stage_id_fkey" FOREIGN KEY (stage_id) REFERENCES lu_ref_stage(id) not valid;

alter table "public"."referrals_stage6" validate constraint "referrals_stage6_stage_id_fkey";

alter table "public"."referrals_stage6" add constraint "referrals_stage6_status_id_fkey" FOREIGN KEY (status_id) REFERENCES lu_ref_status(id) not valid;

alter table "public"."referrals_stage6" validate constraint "referrals_stage6_status_id_fkey";

alter table "public"."report_details" add constraint "report_details_fk_report_header_id_fkey" FOREIGN KEY (fk_report_header_id) REFERENCES report_header(pk_report_header_id) not valid;

alter table "public"."report_details" validate constraint "report_details_fk_report_header_id_fkey";

alter table "public"."report_header" add constraint "public_report_header_fk_app_id_fkey" FOREIGN KEY (fk_app_id) REFERENCES applications(id) not valid;

alter table "public"."report_header" validate constraint "public_report_header_fk_app_id_fkey";

alter table "public"."risks" add constraint "risks_activity_id_fkey" FOREIGN KEY (activity_id) REFERENCES activity_header(id) not valid;

alter table "public"."risks" validate constraint "risks_activity_id_fkey";

alter table "public"."risks" add constraint "risks_category_id_fkey" FOREIGN KEY (category_id) REFERENCES lu_risk_categories(id) not valid;

alter table "public"."risks" validate constraint "risks_category_id_fkey";

alter table "public"."risks" add constraint "risks_child_id_fkey" FOREIGN KEY (child_id) REFERENCES children(id) not valid;

alter table "public"."risks" validate constraint "risks_child_id_fkey";

alter table "public"."risks" add constraint "risks_contextual_id_fkey" FOREIGN KEY (contextual_id) REFERENCES contextual_overview(id) not valid;

alter table "public"."risks" validate constraint "risks_contextual_id_fkey";

alter table "public"."risks" add constraint "risks_created_by_fkey" FOREIGN KEY (created_by) REFERENCES accounts(id) not valid;

alter table "public"."risks" validate constraint "risks_created_by_fkey";

alter table "public"."risks" add constraint "risks_referral_id_fkey" FOREIGN KEY (referral_id) REFERENCES referrals(id) not valid;

alter table "public"."risks" validate constraint "risks_referral_id_fkey";

alter table "public"."risks" add constraint "risks_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."risks" validate constraint "risks_service_id_fkey";

alter table "public"."risks" add constraint "risks_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."risks" validate constraint "risks_student_id_fkey";

alter table "public"."risks" add constraint "risks_subcategory_id_fkey" FOREIGN KEY (subcategory_id) REFERENCES lu_risk_subcategories(id) not valid;

alter table "public"."risks" validate constraint "risks_subcategory_id_fkey";

alter table "public"."rm_risks" add constraint "rm_risks_fk_created_by_fkey" FOREIGN KEY (fk_created_by) REFERENCES accounts(id) not valid;

alter table "public"."rm_risks" validate constraint "rm_risks_fk_created_by_fkey";

alter table "public"."rm_risks" add constraint "rm_risks_fk_risk_owner_fkey" FOREIGN KEY (fk_risk_owner) REFERENCES accounts(id) not valid;

alter table "public"."rm_risks" validate constraint "rm_risks_fk_risk_owner_fkey";

alter table "public"."rm_risks" add constraint "rm_risks_fk_service_id_fkey" FOREIGN KEY (fk_service_id) REFERENCES services(id) not valid;

alter table "public"."rm_risks" validate constraint "rm_risks_fk_service_id_fkey";

alter table "public"."service_profiles" add constraint "service_profiles_fk_service_id_fkey" FOREIGN KEY (fk_service_id) REFERENCES services(id) not valid;

alter table "public"."service_profiles" validate constraint "service_profiles_fk_service_id_fkey";

alter table "public"."services" add constraint "services_id_key" UNIQUE using index "services_id_key";

alter table "public"."sow_header" add constraint "sow_header_base_group_id_fkey" FOREIGN KEY (base_group_id) REFERENCES base_groups(id) not valid;

alter table "public"."sow_header" validate constraint "sow_header_base_group_id_fkey";

alter table "public"."sow_header" add constraint "sow_header_curr_map_header_id_fkey" FOREIGN KEY (curr_map_header_id) REFERENCES curr_map_header(id) not valid;

alter table "public"."sow_header" validate constraint "sow_header_curr_map_header_id_fkey";

alter table "public"."sow_header" add constraint "sow_header_fk_created_by_fkey" FOREIGN KEY (fk_created_by) REFERENCES accounts(id) not valid;

alter table "public"."sow_header" validate constraint "sow_header_fk_created_by_fkey";

alter table "public"."sow_plan" add constraint "sow_plan_sow_header_id_fkey" FOREIGN KEY (sow_header_id) REFERENCES sow_header(id) not valid;

alter table "public"."sow_plan" validate constraint "sow_plan_sow_header_id_fkey";

alter table "public"."sow_plan" add constraint "sow_plan_week_id_fkey" FOREIGN KEY (week_id) REFERENCES weeks(id) not valid;

alter table "public"."sow_plan" validate constraint "sow_plan_week_id_fkey";

alter table "public"."sow_steps" add constraint "sow_steps_sow_header_id_fkey" FOREIGN KEY (sow_header_id) REFERENCES sow_header(id) not valid;

alter table "public"."sow_steps" validate constraint "sow_steps_sow_header_id_fkey";

alter table "public"."sow_texts" add constraint "sow_texts_curr_map_text_id_fkey" FOREIGN KEY (curr_map_text_id) REFERENCES curr_map_texts(id) not valid;

alter table "public"."sow_texts" validate constraint "sow_texts_curr_map_text_id_fkey";

alter table "public"."sow_texts" add constraint "sow_texts_sow_header_id_fkey" FOREIGN KEY (sow_header_id) REFERENCES sow_header(id) not valid;

alter table "public"."sow_texts" validate constraint "sow_texts_sow_header_id_fkey";

alter table "public"."sow_topics" add constraint "sow_topics_curr_map_topic_id_fkey" FOREIGN KEY (curr_map_topic_id) REFERENCES curr_map_topics(id) not valid;

alter table "public"."sow_topics" validate constraint "sow_topics_curr_map_topic_id_fkey";

alter table "public"."sow_topics" add constraint "sow_topics_sow_header_id_fkey" FOREIGN KEY (sow_header_id) REFERENCES sow_header(id) not valid;

alter table "public"."sow_topics" validate constraint "sow_topics_sow_header_id_fkey";

alter table "public"."student_admissions" add constraint "student_admissions_local_authority_id_fkey" FOREIGN KEY (local_authority_id) REFERENCES organisations(id) not valid;

alter table "public"."student_admissions" validate constraint "student_admissions_local_authority_id_fkey";

alter table "public"."student_admissions" add constraint "student_admissions_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."student_admissions" validate constraint "student_admissions_service_id_fkey";

alter table "public"."student_admissions" add constraint "student_admissions_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."student_admissions" validate constraint "student_admissions_student_id_fkey";

alter table "public"."student_ap" add constraint "student_ap_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."student_ap" validate constraint "student_ap_student_id_fkey";

alter table "public"."student_assessment_tracking" add constraint "student_assessment_tracking_fk_account_id_fkey" FOREIGN KEY (fk_account_id) REFERENCES accounts(id) not valid;

alter table "public"."student_assessment_tracking" validate constraint "student_assessment_tracking_fk_account_id_fkey";

alter table "public"."student_assessment_tracking" add constraint "student_assessment_tracking_fk_join_student_assessment_id_fkey" FOREIGN KEY (fk_join_student_assessment_id) REFERENCES join_student_assessments(pk_join_student_assessments_id) not valid;

alter table "public"."student_assessment_tracking" validate constraint "student_assessment_tracking_fk_join_student_assessment_id_fkey";

alter table "public"."student_assessment_tracking" add constraint "student_assessment_tracking_fk_new_score_id_fkey" FOREIGN KEY (fk_new_score_id) REFERENCES lu_criteria_values(pk_criteria_value_id) not valid;

alter table "public"."student_assessment_tracking" validate constraint "student_assessment_tracking_fk_new_score_id_fkey";

alter table "public"."student_assessment_tracking" add constraint "student_assessment_tracking_fk_previous_score_id_fkey" FOREIGN KEY (fk_previous_score_id) REFERENCES lu_criteria_values(pk_criteria_value_id) not valid;

alter table "public"."student_assessment_tracking" validate constraint "student_assessment_tracking_fk_previous_score_id_fkey";

alter table "public"."student_assessment_tracking" add constraint "student_assessment_tracking_fk_student_pillar_level_id_fkey" FOREIGN KEY (fk_student_pillar_level_id) REFERENCES student_pillar_levels(id) not valid;

alter table "public"."student_assessment_tracking" validate constraint "student_assessment_tracking_fk_student_pillar_level_id_fkey";

alter table "public"."student_assessments" add constraint "student_assessments_fk_criteria_type_id_fkey" FOREIGN KEY (fk_criteria_type_id) REFERENCES lu_criteria_type(pk_criteria_type_id) not valid;

alter table "public"."student_assessments" validate constraint "student_assessments_fk_criteria_type_id_fkey";

alter table "public"."student_ilp_header" add constraint "student_ilp_header_curr_map_header_id_fkey" FOREIGN KEY (curr_map_header_id) REFERENCES curr_map_header(id) not valid;

alter table "public"."student_ilp_header" validate constraint "student_ilp_header_curr_map_header_id_fkey";

alter table "public"."student_ilp_header" add constraint "student_ilp_header_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."student_ilp_header" validate constraint "student_ilp_header_student_id_fkey";

alter table "public"."student_milestone_assessments" add constraint "student_milestone_assessments_milestone_id_fkey" FOREIGN KEY (milestone_id) REFERENCES student_milestones(id) not valid;

alter table "public"."student_milestone_assessments" validate constraint "student_milestone_assessments_milestone_id_fkey";

alter table "public"."student_milestones" add constraint "student_milestones_target_id_fkey" FOREIGN KEY (target_id) REFERENCES student_targets(id) not valid;

alter table "public"."student_milestones" validate constraint "student_milestones_target_id_fkey";

alter table "public"."student_needsoutcomes" add constraint "student_needsoutcomes_ehcp_category_id_fkey" FOREIGN KEY (ehcp_category_id) REFERENCES lu_ehcp_categories(id) not valid;

alter table "public"."student_needsoutcomes" validate constraint "student_needsoutcomes_ehcp_category_id_fkey";

alter table "public"."student_needsoutcomes" add constraint "student_needsoutcomes_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."student_needsoutcomes" validate constraint "student_needsoutcomes_service_id_fkey";

alter table "public"."student_needsoutcomes" add constraint "student_needsoutcomes_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."student_needsoutcomes" validate constraint "student_needsoutcomes_student_id_fkey";

alter table "public"."student_pillar_levels" add constraint "student_pillar_levels_pillar_id_fkey" FOREIGN KEY (pillar_id) REFERENCES lu_pillar_cache(id) not valid;

alter table "public"."student_pillar_levels" validate constraint "student_pillar_levels_pillar_id_fkey";

alter table "public"."student_pillar_levels" add constraint "student_pillar_levels_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."student_pillar_levels" validate constraint "student_pillar_levels_student_id_fkey";

alter table "public"."student_pillar_levels" add constraint "student_pillar_levels_subject_id_fkey" FOREIGN KEY (subject_id) REFERENCES lu_pillar_subject_cache(id) not valid;

alter table "public"."student_pillar_levels" validate constraint "student_pillar_levels_subject_id_fkey";

alter table "public"."student_target_assessments" add constraint "student_target_assessments_fk_target_id_fkey" FOREIGN KEY (fk_target_id) REFERENCES student_targets(id) not valid;

alter table "public"."student_target_assessments" validate constraint "student_target_assessments_fk_target_id_fkey";

alter table "public"."student_targets" add constraint "student_targets_ehcp_category_id_fkey" FOREIGN KEY (ehcp_category_id) REFERENCES lu_ehcp_categories(id) not valid;

alter table "public"."student_targets" validate constraint "student_targets_ehcp_category_id_fkey";

alter table "public"."student_targets" add constraint "student_targets_needsoutcomes_id_fkey" FOREIGN KEY (needsoutcomes_id) REFERENCES student_needsoutcomes(id) not valid;

alter table "public"."student_targets" validate constraint "student_targets_needsoutcomes_id_fkey";

alter table "public"."student_targets" add constraint "student_targets_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."student_targets" validate constraint "student_targets_service_id_fkey";

alter table "public"."student_targets" add constraint "student_targets_student_id_fkey" FOREIGN KEY (student_id) REFERENCES students(id) not valid;

alter table "public"."student_targets" validate constraint "student_targets_student_id_fkey";

alter table "public"."student_targets" add constraint "student_targets_target_cache_id_fkey" FOREIGN KEY (target_cache_id) REFERENCES lu_pillar_target_cache(id) not valid;

alter table "public"."student_targets" validate constraint "student_targets_target_cache_id_fkey";

alter table "public"."students" add constraint "students_group_id_fkey" FOREIGN KEY (group_id) REFERENCES base_groups(id) not valid;

alter table "public"."students" validate constraint "students_group_id_fkey";

alter table "public"."students" add constraint "students_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) not valid;

alter table "public"."students" validate constraint "students_service_id_fkey";

alter table "public"."tasklists" add constraint "tasklists_project_id_fkey" FOREIGN KEY (project_id) REFERENCES projects(id) not valid;

alter table "public"."tasklists" validate constraint "tasklists_project_id_fkey";

alter table "public"."terms" add constraint "terms_academic_year_id_fkey" FOREIGN KEY (academic_year_id) REFERENCES academic_years(id) not valid;

alter table "public"."terms" validate constraint "terms_academic_year_id_fkey";

alter table "public"."ticket_messages" add constraint "ticket_messages_fk_account_id_fkey" FOREIGN KEY (fk_account_id) REFERENCES accounts(id) not valid;

alter table "public"."ticket_messages" validate constraint "ticket_messages_fk_account_id_fkey";

alter table "public"."ticket_messages" add constraint "ticket_messages_fk_ticket_id_fkey" FOREIGN KEY (fk_ticket_id) REFERENCES tickets(id) not valid;

alter table "public"."ticket_messages" validate constraint "ticket_messages_fk_ticket_id_fkey";

alter table "public"."ticket_status_history" add constraint "ticket_status_history_fk_ticket_id_fkey" FOREIGN KEY (fk_ticket_id) REFERENCES tickets(id) not valid;

alter table "public"."ticket_status_history" validate constraint "ticket_status_history_fk_ticket_id_fkey";

alter table "public"."ticket_status_history" add constraint "ticket_status_history_fk_updated_by_fkey" FOREIGN KEY (fk_updated_by) REFERENCES accounts(id) not valid;

alter table "public"."ticket_status_history" validate constraint "ticket_status_history_fk_updated_by_fkey";

alter table "public"."tickets" add constraint "tickets_fk_agent_id_fkey" FOREIGN KEY (fk_agent_id) REFERENCES accounts(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_agent_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_app_id_fkey" FOREIGN KEY (fk_app_id) REFERENCES applications(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_app_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_awaiting_response_fkey" FOREIGN KEY (fk_awaiting_response) REFERENCES accounts(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_awaiting_response_fkey";

alter table "public"."tickets" add constraint "tickets_fk_category_id_fkey" FOREIGN KEY (fk_category_id) REFERENCES lu_ticket_categories(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_category_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_creator_id_fkey" FOREIGN KEY (fk_creator_id) REFERENCES accounts(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_creator_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_development_thread_id_fkey" FOREIGN KEY (fk_development_thread_id) REFERENCES threads(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_development_thread_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_external_thread_id_fkey" FOREIGN KEY (fk_external_thread_id) REFERENCES threads(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_external_thread_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_internal_thread_id_fkey" FOREIGN KEY (fk_internal_thread_id) REFERENCES threads(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_internal_thread_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_service_id_fkey" FOREIGN KEY (fk_service_id) REFERENCES services(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_service_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_status_id_fkey" FOREIGN KEY (fk_status_id) REFERENCES lu_ticket_status(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_status_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_subcategory_id_fkey" FOREIGN KEY (fk_subcategory_id) REFERENCES lu_ticket_subcategories(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_subcategory_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_ticket_group_id_fkey" FOREIGN KEY (fk_ticket_group_id) REFERENCES lu_ticket_group(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_ticket_group_id_fkey";

alter table "public"."tickets" add constraint "tickets_fk_ticket_queue_fkey" FOREIGN KEY (fk_ticket_queue) REFERENCES lu_ticket_queue(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_ticket_queue_fkey";

alter table "public"."tickets" add constraint "tickets_fk_ticket_reason_fkey" FOREIGN KEY (fk_ticket_reason) REFERENCES lu_ticket_reasons(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_ticket_reason_fkey";

alter table "public"."tickets" add constraint "tickets_fk_ticket_sub_reason_fkey" FOREIGN KEY (fk_ticket_sub_reason) REFERENCES lu_ticket_sub_reasons(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_ticket_sub_reason_fkey";

alter table "public"."tickets" add constraint "tickets_fk_type_id_fkey" FOREIGN KEY (fk_type_id) REFERENCES lu_ticket_types(id) not valid;

alter table "public"."tickets" validate constraint "tickets_fk_type_id_fkey";

alter table "public"."weeks" add constraint "weeks_term_id_fkey" FOREIGN KEY (term_id) REFERENCES terms(id) not valid;

alter table "public"."weeks" validate constraint "weeks_term_id_fkey";

alter table "public"."weweb_students" add constraint "weweb_students_fk_year_group_id_fkey" FOREIGN KEY (fk_year_group_id) REFERENCES weweb_year_groups(pk_year_group_id) not valid;

alter table "public"."weweb_students" validate constraint "weweb_students_fk_year_group_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.check_and_notify_old_records(table_name text, date_column text, webhook_url text)
 RETURNS SETOF json
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET statement_timeout TO '15s'
AS $function$
declare
    query text;
    old_records json;
    request_id bigint;
    request_status record;
    max_attempts integer := 5;
    attempt_count integer := 0;
begin
    -- Construct the dynamic query
    query := format(
        'SELECT array_to_json(array_agg(row_to_json(%I.*))) FROM %I WHERE %I < NOW() - INTERVAL ''3 days''',
        table_name,
        table_name,
        date_column
    );

    -- Execute the query and store results
    execute query into old_records;

    -- Send webhook if records are found
    IF old_records IS NOT NULL AND old_records::text != 'null' THEN
        -- Send the request using net.http_post
        SELECT "net"."http_post"(
            webhook_url::text,
            old_records::jsonb,
            headers := '{"Content-Type": "application/json"}'::jsonb
        ) INTO request_id;
        
        -- Wait and check the status of the request
        LOOP
            SELECT * INTO request_status 
            FROM "net"."http_request_queue" 
            WHERE id = request_id;

            IF request_status.status = 'success' THEN
                -- Request completed successfully
                return next json_build_object(
                    'status', 'success',
                    'records_sent', old_records,
                    'request_id', request_id::text,
                    'webhook_status', 'delivered',
                    'response_status', request_status.status_code,
                    'response_body', request_status.response_body
                );
                EXIT;
            ELSIF request_status.status = 'error' THEN
                -- Request failed
                return next json_build_object(
                    'status', 'error',
                    'message', 'Webhook delivery failed',
                    'request_id', request_id::text,
                    'error_details', request_status.error_msg
                );
                EXIT;
            ELSIF request_status.status = 'pending' THEN
                -- Request is still pending
                attempt_count := attempt_count + 1;
                IF attempt_count >= max_attempts THEN
                    return next json_build_object(
                        'status', 'pending',
                        'message', 'Webhook request is still processing',
                        'request_id', request_id::text
                    );
                    EXIT;
                END IF;
                -- Wait for 1 second before checking again
                PERFORM pg_sleep(1);
            END IF;
        END LOOP;
    ELSE
        return next json_build_object(
            'status', 'no_records_found',
            'message', 'No records older than 3 days found'
        );
    END IF;
exception when others then
    return next json_build_object(
        'status', 'error',
        'message', SQLERRM
    );
end;
$function$
;

create or replace view "public"."cm_report_view" as  SELECT cmh.service_id,
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
    cmph.phase_id,
    ph.name,
    ph.phase,
    ph.status,
    ph.display_name,
    ph.sorting
   FROM ((curr_map_header cmh
     LEFT JOIN curr_map_phases cmph ON ((cmh.id = cmph.curr_map_header_id)))
     LEFT JOIN lu_phases ph ON ((ph.id = cmph.phase_id)))
  WHERE (cmh.id = '17a57e5c-61c5-4fa9-8ea3-20401635a94f'::uuid);


create or replace view "public"."contextualoverview_view" as  SELECT co.referral_id,
    ch.child_name,
    s.service_name,
    co.risk_score,
    co.created_at
   FROM (((contextual_overview co
     JOIN referrals r ON ((co.referral_id = r.id)))
     JOIN children ch ON ((r.child_id = ch.id)))
     JOIN services s ON ((co.service_id = s.id)));


create or replace view "public"."findpillartargets" as  SELECT join_target_ilps.id,
    join_target_ilps.created_at,
    join_target_ilps.target_id,
    join_target_ilps.ilp_header_id,
    lu_pillar_target_cache.topic_id AS topcacid,
    student_targets.type
   FROM (((((join_target_ilps
     LEFT JOIN student_targets ON ((student_targets.id = join_target_ilps.target_id)))
     LEFT JOIN lu_pillar_target_cache ON ((lu_pillar_target_cache.id = student_targets.target_cache_id)))
     LEFT JOIN lu_pillar_cache ON ((lu_pillar_cache.id = lu_pillar_target_cache.pillar_id)))
     LEFT JOIN lu_pillar_topic_cache ON ((lu_pillar_topic_cache.id = lu_pillar_target_cache.topic_id)))
     LEFT JOIN lu_pillar_subject_cache ON ((lu_pillar_subject_cache.id = lu_pillar_target_cache.subject_id)));


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


create or replace view "public"."get_student_actions_for_referral" as  SELECT actions.id,
    actions.service_id,
    actions.referral_id,
    actions.account_id,
    actions.assigned_to_id,
    actions.service_name,
    actions.display_child,
    actions.account_name,
    actions.assigned_to_name,
    actions.date,
    actions.details,
    actions.type,
    actions.due_date,
    actions.editable,
    actions.rating,
    actions.created_at,
    actions.stage_name,
    actions.source,
    actions.project_id,
    actions.tasklist_id,
    actions.parent_action_id,
    actions.title,
    actions.status,
    actions.aim_id,
    actions.activity_id,
    actions.activity_followup_header_id,
    actions.student_id,
    actions.fk_rm_risk_id,
    actions.fk_referral_header_id
   FROM actions
  WHERE ((actions.fk_referral_header_id IS NOT NULL) AND (actions.source = 'Referrals'::text));


create or replace view "public"."get_student_all_ehcp" as  SELECT sm.milestone,
    sm.status,
    st.student_id,
    st.display_target,
    lec.category,
    lec.name AS areaofneed,
    jti.ilp_header_id AS join_target_ilps_id,
    sta.target_completed AS target_assessment,
    sma.milestone_completed AS assessment,
    sno.description AS outcome,
    sma.id
   FROM (((((((student_targets st
     JOIN join_target_ilps jti ON ((jti.target_id = st.id)))
     JOIN lu_ehcp_categories lec ON ((lec.id = st.ehcp_category_id)))
     JOIN students ON ((students.id = st.student_id)))
     JOIN student_target_assessments sta ON ((sta.fk_target_id = st.id)))
     LEFT JOIN student_needsoutcomes sno ON (((sno.student_id = st.student_id) AND (sno.id = st.needsoutcomes_id))))
     LEFT JOIN student_milestones sm ON ((st.id = sm.target_id)))
     JOIN student_milestone_assessments sma ON ((sma.milestone_id = sm.id)));


create or replace view "public"."get_student_all_pillar" as  SELECT sm.milestone,
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
    sma.id
   FROM (((((((((student_targets st
     JOIN lu_pillar_target_cache lptc ON ((lptc.id = st.target_cache_id)))
     JOIN lu_pillar_topic_cache ltop ON ((ltop.id = lptc.topic_id)))
     LEFT JOIN lu_pillar_subject_cache lpsc ON ((lpsc.id = ltop.subject_id)))
     JOIN lu_pillar_cache lpc ON ((lpc.id = ltop.pillar_id)))
     JOIN join_target_ilps jti ON ((jti.target_id = st.id)))
     JOIN student_target_assessments sta ON ((sta.fk_target_id = st.id)))
     LEFT JOIN student_needsoutcomes sno ON (((sno.student_id = st.student_id) AND (sno.id = st.needsoutcomes_id))))
     LEFT JOIN student_milestones sm ON ((st.id = sm.target_id)))
     LEFT JOIN student_milestone_assessments sma ON ((sma.milestone_id = sm.id)));


create or replace view "public"."get_student_ilps" as  SELECT curr_map_header.display_name,
    curr_map_header.id AS currmapid,
    terms.start_date,
    terms.end_date,
    student_ilp_header.id AS ilpid,
    student_ilp_header.student_id,
    curr_map_header.year_number,
    terms.sorting
   FROM (((student_ilp_header
     JOIN curr_map_header ON ((curr_map_header.id = student_ilp_header.curr_map_header_id)))
     JOIN academic_years ON ((curr_map_header.academic_year_id = academic_years.id)))
     JOIN terms ON ((terms.id = curr_map_header.term_id)));


create or replace view "public"."get_student_milestones_all_ehcp" as  SELECT sm.milestone,
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
    sma.id AS sma_id
   FROM (((((((student_targets st
     JOIN join_target_ilps jti ON ((jti.target_id = st.id)))
     JOIN lu_ehcp_categories lec ON ((lec.id = st.ehcp_category_id)))
     JOIN students ON ((students.id = st.student_id)))
     JOIN student_target_assessments sta ON ((sta.fk_target_id = st.id)))
     LEFT JOIN student_needsoutcomes sno ON (((sno.student_id = st.student_id) AND (sno.id = st.needsoutcomes_id))))
     LEFT JOIN student_milestones sm ON ((st.id = sm.target_id)))
     JOIN student_milestone_assessments sma ON ((sma.milestone_id = sm.id)))
  WHERE ((sm.status = 'Active'::text) OR (sm.status IS NULL));


create or replace view "public"."get_student_milestones_all_pillar" as  SELECT sm.milestone,
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
    sma.id AS sma_id
   FROM (((((((((student_targets st
     JOIN lu_pillar_target_cache lptc ON ((lptc.id = st.target_cache_id)))
     JOIN lu_pillar_topic_cache ltop ON ((ltop.id = lptc.topic_id)))
     LEFT JOIN lu_pillar_subject_cache lpsc ON ((lpsc.id = ltop.subject_id)))
     JOIN lu_pillar_cache lpc ON ((lpc.id = ltop.pillar_id)))
     JOIN join_target_ilps jti ON ((jti.target_id = st.id)))
     JOIN student_target_assessments sta ON ((sta.fk_target_id = st.id)))
     LEFT JOIN student_needsoutcomes sno ON (((sno.student_id = st.student_id) AND (sno.id = st.needsoutcomes_id))))
     LEFT JOIN student_milestones sm ON ((st.id = sm.target_id)))
     LEFT JOIN student_milestone_assessments sma ON ((sma.milestone_id = sm.id)))
  WHERE ((sm.status = 'Active'::text) OR (sm.status IS NULL));


create or replace view "public"."get_student_pillar_level_data" as  SELECT students.service_id,
    spl.student_id AS supabase_student_id,
    students.knack_id AS student_knack_id,
    students.name_full,
    lpsc.pillar_id,
    lpc.pillar,
    lpsc.id AS pillar_subject_id,
    lpsc.subject
   FROM (((student_pillar_levels spl
     JOIN lu_pillar_subject_cache lpsc ON ((lpsc.id = spl.subject_id)))
     JOIN lu_pillar_cache lpc ON ((lpc.id = lpsc.pillar_id)))
     JOIN students ON ((students.id = spl.student_id)));


create or replace view "public"."getactivityactions" as  SELECT actions.id,
    actions.service_id,
    actions.referral_id,
    actions.account_id,
    actions.assigned_to_id,
    actions.service_name,
    actions.display_child,
    actions.account_name,
    actions.assigned_to_name,
    actions.date,
    actions.details,
    actions.type,
    actions.due_date,
    actions.editable AS bupdate,
    actions.rating,
    actions.created_at,
    actions.stage_name,
    actions.source,
    actions.project_id,
    actions.tasklist_id,
    actions.parent_action_id,
    actions.title,
    actions.status,
    actions.aim_id,
    actions.activity_id,
    actions.activity_followup_header_id,
    actions.student_id
   FROM actions
  WHERE (actions.activity_id IS NOT NULL);


create or replace view "public"."getactivitystudents" as  SELECT join_student_activity.id,
    join_student_activity.created_at,
    join_student_activity.activity_id,
    join_student_activity.student_id,
    join_student_activity.is_primary
   FROM join_student_activity
  WHERE (join_student_activity.is_primary = false);


create or replace view "public"."getallactivityfollowup" as  SELECT afu.id AS followup_id,
    afu.activity_id,
    afu.student_id,
    afu.date,
    afu.type,
    afu.details,
    "substring"(afu.details, 1, 100) AS shortdesc,
    afu.is_change_rsp,
    afu.is_change_ra,
    afis.id AS fu_incident_id,
    afis.followup_header_id AS afis_header_id,
    afis.has_staff_feedback,
    afis.escalation_assessment,
    afis.risk_assessment,
    afis.risk_value,
    afis.frequency,
    afis.frequency_value,
    afn.id AS fu_notification_id,
    afn.followup_header_id AS afn_header_id,
    afn.external_agency,
    afn.reference,
    afn.note,
    afn.notification_date,
    afn.social_care_decision,
    afp.id AS fu_pi_id,
    afp.followup_header_id,
    afp.student_injuries,
    afp.is_bodymap,
    afp.is_student_debrief_offered,
    afp.reflection,
    actions.id AS action_id,
    actions.assigned_to_name,
    actions.assigned_to_id,
    actions.title,
    actions.due_date
   FROM ((((activity_followup_header afu
     LEFT JOIN activity_followup_incident_safeguarding afis ON ((afis.activity_id = afu.activity_id)))
     LEFT JOIN activity_followup_notification afn ON ((afn.activity_id = afu.activity_id)))
     LEFT JOIN activity_followup_pi afp ON ((afp.activity_id = afu.activity_id)))
     LEFT JOIN actions ON (((actions.activity_id = afu.activity_id) AND (actions.activity_followup_header_id = afu.id))));


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


create or replace view "public"."getbasegroups" as  SELECT base_groups.id,
    base_groups.service_id,
    base_groups.created_at,
    base_groups.name,
    base_groups.base_number,
    base_groups.base_teacher_id
   FROM base_groups;


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


create or replace view "public"."getstudentactivities" as  SELECT activity_header.id AS activity_id,
    activity_header.service_id,
    activity_header.student_id,
    activity_header.account_id,
    activity_header.record_type,
    activity_header.entry_id,
    activity_header.date AS entry_date,
    activity_header.details,
    activity_header.is_confidential,
    activity_header.is_child_on_child,
    activity_header.is_esafety,
    activity_header.count_notifications,
    activity_header.count_actions,
    activity_header.count_reviews,
    activity_header.count_risks,
    activity_header.count_interventions,
    activity_header.updated_at,
    activity_header.updated_account_id,
    activity_header.linked_record_id,
    activity_header.academic_year_id
   FROM activity_header;


create or replace view "public"."getstudentactivityheader" as  SELECT ah.id AS activity_id,
    ah.date AS activity_date,
    ah.service_id,
    ah.record_type,
    ah.record_type_number,
    ah.entry_id,
    jaa.account_id AS main_staff_id,
    jsa.student_id AS main_student_id,
    ah.count_notifications,
    ah.count_actions,
    ah.count_reviews,
    ah.count_risks,
    ah.count_interventions,
    ah.created_by,
    ah.status
   FROM ((activity_header ah
     LEFT JOIN join_account_activity jaa ON (((jaa.activity_id = ah.id) AND (jaa.is_primary = true))))
     JOIN join_student_activity jsa ON ((jsa.activity_id = ah.id)));


create or replace view "public"."getstudentactivityincident" as  SELECT ah.id AS activity_id,
    ah.account_id,
    ah.record_type,
    ah.record_type_number,
    ah.entry_id,
    ah.date,
    ah.details,
    ah.is_confidential,
    ah.is_child_on_child,
    ah.is_esafety,
    ah.status,
    ah.created_by,
    ai.is_subject,
    ai.is_object,
    ai.object_info,
    ai."time",
    ai.duration,
    ai."where",
    ai.location,
    ai.antecedent_category,
    ai.antecedent_sub_category,
    ai.antecedent_more,
    ai.trigger,
    ai.trigger_more,
    ai.need_category,
    ai.need_sub_category,
    ai.need_more,
    ai.function_category,
    ai.function_more,
    ai.emergent_behaviours,
    ai.emergent_behaviours_more,
    ai.strategies,
    ai.strategies_more,
    ai.primary_area_of_need,
    ai.is_disruption,
    ai.disruption_category,
    ai.disruption_more,
    ai.is_harm_caused,
    ai.is_student_injured,
    ai.is_staff_injured,
    ai.is_guided_pi,
    ai.is_restrictive_pi,
    ai.created_at,
    ai.updated_at,
    ai.injured_student,
    ai.injured_staff,
    jaa.account_id AS main_staff_id,
    accounts.name
   FROM (((activity_header ah
     LEFT JOIN activity_incident ai ON ((ai.id = ah.id)))
     JOIN join_account_activity jaa ON ((jaa.activity_id = ah.id)))
     LEFT JOIN accounts ON ((accounts.id = jaa.account_id)))
  WHERE (ah.record_type_number = 2);


create or replace view "public"."getstudentactivitylog" as  SELECT ah.id AS activity_id,
    ah.account_id,
    ah.record_type,
    ah.record_type_number,
    ah.entry_id,
    ah.date,
    ah.details,
    ah.is_confidential,
    ah.is_child_on_child,
    ah.is_esafety,
    ah.status,
    ah.created_by,
    al.category,
    al.sub_category,
    al.created_at,
    al.updated_at,
    al.engagement,
    al.support,
    al.is_subject,
    jaa.account_id AS main_staff_id,
    accounts.name
   FROM (((activity_header ah
     LEFT JOIN activity_log al ON ((al.activity_id = ah.id)))
     JOIN join_account_activity jaa ON ((jaa.activity_id = ah.id)))
     LEFT JOIN accounts ON ((accounts.id = jaa.account_id)))
  WHERE (ah.record_type_number = 1);


create or replace view "public"."getstudentactivitypi" as  SELECT ah.id AS activity_id,
    ah.account_id,
    ah.record_type,
    ah.record_type_number,
    ah.entry_id,
    ah.date,
    ah.details,
    ah.is_confidential,
    ah.is_child_on_child,
    ah.is_esafety,
    ah.status,
    ah.created_by,
    api."where",
    api.events_prior,
    api.steps_strategies,
    jaa.account_id AS main_staff_id,
    accounts.name
   FROM (((activity_header ah
     LEFT JOIN activity_pi api ON ((api.activity_id = ah.id)))
     JOIN join_account_activity jaa ON ((jaa.activity_id = ah.id)))
     LEFT JOIN accounts ON ((accounts.id = jaa.account_id)))
  WHERE (ah.record_type_number = 5);


create or replace view "public"."getstudentactivitysafeguarding" as  SELECT ah.id AS activity_id,
    ah.account_id,
    ah.record_type,
    ah.record_type_number,
    ah.entry_id,
    ah.date,
    ah.details,
    ah.is_confidential,
    ah.is_child_on_child,
    ah.is_esafety,
    ah.status,
    ah.created_by,
    asf.created_at,
    asf.is_subject,
    jaa.account_id AS main_staff_id,
    accounts.name
   FROM (((activity_header ah
     LEFT JOIN activity_safeguarding asf ON ((asf.activity_id = ah.id)))
     JOIN join_account_activity jaa ON ((jaa.activity_id = ah.id)))
     LEFT JOIN accounts ON ((accounts.id = jaa.account_id)))
  WHERE (ah.record_type_number = 4);


create or replace view "public"."getstudentactivitywelfare" as  SELECT ah.id AS activity_id,
    ah.account_id,
    ah.record_type,
    ah.record_type_number,
    ah.entry_id,
    ah.date,
    ah.details,
    ah.is_confidential,
    ah.is_child_on_child,
    ah.is_esafety,
    ah.status,
    ah.created_by,
    aw.category,
    aw.created_at,
    aw.updated_at,
    aw.is_subject,
    jaa.account_id AS main_staff_id,
    accounts.name
   FROM (((activity_header ah
     LEFT JOIN activity_welfare aw ON ((aw.activity_id = ah.id)))
     JOIN join_account_activity jaa ON ((jaa.activity_id = ah.id)))
     LEFT JOIN accounts ON ((accounts.id = jaa.account_id)))
  WHERE (ah.record_type_number = 3);


create or replace view "public"."getstudentassessments" as  SELECT student_assessments.pk_assessments_id,
    student_assessments.assessment_name,
    jsa.fk_academic_year_id,
    jsa.fk_term_id,
    "substring"(student_assessments.assessment_name, 1, 40) AS short_assessment_name,
    student_assessments.assessment_type,
    student_assessments.assessment_date,
    student_assessments.fk_criteria_type_id,
    student_assessments.show_on_profile,
    student_assessments.grouping_name,
    student_assessments.grouping_order,
    student_assessments.entrance_status_required,
    student_assessments.status,
    jsa.fk_meeting_id,
    lct.criteria_type,
    lct.criteria_number,
    jsa.fk_student_id,
    jsa.pk_join_student_assessments_id,
    jsa.score_numeric,
    jsa.fk_criteria_value_id,
        CASE
            WHEN (student_assessments.entrance_status_required = true) THEN jsa.entrance_status
            WHEN (student_assessments.entrance_status_required = false) THEN 'N/A'::text
            ELSE NULL::text
        END AS entrance_status,
        CASE
            WHEN (student_assessments.entrance_status_required = true) THEN jsa.date_of_event
            WHEN (student_assessments.entrance_status_required = false) THEN NULL::date
            ELSE NULL::date
        END AS date_of_event,
    lcv.description AS score,
    "substring"(lcv.description, 1, 40) AS short_score,
    lcv.value,
    lct.min_value,
    lct.max_value
   FROM ((((student_assessments
     JOIN lu_criteria_type lct ON ((lct.pk_criteria_type_id = student_assessments.fk_criteria_type_id)))
     JOIN join_student_assessments jsa ON ((jsa.fk_assessments_id = student_assessments.pk_assessments_id)))
     JOIN students ON ((students.id = jsa.fk_student_id)))
     LEFT JOIN lu_criteria_values lcv ON ((lcv.pk_criteria_value_id = jsa.fk_criteria_value_id)));


create or replace view "public"."getstudentcontacts" as  SELECT join_student_contacts.id,
    join_student_contacts.student_id,
    join_student_contacts.contact_id,
    contacts.contact_name,
    contacts.name_first,
    contacts.name_last,
    (((contacts.contact_name || ' ('::text) || join_student_contacts.relationship) || ')'::text) AS name_and_relation,
    join_student_contacts.relationship,
    join_student_contacts.is_emergency_contact,
    join_student_contacts.is_lives_with,
    join_student_contacts.is_parental_responsibility,
    contacts.email,
    contacts.phone,
    contacts.organisation_id,
    contacts.job_title,
    contacts.address,
    contacts.address_street1,
    contacts.address_street2,
    contacts.address_city,
    contacts.address_state,
    contacts.address_zip,
    contacts.address_country,
    contacts.department,
    contacts.comments,
    contacts.mobile
   FROM (contacts
     LEFT JOIN join_student_contacts ON ((contacts.id = join_student_contacts.contact_id)));


CREATE OR REPLACE FUNCTION public.http_request()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
      DECLARE
        request_id bigint;
        payload jsonb;
        url text := TG_ARGV[0]::text;
        method text := TG_ARGV[1]::text;
        headers jsonb DEFAULT '{}'::jsonb;
        params jsonb DEFAULT '{}'::jsonb;
        timeout_ms integer DEFAULT 1000;
      BEGIN
        IF url IS NULL OR url = 'null' THEN
          RAISE EXCEPTION 'url argument is missing';
        END IF;

        IF method IS NULL OR method = 'null' THEN
          RAISE EXCEPTION 'method argument is missing';
        END IF;

        IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
          headers = '{"Content-Type": "application/json"}'::jsonb;
        ELSE
          headers = TG_ARGV[2]::jsonb;
        END IF;

        IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
          params = '{}'::jsonb;
        ELSE
          params = TG_ARGV[3]::jsonb;
        END IF;

        IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
          timeout_ms = 1000;
        ELSE
          timeout_ms = TG_ARGV[4]::integer;
        END IF;

        CASE
          WHEN method = 'GET' THEN
            SELECT http_get INTO request_id FROM net.http_get(
              url,
              params,
              headers,
              timeout_ms
            );
          WHEN method = 'POST' THEN
            payload = jsonb_build_object(
              'old_record', OLD,
              'record', NEW,
              'type', TG_OP,
              'table', TG_TABLE_NAME,
              'schema', TG_TABLE_SCHEMA
            );

            SELECT http_post INTO request_id FROM net.http_post(
              url,
              payload,
              params,
              headers,
              timeout_ms
            );
          ELSE
            RAISE EXCEPTION 'method argument % is invalid', method;
        END CASE;

        /*
        INSERT INTO supabase_functions.hooks
          (hook_table_id, hook_name, request_id)
        VALUES
          (TG_RELID, TG_NAME, request_id);
        */
        
        RETURN NEW;
      END
    $function$
;

CREATE OR REPLACE FUNCTION public.increment(x integer, row_id uuid)
 RETURNS void
 LANGUAGE sql
AS $function$
  update rm_risks 
  set entry_id = entry_id + x
  where pk_risk_id = row_id
$function$
;

CREATE OR REPLACE FUNCTION public.increment2(x integer, row_id uuid)
 RETURNS void
 LANGUAGE sql
 SECURITY DEFINER
AS $function$  update rm_risks 
  set entry_id = entry_id + x
  where pk_risk_id = row_id$function$
;

CREATE OR REPLACE FUNCTION public.make_lower_case()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
begin
  new.email := lower(new.email);
  return new;
end;
$function$
;

create or replace view "public"."referral_status_view" as  SELECT j.referral_id,
    s_old.status AS old_status,
    s_new.status AS new_status,
    st_old.stage AS old_stage,
    st_new.stage AS new_stage,
    'same'::text AS status_and_stage_comparison,
    r.child_id,
    r.service_name,
    r.display_child,
    r.organisation_name,
    r.date_referral,
    r.placement_offered,
    r.barrier_to_placement,
    r.diagnosis,
    r.status,
    r.created_at,
    r.source_location,
    rs.primary_diagnosis,
    rs.other_diagnoses,
    r.closed_reason,
    r.la_closed
   FROM ((((((join_referral_status j
     JOIN lu_ref_status s_old ON ((j.old_status_id = s_old.id)))
     JOIN lu_ref_status s_new ON ((j.new_status_id = s_new.id)))
     JOIN lu_ref_stage st_old ON ((j.old_stage_id = st_old.id)))
     JOIN lu_ref_stage st_new ON ((j.new_stage_id = st_new.id)))
     JOIN referrals r ON ((j.referral_id = r.id)))
     JOIN referrals_stage1 rs ON ((j.referral_id = rs.referral_id)));


create or replace view "public"."referrals_view" as  SELECT r.id,
    r.service_name,
    r.child_id,
    r.display_child,
    r.organisation_name,
    r.date_referral,
    r.source,
    r.placement_offered,
    r.barrier_to_placement,
    r.diagnosis,
    r.probablity_rating,
    r.source_location,
    r.proposed_start,
    r.status,
    r.date_created,
    r.completed_by,
    r.closed_reason,
    rs1.primary_diagnosis,
    rs1.other_diagnoses,
    rs1.perc_complete AS stage1_perc_complete,
    rs2.perc_complete AS stage2_perc_complete,
    rs3.perc_complete AS stage3_perc_complete,
    rs4.perc_complete AS stage4_perc_complete,
    rs5.perc_complete AS stage5_perc_complete
   FROM (((((referrals r
     LEFT JOIN referrals_stage1 rs1 ON ((r.id = rs1.referral_id)))
     LEFT JOIN referrals_stage2 rs2 ON ((r.id = rs2.referral_id)))
     LEFT JOIN referrals_stage3 rs3 ON ((r.id = rs3.referral_id)))
     LEFT JOIN referrals_stage4 rs4 ON ((r.id = rs4.referral_id)))
     LEFT JOIN referrals_stage5 rs5 ON ((r.id = rs5.referral_id)));


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


create or replace view "public"."sow_report_view" as  SELECT sh.sow_type,
    sh.name,
    sh.summary,
    sh.industry_expert,
    sh.beautiful_work,
    sh.public_presentation,
    sh.community_impact,
    sh.resources_required,
    sh.pshe_links,
    sh.pfa_links AS sow_pfa_links,
    spl.week_id,
    spl.resources,
    spl.pfa_links AS plan_pfa_links,
    spl.task,
    spl.extension,
    spl.pillar_focus,
    sst.step_name,
    sst.sorting
   FROM (((((sow_header sh
     LEFT JOIN sow_plan spl ON ((sh.id = spl.sow_header_id)))
     LEFT JOIN sow_steps sst ON ((sh.id = sst.sow_header_id)))
     LEFT JOIN sow_texts stx ON ((sh.id = stx.sow_header_id)))
     LEFT JOIN curr_map_texts ct ON ((stx.curr_map_text_id = ct.id)))
     LEFT JOIN sow_topics sto ON ((ct.id = sto.id)));


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


create or replace view "public"."view_active_accounts" as  SELECT accounts.id,
    accounts.name,
    accounts.email
   FROM accounts
  WHERE (accounts.user_status = 'Active'::text)
  ORDER BY accounts.name_last;


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


create or replace view "public"."vw_student_ilp_by_term" as  SELECT students.display_student_name,
    sih.id AS ilp_id,
    cmh.service_id,
    cmh.term_id
   FROM ((students
     JOIN student_ilp_header sih ON ((sih.student_id = students.id)))
     JOIN curr_map_header cmh ON ((cmh.id = sih.curr_map_header_id)));


create or replace view "public"."weekly_plan_milestones_ehcp_all" as  SELECT s.display_student_name,
    st.type,
    st.display_target,
    sm.milestone,
    lec.category,
    lec.display_category_name,
    sma.milestone_completed AS assessment,
    jps.sow_plan_id
   FROM ((((((join_plan_students jps
     JOIN students s ON ((s.id = jps.student_id)))
     JOIN join_plan_student_milestones jpsm ON ((jpsm.join_plan_student_id = jps.id)))
     JOIN student_milestones sm ON ((sm.id = jpsm.student_milestone_id)))
     JOIN student_targets st ON ((st.id = sm.target_id)))
     JOIN student_milestone_assessments sma ON ((sma.milestone_id = sm.id)))
     JOIN lu_ehcp_categories lec ON ((lec.id = st.ehcp_category_id)));


create or replace view "public"."weekly_plan_milestones_pillar_all" as  SELECT s.display_student_name,
    st.type,
    ltop.pillar,
    ltop.cache_type AS pillar_type,
    ltop.subject,
    st.display_target,
    sm.milestone,
    sma.milestone_completed AS assessment,
    jps.sow_plan_id
   FROM (((((((join_plan_students jps
     JOIN students s ON ((s.id = jps.student_id)))
     JOIN join_plan_student_milestones jpsm ON ((jpsm.join_plan_student_id = jps.id)))
     JOIN student_milestones sm ON ((sm.id = jpsm.student_milestone_id)))
     JOIN student_targets st ON ((st.id = sm.target_id)))
     JOIN lu_pillar_target_cache lptc ON ((lptc.id = st.target_cache_id)))
     JOIN lu_pillar_topic_cache ltop ON ((ltop.id = lptc.topic_id)))
     JOIN student_milestone_assessments sma ON ((sma.milestone_id = sm.id)));


grant delete on table "public"."Student_target_assessment_history" to "anon";

grant insert on table "public"."Student_target_assessment_history" to "anon";

grant references on table "public"."Student_target_assessment_history" to "anon";

grant select on table "public"."Student_target_assessment_history" to "anon";

grant trigger on table "public"."Student_target_assessment_history" to "anon";

grant truncate on table "public"."Student_target_assessment_history" to "anon";

grant update on table "public"."Student_target_assessment_history" to "anon";

grant delete on table "public"."Student_target_assessment_history" to "authenticated";

grant insert on table "public"."Student_target_assessment_history" to "authenticated";

grant references on table "public"."Student_target_assessment_history" to "authenticated";

grant select on table "public"."Student_target_assessment_history" to "authenticated";

grant trigger on table "public"."Student_target_assessment_history" to "authenticated";

grant truncate on table "public"."Student_target_assessment_history" to "authenticated";

grant update on table "public"."Student_target_assessment_history" to "authenticated";

grant delete on table "public"."Student_target_assessment_history" to "service_role";

grant insert on table "public"."Student_target_assessment_history" to "service_role";

grant references on table "public"."Student_target_assessment_history" to "service_role";

grant select on table "public"."Student_target_assessment_history" to "service_role";

grant trigger on table "public"."Student_target_assessment_history" to "service_role";

grant truncate on table "public"."Student_target_assessment_history" to "service_role";

grant update on table "public"."Student_target_assessment_history" to "service_role";

grant delete on table "public"."academic_years" to "anon";

grant insert on table "public"."academic_years" to "anon";

grant references on table "public"."academic_years" to "anon";

grant select on table "public"."academic_years" to "anon";

grant trigger on table "public"."academic_years" to "anon";

grant truncate on table "public"."academic_years" to "anon";

grant update on table "public"."academic_years" to "anon";

grant delete on table "public"."academic_years" to "authenticated";

grant insert on table "public"."academic_years" to "authenticated";

grant references on table "public"."academic_years" to "authenticated";

grant select on table "public"."academic_years" to "authenticated";

grant trigger on table "public"."academic_years" to "authenticated";

grant truncate on table "public"."academic_years" to "authenticated";

grant update on table "public"."academic_years" to "authenticated";

grant delete on table "public"."academic_years" to "service_role";

grant insert on table "public"."academic_years" to "service_role";

grant references on table "public"."academic_years" to "service_role";

grant select on table "public"."academic_years" to "service_role";

grant trigger on table "public"."academic_years" to "service_role";

grant truncate on table "public"."academic_years" to "service_role";

grant update on table "public"."academic_years" to "service_role";

grant delete on table "public"."accounts" to "anon";

grant insert on table "public"."accounts" to "anon";

grant references on table "public"."accounts" to "anon";

grant select on table "public"."accounts" to "anon";

grant trigger on table "public"."accounts" to "anon";

grant truncate on table "public"."accounts" to "anon";

grant update on table "public"."accounts" to "anon";

grant delete on table "public"."accounts" to "authenticated";

grant insert on table "public"."accounts" to "authenticated";

grant references on table "public"."accounts" to "authenticated";

grant select on table "public"."accounts" to "authenticated";

grant trigger on table "public"."accounts" to "authenticated";

grant truncate on table "public"."accounts" to "authenticated";

grant update on table "public"."accounts" to "authenticated";

grant delete on table "public"."accounts" to "service_role";

grant insert on table "public"."accounts" to "service_role";

grant references on table "public"."accounts" to "service_role";

grant select on table "public"."accounts" to "service_role";

grant trigger on table "public"."accounts" to "service_role";

grant truncate on table "public"."accounts" to "service_role";

grant update on table "public"."accounts" to "service_role";

grant delete on table "public"."actions" to "anon";

grant insert on table "public"."actions" to "anon";

grant references on table "public"."actions" to "anon";

grant select on table "public"."actions" to "anon";

grant trigger on table "public"."actions" to "anon";

grant truncate on table "public"."actions" to "anon";

grant update on table "public"."actions" to "anon";

grant delete on table "public"."actions" to "authenticated";

grant insert on table "public"."actions" to "authenticated";

grant references on table "public"."actions" to "authenticated";

grant select on table "public"."actions" to "authenticated";

grant trigger on table "public"."actions" to "authenticated";

grant truncate on table "public"."actions" to "authenticated";

grant update on table "public"."actions" to "authenticated";

grant delete on table "public"."actions" to "service_role";

grant insert on table "public"."actions" to "service_role";

grant references on table "public"."actions" to "service_role";

grant select on table "public"."actions" to "service_role";

grant trigger on table "public"."actions" to "service_role";

grant truncate on table "public"."actions" to "service_role";

grant update on table "public"."actions" to "service_role";

grant delete on table "public"."activities" to "anon";

grant insert on table "public"."activities" to "anon";

grant references on table "public"."activities" to "anon";

grant select on table "public"."activities" to "anon";

grant trigger on table "public"."activities" to "anon";

grant truncate on table "public"."activities" to "anon";

grant update on table "public"."activities" to "anon";

grant delete on table "public"."activities" to "authenticated";

grant insert on table "public"."activities" to "authenticated";

grant references on table "public"."activities" to "authenticated";

grant select on table "public"."activities" to "authenticated";

grant trigger on table "public"."activities" to "authenticated";

grant truncate on table "public"."activities" to "authenticated";

grant update on table "public"."activities" to "authenticated";

grant delete on table "public"."activities" to "service_role";

grant insert on table "public"."activities" to "service_role";

grant references on table "public"."activities" to "service_role";

grant select on table "public"."activities" to "service_role";

grant trigger on table "public"."activities" to "service_role";

grant truncate on table "public"."activities" to "service_role";

grant update on table "public"."activities" to "service_role";

grant delete on table "public"."activity_followup_header" to "anon";

grant insert on table "public"."activity_followup_header" to "anon";

grant references on table "public"."activity_followup_header" to "anon";

grant select on table "public"."activity_followup_header" to "anon";

grant trigger on table "public"."activity_followup_header" to "anon";

grant truncate on table "public"."activity_followup_header" to "anon";

grant update on table "public"."activity_followup_header" to "anon";

grant delete on table "public"."activity_followup_header" to "authenticated";

grant insert on table "public"."activity_followup_header" to "authenticated";

grant references on table "public"."activity_followup_header" to "authenticated";

grant select on table "public"."activity_followup_header" to "authenticated";

grant trigger on table "public"."activity_followup_header" to "authenticated";

grant truncate on table "public"."activity_followup_header" to "authenticated";

grant update on table "public"."activity_followup_header" to "authenticated";

grant delete on table "public"."activity_followup_header" to "service_role";

grant insert on table "public"."activity_followup_header" to "service_role";

grant references on table "public"."activity_followup_header" to "service_role";

grant select on table "public"."activity_followup_header" to "service_role";

grant trigger on table "public"."activity_followup_header" to "service_role";

grant truncate on table "public"."activity_followup_header" to "service_role";

grant update on table "public"."activity_followup_header" to "service_role";

grant delete on table "public"."activity_followup_incident_safeguarding" to "anon";

grant insert on table "public"."activity_followup_incident_safeguarding" to "anon";

grant references on table "public"."activity_followup_incident_safeguarding" to "anon";

grant select on table "public"."activity_followup_incident_safeguarding" to "anon";

grant trigger on table "public"."activity_followup_incident_safeguarding" to "anon";

grant truncate on table "public"."activity_followup_incident_safeguarding" to "anon";

grant update on table "public"."activity_followup_incident_safeguarding" to "anon";

grant delete on table "public"."activity_followup_incident_safeguarding" to "authenticated";

grant insert on table "public"."activity_followup_incident_safeguarding" to "authenticated";

grant references on table "public"."activity_followup_incident_safeguarding" to "authenticated";

grant select on table "public"."activity_followup_incident_safeguarding" to "authenticated";

grant trigger on table "public"."activity_followup_incident_safeguarding" to "authenticated";

grant truncate on table "public"."activity_followup_incident_safeguarding" to "authenticated";

grant update on table "public"."activity_followup_incident_safeguarding" to "authenticated";

grant delete on table "public"."activity_followup_incident_safeguarding" to "service_role";

grant insert on table "public"."activity_followup_incident_safeguarding" to "service_role";

grant references on table "public"."activity_followup_incident_safeguarding" to "service_role";

grant select on table "public"."activity_followup_incident_safeguarding" to "service_role";

grant trigger on table "public"."activity_followup_incident_safeguarding" to "service_role";

grant truncate on table "public"."activity_followup_incident_safeguarding" to "service_role";

grant update on table "public"."activity_followup_incident_safeguarding" to "service_role";

grant delete on table "public"."activity_followup_notification" to "anon";

grant insert on table "public"."activity_followup_notification" to "anon";

grant references on table "public"."activity_followup_notification" to "anon";

grant select on table "public"."activity_followup_notification" to "anon";

grant trigger on table "public"."activity_followup_notification" to "anon";

grant truncate on table "public"."activity_followup_notification" to "anon";

grant update on table "public"."activity_followup_notification" to "anon";

grant delete on table "public"."activity_followup_notification" to "authenticated";

grant insert on table "public"."activity_followup_notification" to "authenticated";

grant references on table "public"."activity_followup_notification" to "authenticated";

grant select on table "public"."activity_followup_notification" to "authenticated";

grant trigger on table "public"."activity_followup_notification" to "authenticated";

grant truncate on table "public"."activity_followup_notification" to "authenticated";

grant update on table "public"."activity_followup_notification" to "authenticated";

grant delete on table "public"."activity_followup_notification" to "service_role";

grant insert on table "public"."activity_followup_notification" to "service_role";

grant references on table "public"."activity_followup_notification" to "service_role";

grant select on table "public"."activity_followup_notification" to "service_role";

grant trigger on table "public"."activity_followup_notification" to "service_role";

grant truncate on table "public"."activity_followup_notification" to "service_role";

grant update on table "public"."activity_followup_notification" to "service_role";

grant delete on table "public"."activity_followup_pi" to "anon";

grant insert on table "public"."activity_followup_pi" to "anon";

grant references on table "public"."activity_followup_pi" to "anon";

grant select on table "public"."activity_followup_pi" to "anon";

grant trigger on table "public"."activity_followup_pi" to "anon";

grant truncate on table "public"."activity_followup_pi" to "anon";

grant update on table "public"."activity_followup_pi" to "anon";

grant delete on table "public"."activity_followup_pi" to "authenticated";

grant insert on table "public"."activity_followup_pi" to "authenticated";

grant references on table "public"."activity_followup_pi" to "authenticated";

grant select on table "public"."activity_followup_pi" to "authenticated";

grant trigger on table "public"."activity_followup_pi" to "authenticated";

grant truncate on table "public"."activity_followup_pi" to "authenticated";

grant update on table "public"."activity_followup_pi" to "authenticated";

grant delete on table "public"."activity_followup_pi" to "service_role";

grant insert on table "public"."activity_followup_pi" to "service_role";

grant references on table "public"."activity_followup_pi" to "service_role";

grant select on table "public"."activity_followup_pi" to "service_role";

grant trigger on table "public"."activity_followup_pi" to "service_role";

grant truncate on table "public"."activity_followup_pi" to "service_role";

grant update on table "public"."activity_followup_pi" to "service_role";

grant delete on table "public"."activity_header" to "anon";

grant insert on table "public"."activity_header" to "anon";

grant references on table "public"."activity_header" to "anon";

grant select on table "public"."activity_header" to "anon";

grant trigger on table "public"."activity_header" to "anon";

grant truncate on table "public"."activity_header" to "anon";

grant update on table "public"."activity_header" to "anon";

grant delete on table "public"."activity_header" to "authenticated";

grant insert on table "public"."activity_header" to "authenticated";

grant references on table "public"."activity_header" to "authenticated";

grant select on table "public"."activity_header" to "authenticated";

grant trigger on table "public"."activity_header" to "authenticated";

grant truncate on table "public"."activity_header" to "authenticated";

grant update on table "public"."activity_header" to "authenticated";

grant delete on table "public"."activity_header" to "service_role";

grant insert on table "public"."activity_header" to "service_role";

grant references on table "public"."activity_header" to "service_role";

grant select on table "public"."activity_header" to "service_role";

grant trigger on table "public"."activity_header" to "service_role";

grant truncate on table "public"."activity_header" to "service_role";

grant update on table "public"."activity_header" to "service_role";

grant delete on table "public"."activity_incident" to "anon";

grant insert on table "public"."activity_incident" to "anon";

grant references on table "public"."activity_incident" to "anon";

grant select on table "public"."activity_incident" to "anon";

grant trigger on table "public"."activity_incident" to "anon";

grant truncate on table "public"."activity_incident" to "anon";

grant update on table "public"."activity_incident" to "anon";

grant delete on table "public"."activity_incident" to "authenticated";

grant insert on table "public"."activity_incident" to "authenticated";

grant references on table "public"."activity_incident" to "authenticated";

grant select on table "public"."activity_incident" to "authenticated";

grant trigger on table "public"."activity_incident" to "authenticated";

grant truncate on table "public"."activity_incident" to "authenticated";

grant update on table "public"."activity_incident" to "authenticated";

grant delete on table "public"."activity_incident" to "service_role";

grant insert on table "public"."activity_incident" to "service_role";

grant references on table "public"."activity_incident" to "service_role";

grant select on table "public"."activity_incident" to "service_role";

grant trigger on table "public"."activity_incident" to "service_role";

grant truncate on table "public"."activity_incident" to "service_role";

grant update on table "public"."activity_incident" to "service_role";

grant delete on table "public"."activity_log" to "anon";

grant insert on table "public"."activity_log" to "anon";

grant references on table "public"."activity_log" to "anon";

grant select on table "public"."activity_log" to "anon";

grant trigger on table "public"."activity_log" to "anon";

grant truncate on table "public"."activity_log" to "anon";

grant update on table "public"."activity_log" to "anon";

grant delete on table "public"."activity_log" to "authenticated";

grant insert on table "public"."activity_log" to "authenticated";

grant references on table "public"."activity_log" to "authenticated";

grant select on table "public"."activity_log" to "authenticated";

grant trigger on table "public"."activity_log" to "authenticated";

grant truncate on table "public"."activity_log" to "authenticated";

grant update on table "public"."activity_log" to "authenticated";

grant delete on table "public"."activity_log" to "service_role";

grant insert on table "public"."activity_log" to "service_role";

grant references on table "public"."activity_log" to "service_role";

grant select on table "public"."activity_log" to "service_role";

grant trigger on table "public"."activity_log" to "service_role";

grant truncate on table "public"."activity_log" to "service_role";

grant update on table "public"."activity_log" to "service_role";

grant delete on table "public"."activity_pi" to "anon";

grant insert on table "public"."activity_pi" to "anon";

grant references on table "public"."activity_pi" to "anon";

grant select on table "public"."activity_pi" to "anon";

grant trigger on table "public"."activity_pi" to "anon";

grant truncate on table "public"."activity_pi" to "anon";

grant update on table "public"."activity_pi" to "anon";

grant delete on table "public"."activity_pi" to "authenticated";

grant insert on table "public"."activity_pi" to "authenticated";

grant references on table "public"."activity_pi" to "authenticated";

grant select on table "public"."activity_pi" to "authenticated";

grant trigger on table "public"."activity_pi" to "authenticated";

grant truncate on table "public"."activity_pi" to "authenticated";

grant update on table "public"."activity_pi" to "authenticated";

grant delete on table "public"."activity_pi" to "service_role";

grant insert on table "public"."activity_pi" to "service_role";

grant references on table "public"."activity_pi" to "service_role";

grant select on table "public"."activity_pi" to "service_role";

grant trigger on table "public"."activity_pi" to "service_role";

grant truncate on table "public"."activity_pi" to "service_role";

grant update on table "public"."activity_pi" to "service_role";

grant delete on table "public"."activity_pi_interventions" to "anon";

grant insert on table "public"."activity_pi_interventions" to "anon";

grant references on table "public"."activity_pi_interventions" to "anon";

grant select on table "public"."activity_pi_interventions" to "anon";

grant trigger on table "public"."activity_pi_interventions" to "anon";

grant truncate on table "public"."activity_pi_interventions" to "anon";

grant update on table "public"."activity_pi_interventions" to "anon";

grant delete on table "public"."activity_pi_interventions" to "authenticated";

grant insert on table "public"."activity_pi_interventions" to "authenticated";

grant references on table "public"."activity_pi_interventions" to "authenticated";

grant select on table "public"."activity_pi_interventions" to "authenticated";

grant trigger on table "public"."activity_pi_interventions" to "authenticated";

grant truncate on table "public"."activity_pi_interventions" to "authenticated";

grant update on table "public"."activity_pi_interventions" to "authenticated";

grant delete on table "public"."activity_pi_interventions" to "service_role";

grant insert on table "public"."activity_pi_interventions" to "service_role";

grant references on table "public"."activity_pi_interventions" to "service_role";

grant select on table "public"."activity_pi_interventions" to "service_role";

grant trigger on table "public"."activity_pi_interventions" to "service_role";

grant truncate on table "public"."activity_pi_interventions" to "service_role";

grant update on table "public"."activity_pi_interventions" to "service_role";

grant delete on table "public"."activity_safeguarding" to "anon";

grant insert on table "public"."activity_safeguarding" to "anon";

grant references on table "public"."activity_safeguarding" to "anon";

grant select on table "public"."activity_safeguarding" to "anon";

grant trigger on table "public"."activity_safeguarding" to "anon";

grant truncate on table "public"."activity_safeguarding" to "anon";

grant update on table "public"."activity_safeguarding" to "anon";

grant delete on table "public"."activity_safeguarding" to "authenticated";

grant insert on table "public"."activity_safeguarding" to "authenticated";

grant references on table "public"."activity_safeguarding" to "authenticated";

grant select on table "public"."activity_safeguarding" to "authenticated";

grant trigger on table "public"."activity_safeguarding" to "authenticated";

grant truncate on table "public"."activity_safeguarding" to "authenticated";

grant update on table "public"."activity_safeguarding" to "authenticated";

grant delete on table "public"."activity_safeguarding" to "service_role";

grant insert on table "public"."activity_safeguarding" to "service_role";

grant references on table "public"."activity_safeguarding" to "service_role";

grant select on table "public"."activity_safeguarding" to "service_role";

grant trigger on table "public"."activity_safeguarding" to "service_role";

grant truncate on table "public"."activity_safeguarding" to "service_role";

grant update on table "public"."activity_safeguarding" to "service_role";

grant delete on table "public"."activity_welfare" to "anon";

grant insert on table "public"."activity_welfare" to "anon";

grant references on table "public"."activity_welfare" to "anon";

grant select on table "public"."activity_welfare" to "anon";

grant trigger on table "public"."activity_welfare" to "anon";

grant truncate on table "public"."activity_welfare" to "anon";

grant update on table "public"."activity_welfare" to "anon";

grant delete on table "public"."activity_welfare" to "authenticated";

grant insert on table "public"."activity_welfare" to "authenticated";

grant references on table "public"."activity_welfare" to "authenticated";

grant select on table "public"."activity_welfare" to "authenticated";

grant trigger on table "public"."activity_welfare" to "authenticated";

grant truncate on table "public"."activity_welfare" to "authenticated";

grant update on table "public"."activity_welfare" to "authenticated";

grant delete on table "public"."activity_welfare" to "service_role";

grant insert on table "public"."activity_welfare" to "service_role";

grant references on table "public"."activity_welfare" to "service_role";

grant select on table "public"."activity_welfare" to "service_role";

grant trigger on table "public"."activity_welfare" to "service_role";

grant truncate on table "public"."activity_welfare" to "service_role";

grant update on table "public"."activity_welfare" to "service_role";

grant delete on table "public"."aims" to "anon";

grant insert on table "public"."aims" to "anon";

grant references on table "public"."aims" to "anon";

grant select on table "public"."aims" to "anon";

grant trigger on table "public"."aims" to "anon";

grant truncate on table "public"."aims" to "anon";

grant update on table "public"."aims" to "anon";

grant delete on table "public"."aims" to "authenticated";

grant insert on table "public"."aims" to "authenticated";

grant references on table "public"."aims" to "authenticated";

grant select on table "public"."aims" to "authenticated";

grant trigger on table "public"."aims" to "authenticated";

grant truncate on table "public"."aims" to "authenticated";

grant update on table "public"."aims" to "authenticated";

grant delete on table "public"."aims" to "service_role";

grant insert on table "public"."aims" to "service_role";

grant references on table "public"."aims" to "service_role";

grant select on table "public"."aims" to "service_role";

grant trigger on table "public"."aims" to "service_role";

grant truncate on table "public"."aims" to "service_role";

grant update on table "public"."aims" to "service_role";

grant delete on table "public"."applications" to "anon";

grant insert on table "public"."applications" to "anon";

grant references on table "public"."applications" to "anon";

grant select on table "public"."applications" to "anon";

grant trigger on table "public"."applications" to "anon";

grant truncate on table "public"."applications" to "anon";

grant update on table "public"."applications" to "anon";

grant delete on table "public"."applications" to "authenticated";

grant insert on table "public"."applications" to "authenticated";

grant references on table "public"."applications" to "authenticated";

grant select on table "public"."applications" to "authenticated";

grant trigger on table "public"."applications" to "authenticated";

grant truncate on table "public"."applications" to "authenticated";

grant update on table "public"."applications" to "authenticated";

grant delete on table "public"."applications" to "service_role";

grant insert on table "public"."applications" to "service_role";

grant references on table "public"."applications" to "service_role";

grant select on table "public"."applications" to "service_role";

grant trigger on table "public"."applications" to "service_role";

grant truncate on table "public"."applications" to "service_role";

grant update on table "public"."applications" to "service_role";

grant delete on table "public"."attendance" to "anon";

grant insert on table "public"."attendance" to "anon";

grant references on table "public"."attendance" to "anon";

grant select on table "public"."attendance" to "anon";

grant trigger on table "public"."attendance" to "anon";

grant truncate on table "public"."attendance" to "anon";

grant update on table "public"."attendance" to "anon";

grant delete on table "public"."attendance" to "authenticated";

grant insert on table "public"."attendance" to "authenticated";

grant references on table "public"."attendance" to "authenticated";

grant select on table "public"."attendance" to "authenticated";

grant trigger on table "public"."attendance" to "authenticated";

grant truncate on table "public"."attendance" to "authenticated";

grant update on table "public"."attendance" to "authenticated";

grant delete on table "public"."attendance" to "service_role";

grant insert on table "public"."attendance" to "service_role";

grant references on table "public"."attendance" to "service_role";

grant select on table "public"."attendance" to "service_role";

grant trigger on table "public"."attendance" to "service_role";

grant truncate on table "public"."attendance" to "service_role";

grant update on table "public"."attendance" to "service_role";

grant delete on table "public"."base_groups" to "anon";

grant insert on table "public"."base_groups" to "anon";

grant references on table "public"."base_groups" to "anon";

grant select on table "public"."base_groups" to "anon";

grant trigger on table "public"."base_groups" to "anon";

grant truncate on table "public"."base_groups" to "anon";

grant update on table "public"."base_groups" to "anon";

grant delete on table "public"."base_groups" to "authenticated";

grant insert on table "public"."base_groups" to "authenticated";

grant references on table "public"."base_groups" to "authenticated";

grant select on table "public"."base_groups" to "authenticated";

grant trigger on table "public"."base_groups" to "authenticated";

grant truncate on table "public"."base_groups" to "authenticated";

grant update on table "public"."base_groups" to "authenticated";

grant delete on table "public"."base_groups" to "service_role";

grant insert on table "public"."base_groups" to "service_role";

grant references on table "public"."base_groups" to "service_role";

grant select on table "public"."base_groups" to "service_role";

grant trigger on table "public"."base_groups" to "service_role";

grant truncate on table "public"."base_groups" to "service_role";

grant update on table "public"."base_groups" to "service_role";

grant delete on table "public"."children" to "anon";

grant insert on table "public"."children" to "anon";

grant references on table "public"."children" to "anon";

grant select on table "public"."children" to "anon";

grant trigger on table "public"."children" to "anon";

grant truncate on table "public"."children" to "anon";

grant update on table "public"."children" to "anon";

grant delete on table "public"."children" to "authenticated";

grant insert on table "public"."children" to "authenticated";

grant references on table "public"."children" to "authenticated";

grant select on table "public"."children" to "authenticated";

grant trigger on table "public"."children" to "authenticated";

grant truncate on table "public"."children" to "authenticated";

grant update on table "public"."children" to "authenticated";

grant delete on table "public"."children" to "service_role";

grant insert on table "public"."children" to "service_role";

grant references on table "public"."children" to "service_role";

grant select on table "public"."children" to "service_role";

grant trigger on table "public"."children" to "service_role";

grant truncate on table "public"."children" to "service_role";

grant update on table "public"."children" to "service_role";

grant delete on table "public"."contacts" to "anon";

grant insert on table "public"."contacts" to "anon";

grant references on table "public"."contacts" to "anon";

grant select on table "public"."contacts" to "anon";

grant trigger on table "public"."contacts" to "anon";

grant truncate on table "public"."contacts" to "anon";

grant update on table "public"."contacts" to "anon";

grant delete on table "public"."contacts" to "authenticated";

grant insert on table "public"."contacts" to "authenticated";

grant references on table "public"."contacts" to "authenticated";

grant select on table "public"."contacts" to "authenticated";

grant trigger on table "public"."contacts" to "authenticated";

grant truncate on table "public"."contacts" to "authenticated";

grant update on table "public"."contacts" to "authenticated";

grant delete on table "public"."contacts" to "service_role";

grant insert on table "public"."contacts" to "service_role";

grant references on table "public"."contacts" to "service_role";

grant select on table "public"."contacts" to "service_role";

grant trigger on table "public"."contacts" to "service_role";

grant truncate on table "public"."contacts" to "service_role";

grant update on table "public"."contacts" to "service_role";

grant delete on table "public"."contextual_overview" to "anon";

grant insert on table "public"."contextual_overview" to "anon";

grant references on table "public"."contextual_overview" to "anon";

grant select on table "public"."contextual_overview" to "anon";

grant trigger on table "public"."contextual_overview" to "anon";

grant truncate on table "public"."contextual_overview" to "anon";

grant update on table "public"."contextual_overview" to "anon";

grant delete on table "public"."contextual_overview" to "authenticated";

grant insert on table "public"."contextual_overview" to "authenticated";

grant references on table "public"."contextual_overview" to "authenticated";

grant select on table "public"."contextual_overview" to "authenticated";

grant trigger on table "public"."contextual_overview" to "authenticated";

grant truncate on table "public"."contextual_overview" to "authenticated";

grant update on table "public"."contextual_overview" to "authenticated";

grant delete on table "public"."contextual_overview" to "service_role";

grant insert on table "public"."contextual_overview" to "service_role";

grant references on table "public"."contextual_overview" to "service_role";

grant select on table "public"."contextual_overview" to "service_role";

grant trigger on table "public"."contextual_overview" to "service_role";

grant truncate on table "public"."contextual_overview" to "service_role";

grant update on table "public"."contextual_overview" to "service_role";

grant delete on table "public"."curr_map_header" to "anon";

grant insert on table "public"."curr_map_header" to "anon";

grant references on table "public"."curr_map_header" to "anon";

grant select on table "public"."curr_map_header" to "anon";

grant trigger on table "public"."curr_map_header" to "anon";

grant truncate on table "public"."curr_map_header" to "anon";

grant update on table "public"."curr_map_header" to "anon";

grant delete on table "public"."curr_map_header" to "authenticated";

grant insert on table "public"."curr_map_header" to "authenticated";

grant references on table "public"."curr_map_header" to "authenticated";

grant select on table "public"."curr_map_header" to "authenticated";

grant trigger on table "public"."curr_map_header" to "authenticated";

grant truncate on table "public"."curr_map_header" to "authenticated";

grant update on table "public"."curr_map_header" to "authenticated";

grant delete on table "public"."curr_map_header" to "service_role";

grant insert on table "public"."curr_map_header" to "service_role";

grant references on table "public"."curr_map_header" to "service_role";

grant select on table "public"."curr_map_header" to "service_role";

grant trigger on table "public"."curr_map_header" to "service_role";

grant truncate on table "public"."curr_map_header" to "service_role";

grant update on table "public"."curr_map_header" to "service_role";

grant delete on table "public"."curr_map_phases" to "anon";

grant insert on table "public"."curr_map_phases" to "anon";

grant references on table "public"."curr_map_phases" to "anon";

grant select on table "public"."curr_map_phases" to "anon";

grant trigger on table "public"."curr_map_phases" to "anon";

grant truncate on table "public"."curr_map_phases" to "anon";

grant update on table "public"."curr_map_phases" to "anon";

grant delete on table "public"."curr_map_phases" to "authenticated";

grant insert on table "public"."curr_map_phases" to "authenticated";

grant references on table "public"."curr_map_phases" to "authenticated";

grant select on table "public"."curr_map_phases" to "authenticated";

grant trigger on table "public"."curr_map_phases" to "authenticated";

grant truncate on table "public"."curr_map_phases" to "authenticated";

grant update on table "public"."curr_map_phases" to "authenticated";

grant delete on table "public"."curr_map_phases" to "service_role";

grant insert on table "public"."curr_map_phases" to "service_role";

grant references on table "public"."curr_map_phases" to "service_role";

grant select on table "public"."curr_map_phases" to "service_role";

grant trigger on table "public"."curr_map_phases" to "service_role";

grant truncate on table "public"."curr_map_phases" to "service_role";

grant update on table "public"."curr_map_phases" to "service_role";

grant delete on table "public"."curr_map_texts" to "anon";

grant insert on table "public"."curr_map_texts" to "anon";

grant references on table "public"."curr_map_texts" to "anon";

grant select on table "public"."curr_map_texts" to "anon";

grant trigger on table "public"."curr_map_texts" to "anon";

grant truncate on table "public"."curr_map_texts" to "anon";

grant update on table "public"."curr_map_texts" to "anon";

grant delete on table "public"."curr_map_texts" to "authenticated";

grant insert on table "public"."curr_map_texts" to "authenticated";

grant references on table "public"."curr_map_texts" to "authenticated";

grant select on table "public"."curr_map_texts" to "authenticated";

grant trigger on table "public"."curr_map_texts" to "authenticated";

grant truncate on table "public"."curr_map_texts" to "authenticated";

grant update on table "public"."curr_map_texts" to "authenticated";

grant delete on table "public"."curr_map_texts" to "service_role";

grant insert on table "public"."curr_map_texts" to "service_role";

grant references on table "public"."curr_map_texts" to "service_role";

grant select on table "public"."curr_map_texts" to "service_role";

grant trigger on table "public"."curr_map_texts" to "service_role";

grant truncate on table "public"."curr_map_texts" to "service_role";

grant update on table "public"."curr_map_texts" to "service_role";

grant delete on table "public"."curr_map_topics" to "anon";

grant insert on table "public"."curr_map_topics" to "anon";

grant references on table "public"."curr_map_topics" to "anon";

grant select on table "public"."curr_map_topics" to "anon";

grant trigger on table "public"."curr_map_topics" to "anon";

grant truncate on table "public"."curr_map_topics" to "anon";

grant update on table "public"."curr_map_topics" to "anon";

grant delete on table "public"."curr_map_topics" to "authenticated";

grant insert on table "public"."curr_map_topics" to "authenticated";

grant references on table "public"."curr_map_topics" to "authenticated";

grant select on table "public"."curr_map_topics" to "authenticated";

grant trigger on table "public"."curr_map_topics" to "authenticated";

grant truncate on table "public"."curr_map_topics" to "authenticated";

grant update on table "public"."curr_map_topics" to "authenticated";

grant delete on table "public"."curr_map_topics" to "service_role";

grant insert on table "public"."curr_map_topics" to "service_role";

grant references on table "public"."curr_map_topics" to "service_role";

grant select on table "public"."curr_map_topics" to "service_role";

grant trigger on table "public"."curr_map_topics" to "service_role";

grant truncate on table "public"."curr_map_topics" to "service_role";

grant update on table "public"."curr_map_topics" to "service_role";

grant delete on table "public"."debriefs" to "anon";

grant insert on table "public"."debriefs" to "anon";

grant references on table "public"."debriefs" to "anon";

grant select on table "public"."debriefs" to "anon";

grant trigger on table "public"."debriefs" to "anon";

grant truncate on table "public"."debriefs" to "anon";

grant update on table "public"."debriefs" to "anon";

grant delete on table "public"."debriefs" to "authenticated";

grant insert on table "public"."debriefs" to "authenticated";

grant references on table "public"."debriefs" to "authenticated";

grant select on table "public"."debriefs" to "authenticated";

grant trigger on table "public"."debriefs" to "authenticated";

grant truncate on table "public"."debriefs" to "authenticated";

grant update on table "public"."debriefs" to "authenticated";

grant delete on table "public"."debriefs" to "service_role";

grant insert on table "public"."debriefs" to "service_role";

grant references on table "public"."debriefs" to "service_role";

grant select on table "public"."debriefs" to "service_role";

grant trigger on table "public"."debriefs" to "service_role";

grant truncate on table "public"."debriefs" to "service_role";

grant update on table "public"."debriefs" to "service_role";

grant delete on table "public"."development_items" to "anon";

grant insert on table "public"."development_items" to "anon";

grant references on table "public"."development_items" to "anon";

grant select on table "public"."development_items" to "anon";

grant trigger on table "public"."development_items" to "anon";

grant truncate on table "public"."development_items" to "anon";

grant update on table "public"."development_items" to "anon";

grant delete on table "public"."development_items" to "authenticated";

grant insert on table "public"."development_items" to "authenticated";

grant references on table "public"."development_items" to "authenticated";

grant select on table "public"."development_items" to "authenticated";

grant trigger on table "public"."development_items" to "authenticated";

grant truncate on table "public"."development_items" to "authenticated";

grant update on table "public"."development_items" to "authenticated";

grant delete on table "public"."development_items" to "service_role";

grant insert on table "public"."development_items" to "service_role";

grant references on table "public"."development_items" to "service_role";

grant select on table "public"."development_items" to "service_role";

grant trigger on table "public"."development_items" to "service_role";

grant truncate on table "public"."development_items" to "service_role";

grant update on table "public"."development_items" to "service_role";

grant delete on table "public"."duplicate_children_in_referrals" to "anon";

grant insert on table "public"."duplicate_children_in_referrals" to "anon";

grant references on table "public"."duplicate_children_in_referrals" to "anon";

grant select on table "public"."duplicate_children_in_referrals" to "anon";

grant trigger on table "public"."duplicate_children_in_referrals" to "anon";

grant truncate on table "public"."duplicate_children_in_referrals" to "anon";

grant update on table "public"."duplicate_children_in_referrals" to "anon";

grant delete on table "public"."duplicate_children_in_referrals" to "authenticated";

grant insert on table "public"."duplicate_children_in_referrals" to "authenticated";

grant references on table "public"."duplicate_children_in_referrals" to "authenticated";

grant select on table "public"."duplicate_children_in_referrals" to "authenticated";

grant trigger on table "public"."duplicate_children_in_referrals" to "authenticated";

grant truncate on table "public"."duplicate_children_in_referrals" to "authenticated";

grant update on table "public"."duplicate_children_in_referrals" to "authenticated";

grant delete on table "public"."duplicate_children_in_referrals" to "service_role";

grant insert on table "public"."duplicate_children_in_referrals" to "service_role";

grant references on table "public"."duplicate_children_in_referrals" to "service_role";

grant select on table "public"."duplicate_children_in_referrals" to "service_role";

grant trigger on table "public"."duplicate_children_in_referrals" to "service_role";

grant truncate on table "public"."duplicate_children_in_referrals" to "service_role";

grant update on table "public"."duplicate_children_in_referrals" to "service_role";

grant delete on table "public"."join_account_activity" to "anon";

grant insert on table "public"."join_account_activity" to "anon";

grant references on table "public"."join_account_activity" to "anon";

grant select on table "public"."join_account_activity" to "anon";

grant trigger on table "public"."join_account_activity" to "anon";

grant truncate on table "public"."join_account_activity" to "anon";

grant update on table "public"."join_account_activity" to "anon";

grant delete on table "public"."join_account_activity" to "authenticated";

grant insert on table "public"."join_account_activity" to "authenticated";

grant references on table "public"."join_account_activity" to "authenticated";

grant select on table "public"."join_account_activity" to "authenticated";

grant trigger on table "public"."join_account_activity" to "authenticated";

grant truncate on table "public"."join_account_activity" to "authenticated";

grant update on table "public"."join_account_activity" to "authenticated";

grant delete on table "public"."join_account_activity" to "service_role";

grant insert on table "public"."join_account_activity" to "service_role";

grant references on table "public"."join_account_activity" to "service_role";

grant select on table "public"."join_account_activity" to "service_role";

grant trigger on table "public"."join_account_activity" to "service_role";

grant truncate on table "public"."join_account_activity" to "service_role";

grant update on table "public"."join_account_activity" to "service_role";

grant delete on table "public"."join_account_services" to "anon";

grant insert on table "public"."join_account_services" to "anon";

grant references on table "public"."join_account_services" to "anon";

grant select on table "public"."join_account_services" to "anon";

grant trigger on table "public"."join_account_services" to "anon";

grant truncate on table "public"."join_account_services" to "anon";

grant update on table "public"."join_account_services" to "anon";

grant delete on table "public"."join_account_services" to "authenticated";

grant insert on table "public"."join_account_services" to "authenticated";

grant references on table "public"."join_account_services" to "authenticated";

grant select on table "public"."join_account_services" to "authenticated";

grant trigger on table "public"."join_account_services" to "authenticated";

grant truncate on table "public"."join_account_services" to "authenticated";

grant update on table "public"."join_account_services" to "authenticated";

grant delete on table "public"."join_account_services" to "service_role";

grant insert on table "public"."join_account_services" to "service_role";

grant references on table "public"."join_account_services" to "service_role";

grant select on table "public"."join_account_services" to "service_role";

grant trigger on table "public"."join_account_services" to "service_role";

grant truncate on table "public"."join_account_services" to "service_role";

grant update on table "public"."join_account_services" to "service_role";

grant delete on table "public"."join_application_accounts" to "anon";

grant insert on table "public"."join_application_accounts" to "anon";

grant references on table "public"."join_application_accounts" to "anon";

grant select on table "public"."join_application_accounts" to "anon";

grant trigger on table "public"."join_application_accounts" to "anon";

grant truncate on table "public"."join_application_accounts" to "anon";

grant update on table "public"."join_application_accounts" to "anon";

grant delete on table "public"."join_application_accounts" to "authenticated";

grant insert on table "public"."join_application_accounts" to "authenticated";

grant references on table "public"."join_application_accounts" to "authenticated";

grant select on table "public"."join_application_accounts" to "authenticated";

grant trigger on table "public"."join_application_accounts" to "authenticated";

grant truncate on table "public"."join_application_accounts" to "authenticated";

grant update on table "public"."join_application_accounts" to "authenticated";

grant delete on table "public"."join_application_accounts" to "service_role";

grant insert on table "public"."join_application_accounts" to "service_role";

grant references on table "public"."join_application_accounts" to "service_role";

grant select on table "public"."join_application_accounts" to "service_role";

grant trigger on table "public"."join_application_accounts" to "service_role";

grant truncate on table "public"."join_application_accounts" to "service_role";

grant update on table "public"."join_application_accounts" to "service_role";

grant delete on table "public"."join_child_contacts" to "anon";

grant insert on table "public"."join_child_contacts" to "anon";

grant references on table "public"."join_child_contacts" to "anon";

grant select on table "public"."join_child_contacts" to "anon";

grant trigger on table "public"."join_child_contacts" to "anon";

grant truncate on table "public"."join_child_contacts" to "anon";

grant update on table "public"."join_child_contacts" to "anon";

grant delete on table "public"."join_child_contacts" to "authenticated";

grant insert on table "public"."join_child_contacts" to "authenticated";

grant references on table "public"."join_child_contacts" to "authenticated";

grant select on table "public"."join_child_contacts" to "authenticated";

grant trigger on table "public"."join_child_contacts" to "authenticated";

grant truncate on table "public"."join_child_contacts" to "authenticated";

grant update on table "public"."join_child_contacts" to "authenticated";

grant delete on table "public"."join_child_contacts" to "service_role";

grant insert on table "public"."join_child_contacts" to "service_role";

grant references on table "public"."join_child_contacts" to "service_role";

grant select on table "public"."join_child_contacts" to "service_role";

grant trigger on table "public"."join_child_contacts" to "service_role";

grant truncate on table "public"."join_child_contacts" to "service_role";

grant update on table "public"."join_child_contacts" to "service_role";

grant delete on table "public"."join_debrief_action" to "anon";

grant insert on table "public"."join_debrief_action" to "anon";

grant references on table "public"."join_debrief_action" to "anon";

grant select on table "public"."join_debrief_action" to "anon";

grant trigger on table "public"."join_debrief_action" to "anon";

grant truncate on table "public"."join_debrief_action" to "anon";

grant update on table "public"."join_debrief_action" to "anon";

grant delete on table "public"."join_debrief_action" to "authenticated";

grant insert on table "public"."join_debrief_action" to "authenticated";

grant references on table "public"."join_debrief_action" to "authenticated";

grant select on table "public"."join_debrief_action" to "authenticated";

grant trigger on table "public"."join_debrief_action" to "authenticated";

grant truncate on table "public"."join_debrief_action" to "authenticated";

grant update on table "public"."join_debrief_action" to "authenticated";

grant delete on table "public"."join_debrief_action" to "service_role";

grant insert on table "public"."join_debrief_action" to "service_role";

grant references on table "public"."join_debrief_action" to "service_role";

grant select on table "public"."join_debrief_action" to "service_role";

grant trigger on table "public"."join_debrief_action" to "service_role";

grant truncate on table "public"."join_debrief_action" to "service_role";

grant update on table "public"."join_debrief_action" to "service_role";

grant delete on table "public"."join_plan_steps" to "anon";

grant insert on table "public"."join_plan_steps" to "anon";

grant references on table "public"."join_plan_steps" to "anon";

grant select on table "public"."join_plan_steps" to "anon";

grant trigger on table "public"."join_plan_steps" to "anon";

grant truncate on table "public"."join_plan_steps" to "anon";

grant update on table "public"."join_plan_steps" to "anon";

grant delete on table "public"."join_plan_steps" to "authenticated";

grant insert on table "public"."join_plan_steps" to "authenticated";

grant references on table "public"."join_plan_steps" to "authenticated";

grant select on table "public"."join_plan_steps" to "authenticated";

grant trigger on table "public"."join_plan_steps" to "authenticated";

grant truncate on table "public"."join_plan_steps" to "authenticated";

grant update on table "public"."join_plan_steps" to "authenticated";

grant delete on table "public"."join_plan_steps" to "service_role";

grant insert on table "public"."join_plan_steps" to "service_role";

grant references on table "public"."join_plan_steps" to "service_role";

grant select on table "public"."join_plan_steps" to "service_role";

grant trigger on table "public"."join_plan_steps" to "service_role";

grant truncate on table "public"."join_plan_steps" to "service_role";

grant update on table "public"."join_plan_steps" to "service_role";

grant delete on table "public"."join_plan_student_milestones" to "anon";

grant insert on table "public"."join_plan_student_milestones" to "anon";

grant references on table "public"."join_plan_student_milestones" to "anon";

grant select on table "public"."join_plan_student_milestones" to "anon";

grant trigger on table "public"."join_plan_student_milestones" to "anon";

grant truncate on table "public"."join_plan_student_milestones" to "anon";

grant update on table "public"."join_plan_student_milestones" to "anon";

grant delete on table "public"."join_plan_student_milestones" to "authenticated";

grant insert on table "public"."join_plan_student_milestones" to "authenticated";

grant references on table "public"."join_plan_student_milestones" to "authenticated";

grant select on table "public"."join_plan_student_milestones" to "authenticated";

grant trigger on table "public"."join_plan_student_milestones" to "authenticated";

grant truncate on table "public"."join_plan_student_milestones" to "authenticated";

grant update on table "public"."join_plan_student_milestones" to "authenticated";

grant delete on table "public"."join_plan_student_milestones" to "service_role";

grant insert on table "public"."join_plan_student_milestones" to "service_role";

grant references on table "public"."join_plan_student_milestones" to "service_role";

grant select on table "public"."join_plan_student_milestones" to "service_role";

grant trigger on table "public"."join_plan_student_milestones" to "service_role";

grant truncate on table "public"."join_plan_student_milestones" to "service_role";

grant update on table "public"."join_plan_student_milestones" to "service_role";

grant delete on table "public"."join_plan_students" to "anon";

grant insert on table "public"."join_plan_students" to "anon";

grant references on table "public"."join_plan_students" to "anon";

grant select on table "public"."join_plan_students" to "anon";

grant trigger on table "public"."join_plan_students" to "anon";

grant truncate on table "public"."join_plan_students" to "anon";

grant update on table "public"."join_plan_students" to "anon";

grant delete on table "public"."join_plan_students" to "authenticated";

grant insert on table "public"."join_plan_students" to "authenticated";

grant references on table "public"."join_plan_students" to "authenticated";

grant select on table "public"."join_plan_students" to "authenticated";

grant trigger on table "public"."join_plan_students" to "authenticated";

grant truncate on table "public"."join_plan_students" to "authenticated";

grant update on table "public"."join_plan_students" to "authenticated";

grant delete on table "public"."join_plan_students" to "service_role";

grant insert on table "public"."join_plan_students" to "service_role";

grant references on table "public"."join_plan_students" to "service_role";

grant select on table "public"."join_plan_students" to "service_role";

grant trigger on table "public"."join_plan_students" to "service_role";

grant truncate on table "public"."join_plan_students" to "service_role";

grant update on table "public"."join_plan_students" to "service_role";

grant delete on table "public"."join_project_accounts" to "anon";

grant insert on table "public"."join_project_accounts" to "anon";

grant references on table "public"."join_project_accounts" to "anon";

grant select on table "public"."join_project_accounts" to "anon";

grant trigger on table "public"."join_project_accounts" to "anon";

grant truncate on table "public"."join_project_accounts" to "anon";

grant update on table "public"."join_project_accounts" to "anon";

grant delete on table "public"."join_project_accounts" to "authenticated";

grant insert on table "public"."join_project_accounts" to "authenticated";

grant references on table "public"."join_project_accounts" to "authenticated";

grant select on table "public"."join_project_accounts" to "authenticated";

grant trigger on table "public"."join_project_accounts" to "authenticated";

grant truncate on table "public"."join_project_accounts" to "authenticated";

grant update on table "public"."join_project_accounts" to "authenticated";

grant delete on table "public"."join_project_accounts" to "service_role";

grant insert on table "public"."join_project_accounts" to "service_role";

grant references on table "public"."join_project_accounts" to "service_role";

grant select on table "public"."join_project_accounts" to "service_role";

grant trigger on table "public"."join_project_accounts" to "service_role";

grant truncate on table "public"."join_project_accounts" to "service_role";

grant update on table "public"."join_project_accounts" to "service_role";

grant delete on table "public"."join_project_aims" to "anon";

grant insert on table "public"."join_project_aims" to "anon";

grant references on table "public"."join_project_aims" to "anon";

grant select on table "public"."join_project_aims" to "anon";

grant trigger on table "public"."join_project_aims" to "anon";

grant truncate on table "public"."join_project_aims" to "anon";

grant update on table "public"."join_project_aims" to "anon";

grant delete on table "public"."join_project_aims" to "authenticated";

grant insert on table "public"."join_project_aims" to "authenticated";

grant references on table "public"."join_project_aims" to "authenticated";

grant select on table "public"."join_project_aims" to "authenticated";

grant trigger on table "public"."join_project_aims" to "authenticated";

grant truncate on table "public"."join_project_aims" to "authenticated";

grant update on table "public"."join_project_aims" to "authenticated";

grant delete on table "public"."join_project_aims" to "service_role";

grant insert on table "public"."join_project_aims" to "service_role";

grant references on table "public"."join_project_aims" to "service_role";

grant select on table "public"."join_project_aims" to "service_role";

grant trigger on table "public"."join_project_aims" to "service_role";

grant truncate on table "public"."join_project_aims" to "service_role";

grant update on table "public"."join_project_aims" to "service_role";

grant delete on table "public"."join_referral_status" to "anon";

grant insert on table "public"."join_referral_status" to "anon";

grant references on table "public"."join_referral_status" to "anon";

grant select on table "public"."join_referral_status" to "anon";

grant trigger on table "public"."join_referral_status" to "anon";

grant truncate on table "public"."join_referral_status" to "anon";

grant update on table "public"."join_referral_status" to "anon";

grant delete on table "public"."join_referral_status" to "authenticated";

grant insert on table "public"."join_referral_status" to "authenticated";

grant references on table "public"."join_referral_status" to "authenticated";

grant select on table "public"."join_referral_status" to "authenticated";

grant trigger on table "public"."join_referral_status" to "authenticated";

grant truncate on table "public"."join_referral_status" to "authenticated";

grant update on table "public"."join_referral_status" to "authenticated";

grant delete on table "public"."join_referral_status" to "service_role";

grant insert on table "public"."join_referral_status" to "service_role";

grant references on table "public"."join_referral_status" to "service_role";

grant select on table "public"."join_referral_status" to "service_role";

grant trigger on table "public"."join_referral_status" to "service_role";

grant truncate on table "public"."join_referral_status" to "service_role";

grant update on table "public"."join_referral_status" to "service_role";

grant delete on table "public"."join_service_terms" to "anon";

grant insert on table "public"."join_service_terms" to "anon";

grant references on table "public"."join_service_terms" to "anon";

grant select on table "public"."join_service_terms" to "anon";

grant trigger on table "public"."join_service_terms" to "anon";

grant truncate on table "public"."join_service_terms" to "anon";

grant update on table "public"."join_service_terms" to "anon";

grant delete on table "public"."join_service_terms" to "authenticated";

grant insert on table "public"."join_service_terms" to "authenticated";

grant references on table "public"."join_service_terms" to "authenticated";

grant select on table "public"."join_service_terms" to "authenticated";

grant trigger on table "public"."join_service_terms" to "authenticated";

grant truncate on table "public"."join_service_terms" to "authenticated";

grant update on table "public"."join_service_terms" to "authenticated";

grant delete on table "public"."join_service_terms" to "service_role";

grant insert on table "public"."join_service_terms" to "service_role";

grant references on table "public"."join_service_terms" to "service_role";

grant select on table "public"."join_service_terms" to "service_role";

grant trigger on table "public"."join_service_terms" to "service_role";

grant truncate on table "public"."join_service_terms" to "service_role";

grant update on table "public"."join_service_terms" to "service_role";

grant delete on table "public"."join_sow_ent_skup" to "anon";

grant insert on table "public"."join_sow_ent_skup" to "anon";

grant references on table "public"."join_sow_ent_skup" to "anon";

grant select on table "public"."join_sow_ent_skup" to "anon";

grant trigger on table "public"."join_sow_ent_skup" to "anon";

grant truncate on table "public"."join_sow_ent_skup" to "anon";

grant update on table "public"."join_sow_ent_skup" to "anon";

grant delete on table "public"."join_sow_ent_skup" to "authenticated";

grant insert on table "public"."join_sow_ent_skup" to "authenticated";

grant references on table "public"."join_sow_ent_skup" to "authenticated";

grant select on table "public"."join_sow_ent_skup" to "authenticated";

grant trigger on table "public"."join_sow_ent_skup" to "authenticated";

grant truncate on table "public"."join_sow_ent_skup" to "authenticated";

grant update on table "public"."join_sow_ent_skup" to "authenticated";

grant delete on table "public"."join_sow_ent_skup" to "service_role";

grant insert on table "public"."join_sow_ent_skup" to "service_role";

grant references on table "public"."join_sow_ent_skup" to "service_role";

grant select on table "public"."join_sow_ent_skup" to "service_role";

grant trigger on table "public"."join_sow_ent_skup" to "service_role";

grant truncate on table "public"."join_sow_ent_skup" to "service_role";

grant update on table "public"."join_sow_ent_skup" to "service_role";

grant delete on table "public"."join_student_activity" to "anon";

grant insert on table "public"."join_student_activity" to "anon";

grant references on table "public"."join_student_activity" to "anon";

grant select on table "public"."join_student_activity" to "anon";

grant trigger on table "public"."join_student_activity" to "anon";

grant truncate on table "public"."join_student_activity" to "anon";

grant update on table "public"."join_student_activity" to "anon";

grant delete on table "public"."join_student_activity" to "authenticated";

grant insert on table "public"."join_student_activity" to "authenticated";

grant references on table "public"."join_student_activity" to "authenticated";

grant select on table "public"."join_student_activity" to "authenticated";

grant trigger on table "public"."join_student_activity" to "authenticated";

grant truncate on table "public"."join_student_activity" to "authenticated";

grant update on table "public"."join_student_activity" to "authenticated";

grant delete on table "public"."join_student_activity" to "service_role";

grant insert on table "public"."join_student_activity" to "service_role";

grant references on table "public"."join_student_activity" to "service_role";

grant select on table "public"."join_student_activity" to "service_role";

grant trigger on table "public"."join_student_activity" to "service_role";

grant truncate on table "public"."join_student_activity" to "service_role";

grant update on table "public"."join_student_activity" to "service_role";

grant delete on table "public"."join_student_assessments" to "anon";

grant insert on table "public"."join_student_assessments" to "anon";

grant references on table "public"."join_student_assessments" to "anon";

grant select on table "public"."join_student_assessments" to "anon";

grant trigger on table "public"."join_student_assessments" to "anon";

grant truncate on table "public"."join_student_assessments" to "anon";

grant update on table "public"."join_student_assessments" to "anon";

grant delete on table "public"."join_student_assessments" to "authenticated";

grant insert on table "public"."join_student_assessments" to "authenticated";

grant references on table "public"."join_student_assessments" to "authenticated";

grant select on table "public"."join_student_assessments" to "authenticated";

grant trigger on table "public"."join_student_assessments" to "authenticated";

grant truncate on table "public"."join_student_assessments" to "authenticated";

grant update on table "public"."join_student_assessments" to "authenticated";

grant delete on table "public"."join_student_assessments" to "service_role";

grant insert on table "public"."join_student_assessments" to "service_role";

grant references on table "public"."join_student_assessments" to "service_role";

grant select on table "public"."join_student_assessments" to "service_role";

grant trigger on table "public"."join_student_assessments" to "service_role";

grant truncate on table "public"."join_student_assessments" to "service_role";

grant update on table "public"."join_student_assessments" to "service_role";

grant delete on table "public"."join_student_base_group" to "anon";

grant insert on table "public"."join_student_base_group" to "anon";

grant references on table "public"."join_student_base_group" to "anon";

grant select on table "public"."join_student_base_group" to "anon";

grant trigger on table "public"."join_student_base_group" to "anon";

grant truncate on table "public"."join_student_base_group" to "anon";

grant update on table "public"."join_student_base_group" to "anon";

grant delete on table "public"."join_student_base_group" to "authenticated";

grant insert on table "public"."join_student_base_group" to "authenticated";

grant references on table "public"."join_student_base_group" to "authenticated";

grant select on table "public"."join_student_base_group" to "authenticated";

grant trigger on table "public"."join_student_base_group" to "authenticated";

grant truncate on table "public"."join_student_base_group" to "authenticated";

grant update on table "public"."join_student_base_group" to "authenticated";

grant delete on table "public"."join_student_base_group" to "service_role";

grant insert on table "public"."join_student_base_group" to "service_role";

grant references on table "public"."join_student_base_group" to "service_role";

grant select on table "public"."join_student_base_group" to "service_role";

grant trigger on table "public"."join_student_base_group" to "service_role";

grant truncate on table "public"."join_student_base_group" to "service_role";

grant update on table "public"."join_student_base_group" to "service_role";

grant delete on table "public"."join_student_contacts" to "anon";

grant insert on table "public"."join_student_contacts" to "anon";

grant references on table "public"."join_student_contacts" to "anon";

grant select on table "public"."join_student_contacts" to "anon";

grant trigger on table "public"."join_student_contacts" to "anon";

grant truncate on table "public"."join_student_contacts" to "anon";

grant update on table "public"."join_student_contacts" to "anon";

grant delete on table "public"."join_student_contacts" to "authenticated";

grant insert on table "public"."join_student_contacts" to "authenticated";

grant references on table "public"."join_student_contacts" to "authenticated";

grant select on table "public"."join_student_contacts" to "authenticated";

grant trigger on table "public"."join_student_contacts" to "authenticated";

grant truncate on table "public"."join_student_contacts" to "authenticated";

grant update on table "public"."join_student_contacts" to "authenticated";

grant delete on table "public"."join_student_contacts" to "service_role";

grant insert on table "public"."join_student_contacts" to "service_role";

grant references on table "public"."join_student_contacts" to "service_role";

grant select on table "public"."join_student_contacts" to "service_role";

grant trigger on table "public"."join_student_contacts" to "service_role";

grant truncate on table "public"."join_student_contacts" to "service_role";

grant update on table "public"."join_student_contacts" to "service_role";

grant delete on table "public"."join_target_ilps" to "anon";

grant insert on table "public"."join_target_ilps" to "anon";

grant references on table "public"."join_target_ilps" to "anon";

grant select on table "public"."join_target_ilps" to "anon";

grant trigger on table "public"."join_target_ilps" to "anon";

grant truncate on table "public"."join_target_ilps" to "anon";

grant update on table "public"."join_target_ilps" to "anon";

grant delete on table "public"."join_target_ilps" to "authenticated";

grant insert on table "public"."join_target_ilps" to "authenticated";

grant references on table "public"."join_target_ilps" to "authenticated";

grant select on table "public"."join_target_ilps" to "authenticated";

grant trigger on table "public"."join_target_ilps" to "authenticated";

grant truncate on table "public"."join_target_ilps" to "authenticated";

grant update on table "public"."join_target_ilps" to "authenticated";

grant delete on table "public"."join_target_ilps" to "service_role";

grant insert on table "public"."join_target_ilps" to "service_role";

grant references on table "public"."join_target_ilps" to "service_role";

grant select on table "public"."join_target_ilps" to "service_role";

grant trigger on table "public"."join_target_ilps" to "service_role";

grant truncate on table "public"."join_target_ilps" to "service_role";

grant update on table "public"."join_target_ilps" to "service_role";

grant delete on table "public"."join_tasklist_aims" to "anon";

grant insert on table "public"."join_tasklist_aims" to "anon";

grant references on table "public"."join_tasklist_aims" to "anon";

grant select on table "public"."join_tasklist_aims" to "anon";

grant trigger on table "public"."join_tasklist_aims" to "anon";

grant truncate on table "public"."join_tasklist_aims" to "anon";

grant update on table "public"."join_tasklist_aims" to "anon";

grant delete on table "public"."join_tasklist_aims" to "authenticated";

grant insert on table "public"."join_tasklist_aims" to "authenticated";

grant references on table "public"."join_tasklist_aims" to "authenticated";

grant select on table "public"."join_tasklist_aims" to "authenticated";

grant trigger on table "public"."join_tasklist_aims" to "authenticated";

grant truncate on table "public"."join_tasklist_aims" to "authenticated";

grant update on table "public"."join_tasklist_aims" to "authenticated";

grant delete on table "public"."join_tasklist_aims" to "service_role";

grant insert on table "public"."join_tasklist_aims" to "service_role";

grant references on table "public"."join_tasklist_aims" to "service_role";

grant select on table "public"."join_tasklist_aims" to "service_role";

grant trigger on table "public"."join_tasklist_aims" to "service_role";

grant truncate on table "public"."join_tasklist_aims" to "service_role";

grant update on table "public"."join_tasklist_aims" to "service_role";

grant delete on table "public"."join_tickets" to "anon";

grant insert on table "public"."join_tickets" to "anon";

grant references on table "public"."join_tickets" to "anon";

grant select on table "public"."join_tickets" to "anon";

grant trigger on table "public"."join_tickets" to "anon";

grant truncate on table "public"."join_tickets" to "anon";

grant update on table "public"."join_tickets" to "anon";

grant delete on table "public"."join_tickets" to "authenticated";

grant insert on table "public"."join_tickets" to "authenticated";

grant references on table "public"."join_tickets" to "authenticated";

grant select on table "public"."join_tickets" to "authenticated";

grant trigger on table "public"."join_tickets" to "authenticated";

grant truncate on table "public"."join_tickets" to "authenticated";

grant update on table "public"."join_tickets" to "authenticated";

grant delete on table "public"."join_tickets" to "service_role";

grant insert on table "public"."join_tickets" to "service_role";

grant references on table "public"."join_tickets" to "service_role";

grant select on table "public"."join_tickets" to "service_role";

grant trigger on table "public"."join_tickets" to "service_role";

grant truncate on table "public"."join_tickets" to "service_role";

grant update on table "public"."join_tickets" to "service_role";

grant delete on table "public"."join_tickets_users" to "anon";

grant insert on table "public"."join_tickets_users" to "anon";

grant references on table "public"."join_tickets_users" to "anon";

grant select on table "public"."join_tickets_users" to "anon";

grant trigger on table "public"."join_tickets_users" to "anon";

grant truncate on table "public"."join_tickets_users" to "anon";

grant update on table "public"."join_tickets_users" to "anon";

grant delete on table "public"."join_tickets_users" to "authenticated";

grant insert on table "public"."join_tickets_users" to "authenticated";

grant references on table "public"."join_tickets_users" to "authenticated";

grant select on table "public"."join_tickets_users" to "authenticated";

grant trigger on table "public"."join_tickets_users" to "authenticated";

grant truncate on table "public"."join_tickets_users" to "authenticated";

grant update on table "public"."join_tickets_users" to "authenticated";

grant delete on table "public"."join_tickets_users" to "service_role";

grant insert on table "public"."join_tickets_users" to "service_role";

grant references on table "public"."join_tickets_users" to "service_role";

grant select on table "public"."join_tickets_users" to "service_role";

grant trigger on table "public"."join_tickets_users" to "service_role";

grant truncate on table "public"."join_tickets_users" to "service_role";

grant update on table "public"."join_tickets_users" to "service_role";

grant delete on table "public"."links" to "anon";

grant insert on table "public"."links" to "anon";

grant references on table "public"."links" to "anon";

grant select on table "public"."links" to "anon";

grant trigger on table "public"."links" to "anon";

grant truncate on table "public"."links" to "anon";

grant update on table "public"."links" to "anon";

grant delete on table "public"."links" to "authenticated";

grant insert on table "public"."links" to "authenticated";

grant references on table "public"."links" to "authenticated";

grant select on table "public"."links" to "authenticated";

grant trigger on table "public"."links" to "authenticated";

grant truncate on table "public"."links" to "authenticated";

grant update on table "public"."links" to "authenticated";

grant delete on table "public"."links" to "service_role";

grant insert on table "public"."links" to "service_role";

grant references on table "public"."links" to "service_role";

grant select on table "public"."links" to "service_role";

grant trigger on table "public"."links" to "service_role";

grant truncate on table "public"."links" to "service_role";

grant update on table "public"."links" to "service_role";

grant delete on table "public"."lu_admissions_reports" to "anon";

grant insert on table "public"."lu_admissions_reports" to "anon";

grant references on table "public"."lu_admissions_reports" to "anon";

grant select on table "public"."lu_admissions_reports" to "anon";

grant trigger on table "public"."lu_admissions_reports" to "anon";

grant truncate on table "public"."lu_admissions_reports" to "anon";

grant update on table "public"."lu_admissions_reports" to "anon";

grant delete on table "public"."lu_admissions_reports" to "authenticated";

grant insert on table "public"."lu_admissions_reports" to "authenticated";

grant references on table "public"."lu_admissions_reports" to "authenticated";

grant select on table "public"."lu_admissions_reports" to "authenticated";

grant trigger on table "public"."lu_admissions_reports" to "authenticated";

grant truncate on table "public"."lu_admissions_reports" to "authenticated";

grant update on table "public"."lu_admissions_reports" to "authenticated";

grant delete on table "public"."lu_admissions_reports" to "service_role";

grant insert on table "public"."lu_admissions_reports" to "service_role";

grant references on table "public"."lu_admissions_reports" to "service_role";

grant select on table "public"."lu_admissions_reports" to "service_role";

grant trigger on table "public"."lu_admissions_reports" to "service_role";

grant truncate on table "public"."lu_admissions_reports" to "service_role";

grant update on table "public"."lu_admissions_reports" to "service_role";

grant delete on table "public"."lu_attendance_codes" to "anon";

grant insert on table "public"."lu_attendance_codes" to "anon";

grant references on table "public"."lu_attendance_codes" to "anon";

grant select on table "public"."lu_attendance_codes" to "anon";

grant trigger on table "public"."lu_attendance_codes" to "anon";

grant truncate on table "public"."lu_attendance_codes" to "anon";

grant update on table "public"."lu_attendance_codes" to "anon";

grant delete on table "public"."lu_attendance_codes" to "authenticated";

grant insert on table "public"."lu_attendance_codes" to "authenticated";

grant references on table "public"."lu_attendance_codes" to "authenticated";

grant select on table "public"."lu_attendance_codes" to "authenticated";

grant trigger on table "public"."lu_attendance_codes" to "authenticated";

grant truncate on table "public"."lu_attendance_codes" to "authenticated";

grant update on table "public"."lu_attendance_codes" to "authenticated";

grant delete on table "public"."lu_attendance_codes" to "service_role";

grant insert on table "public"."lu_attendance_codes" to "service_role";

grant references on table "public"."lu_attendance_codes" to "service_role";

grant select on table "public"."lu_attendance_codes" to "service_role";

grant trigger on table "public"."lu_attendance_codes" to "service_role";

grant truncate on table "public"."lu_attendance_codes" to "service_role";

grant update on table "public"."lu_attendance_codes" to "service_role";

grant delete on table "public"."lu_criteria_type" to "anon";

grant insert on table "public"."lu_criteria_type" to "anon";

grant references on table "public"."lu_criteria_type" to "anon";

grant select on table "public"."lu_criteria_type" to "anon";

grant trigger on table "public"."lu_criteria_type" to "anon";

grant truncate on table "public"."lu_criteria_type" to "anon";

grant update on table "public"."lu_criteria_type" to "anon";

grant delete on table "public"."lu_criteria_type" to "authenticated";

grant insert on table "public"."lu_criteria_type" to "authenticated";

grant references on table "public"."lu_criteria_type" to "authenticated";

grant select on table "public"."lu_criteria_type" to "authenticated";

grant trigger on table "public"."lu_criteria_type" to "authenticated";

grant truncate on table "public"."lu_criteria_type" to "authenticated";

grant update on table "public"."lu_criteria_type" to "authenticated";

grant delete on table "public"."lu_criteria_type" to "service_role";

grant insert on table "public"."lu_criteria_type" to "service_role";

grant references on table "public"."lu_criteria_type" to "service_role";

grant select on table "public"."lu_criteria_type" to "service_role";

grant trigger on table "public"."lu_criteria_type" to "service_role";

grant truncate on table "public"."lu_criteria_type" to "service_role";

grant update on table "public"."lu_criteria_type" to "service_role";

grant delete on table "public"."lu_criteria_values" to "anon";

grant insert on table "public"."lu_criteria_values" to "anon";

grant references on table "public"."lu_criteria_values" to "anon";

grant select on table "public"."lu_criteria_values" to "anon";

grant trigger on table "public"."lu_criteria_values" to "anon";

grant truncate on table "public"."lu_criteria_values" to "anon";

grant update on table "public"."lu_criteria_values" to "anon";

grant delete on table "public"."lu_criteria_values" to "authenticated";

grant insert on table "public"."lu_criteria_values" to "authenticated";

grant references on table "public"."lu_criteria_values" to "authenticated";

grant select on table "public"."lu_criteria_values" to "authenticated";

grant trigger on table "public"."lu_criteria_values" to "authenticated";

grant truncate on table "public"."lu_criteria_values" to "authenticated";

grant update on table "public"."lu_criteria_values" to "authenticated";

grant delete on table "public"."lu_criteria_values" to "service_role";

grant insert on table "public"."lu_criteria_values" to "service_role";

grant references on table "public"."lu_criteria_values" to "service_role";

grant select on table "public"."lu_criteria_values" to "service_role";

grant trigger on table "public"."lu_criteria_values" to "service_role";

grant truncate on table "public"."lu_criteria_values" to "service_role";

grant update on table "public"."lu_criteria_values" to "service_role";

grant delete on table "public"."lu_destinations" to "anon";

grant insert on table "public"."lu_destinations" to "anon";

grant references on table "public"."lu_destinations" to "anon";

grant select on table "public"."lu_destinations" to "anon";

grant trigger on table "public"."lu_destinations" to "anon";

grant truncate on table "public"."lu_destinations" to "anon";

grant update on table "public"."lu_destinations" to "anon";

grant delete on table "public"."lu_destinations" to "authenticated";

grant insert on table "public"."lu_destinations" to "authenticated";

grant references on table "public"."lu_destinations" to "authenticated";

grant select on table "public"."lu_destinations" to "authenticated";

grant trigger on table "public"."lu_destinations" to "authenticated";

grant truncate on table "public"."lu_destinations" to "authenticated";

grant update on table "public"."lu_destinations" to "authenticated";

grant delete on table "public"."lu_destinations" to "service_role";

grant insert on table "public"."lu_destinations" to "service_role";

grant references on table "public"."lu_destinations" to "service_role";

grant select on table "public"."lu_destinations" to "service_role";

grant trigger on table "public"."lu_destinations" to "service_role";

grant truncate on table "public"."lu_destinations" to "service_role";

grant update on table "public"."lu_destinations" to "service_role";

grant delete on table "public"."lu_ehcp_categories" to "anon";

grant insert on table "public"."lu_ehcp_categories" to "anon";

grant references on table "public"."lu_ehcp_categories" to "anon";

grant select on table "public"."lu_ehcp_categories" to "anon";

grant trigger on table "public"."lu_ehcp_categories" to "anon";

grant truncate on table "public"."lu_ehcp_categories" to "anon";

grant update on table "public"."lu_ehcp_categories" to "anon";

grant delete on table "public"."lu_ehcp_categories" to "authenticated";

grant insert on table "public"."lu_ehcp_categories" to "authenticated";

grant references on table "public"."lu_ehcp_categories" to "authenticated";

grant select on table "public"."lu_ehcp_categories" to "authenticated";

grant trigger on table "public"."lu_ehcp_categories" to "authenticated";

grant truncate on table "public"."lu_ehcp_categories" to "authenticated";

grant update on table "public"."lu_ehcp_categories" to "authenticated";

grant delete on table "public"."lu_ehcp_categories" to "service_role";

grant insert on table "public"."lu_ehcp_categories" to "service_role";

grant references on table "public"."lu_ehcp_categories" to "service_role";

grant select on table "public"."lu_ehcp_categories" to "service_role";

grant trigger on table "public"."lu_ehcp_categories" to "service_role";

grant truncate on table "public"."lu_ehcp_categories" to "service_role";

grant update on table "public"."lu_ehcp_categories" to "service_role";

grant delete on table "public"."lu_literacy_texts" to "anon";

grant insert on table "public"."lu_literacy_texts" to "anon";

grant references on table "public"."lu_literacy_texts" to "anon";

grant select on table "public"."lu_literacy_texts" to "anon";

grant trigger on table "public"."lu_literacy_texts" to "anon";

grant truncate on table "public"."lu_literacy_texts" to "anon";

grant update on table "public"."lu_literacy_texts" to "anon";

grant delete on table "public"."lu_literacy_texts" to "authenticated";

grant insert on table "public"."lu_literacy_texts" to "authenticated";

grant references on table "public"."lu_literacy_texts" to "authenticated";

grant select on table "public"."lu_literacy_texts" to "authenticated";

grant trigger on table "public"."lu_literacy_texts" to "authenticated";

grant truncate on table "public"."lu_literacy_texts" to "authenticated";

grant update on table "public"."lu_literacy_texts" to "authenticated";

grant delete on table "public"."lu_literacy_texts" to "service_role";

grant insert on table "public"."lu_literacy_texts" to "service_role";

grant references on table "public"."lu_literacy_texts" to "service_role";

grant select on table "public"."lu_literacy_texts" to "service_role";

grant trigger on table "public"."lu_literacy_texts" to "service_role";

grant truncate on table "public"."lu_literacy_texts" to "service_role";

grant update on table "public"."lu_literacy_texts" to "service_role";

grant delete on table "public"."lu_phases" to "anon";

grant insert on table "public"."lu_phases" to "anon";

grant references on table "public"."lu_phases" to "anon";

grant select on table "public"."lu_phases" to "anon";

grant trigger on table "public"."lu_phases" to "anon";

grant truncate on table "public"."lu_phases" to "anon";

grant update on table "public"."lu_phases" to "anon";

grant delete on table "public"."lu_phases" to "authenticated";

grant insert on table "public"."lu_phases" to "authenticated";

grant references on table "public"."lu_phases" to "authenticated";

grant select on table "public"."lu_phases" to "authenticated";

grant trigger on table "public"."lu_phases" to "authenticated";

grant truncate on table "public"."lu_phases" to "authenticated";

grant update on table "public"."lu_phases" to "authenticated";

grant delete on table "public"."lu_phases" to "service_role";

grant insert on table "public"."lu_phases" to "service_role";

grant references on table "public"."lu_phases" to "service_role";

grant select on table "public"."lu_phases" to "service_role";

grant trigger on table "public"."lu_phases" to "service_role";

grant truncate on table "public"."lu_phases" to "service_role";

grant update on table "public"."lu_phases" to "service_role";

grant delete on table "public"."lu_pillar_cache" to "anon";

grant insert on table "public"."lu_pillar_cache" to "anon";

grant references on table "public"."lu_pillar_cache" to "anon";

grant select on table "public"."lu_pillar_cache" to "anon";

grant trigger on table "public"."lu_pillar_cache" to "anon";

grant truncate on table "public"."lu_pillar_cache" to "anon";

grant update on table "public"."lu_pillar_cache" to "anon";

grant delete on table "public"."lu_pillar_cache" to "authenticated";

grant insert on table "public"."lu_pillar_cache" to "authenticated";

grant references on table "public"."lu_pillar_cache" to "authenticated";

grant select on table "public"."lu_pillar_cache" to "authenticated";

grant trigger on table "public"."lu_pillar_cache" to "authenticated";

grant truncate on table "public"."lu_pillar_cache" to "authenticated";

grant update on table "public"."lu_pillar_cache" to "authenticated";

grant delete on table "public"."lu_pillar_cache" to "service_role";

grant insert on table "public"."lu_pillar_cache" to "service_role";

grant references on table "public"."lu_pillar_cache" to "service_role";

grant select on table "public"."lu_pillar_cache" to "service_role";

grant trigger on table "public"."lu_pillar_cache" to "service_role";

grant truncate on table "public"."lu_pillar_cache" to "service_role";

grant update on table "public"."lu_pillar_cache" to "service_role";

grant delete on table "public"."lu_pillar_subject_cache" to "anon";

grant insert on table "public"."lu_pillar_subject_cache" to "anon";

grant references on table "public"."lu_pillar_subject_cache" to "anon";

grant select on table "public"."lu_pillar_subject_cache" to "anon";

grant trigger on table "public"."lu_pillar_subject_cache" to "anon";

grant truncate on table "public"."lu_pillar_subject_cache" to "anon";

grant update on table "public"."lu_pillar_subject_cache" to "anon";

grant delete on table "public"."lu_pillar_subject_cache" to "authenticated";

grant insert on table "public"."lu_pillar_subject_cache" to "authenticated";

grant references on table "public"."lu_pillar_subject_cache" to "authenticated";

grant select on table "public"."lu_pillar_subject_cache" to "authenticated";

grant trigger on table "public"."lu_pillar_subject_cache" to "authenticated";

grant truncate on table "public"."lu_pillar_subject_cache" to "authenticated";

grant update on table "public"."lu_pillar_subject_cache" to "authenticated";

grant delete on table "public"."lu_pillar_subject_cache" to "service_role";

grant insert on table "public"."lu_pillar_subject_cache" to "service_role";

grant references on table "public"."lu_pillar_subject_cache" to "service_role";

grant select on table "public"."lu_pillar_subject_cache" to "service_role";

grant trigger on table "public"."lu_pillar_subject_cache" to "service_role";

grant truncate on table "public"."lu_pillar_subject_cache" to "service_role";

grant update on table "public"."lu_pillar_subject_cache" to "service_role";

grant delete on table "public"."lu_pillar_target_cache" to "anon";

grant insert on table "public"."lu_pillar_target_cache" to "anon";

grant references on table "public"."lu_pillar_target_cache" to "anon";

grant select on table "public"."lu_pillar_target_cache" to "anon";

grant trigger on table "public"."lu_pillar_target_cache" to "anon";

grant truncate on table "public"."lu_pillar_target_cache" to "anon";

grant update on table "public"."lu_pillar_target_cache" to "anon";

grant delete on table "public"."lu_pillar_target_cache" to "authenticated";

grant insert on table "public"."lu_pillar_target_cache" to "authenticated";

grant references on table "public"."lu_pillar_target_cache" to "authenticated";

grant select on table "public"."lu_pillar_target_cache" to "authenticated";

grant trigger on table "public"."lu_pillar_target_cache" to "authenticated";

grant truncate on table "public"."lu_pillar_target_cache" to "authenticated";

grant update on table "public"."lu_pillar_target_cache" to "authenticated";

grant delete on table "public"."lu_pillar_target_cache" to "service_role";

grant insert on table "public"."lu_pillar_target_cache" to "service_role";

grant references on table "public"."lu_pillar_target_cache" to "service_role";

grant select on table "public"."lu_pillar_target_cache" to "service_role";

grant trigger on table "public"."lu_pillar_target_cache" to "service_role";

grant truncate on table "public"."lu_pillar_target_cache" to "service_role";

grant update on table "public"."lu_pillar_target_cache" to "service_role";

grant delete on table "public"."lu_pillar_topic_cache" to "anon";

grant insert on table "public"."lu_pillar_topic_cache" to "anon";

grant references on table "public"."lu_pillar_topic_cache" to "anon";

grant select on table "public"."lu_pillar_topic_cache" to "anon";

grant trigger on table "public"."lu_pillar_topic_cache" to "anon";

grant truncate on table "public"."lu_pillar_topic_cache" to "anon";

grant update on table "public"."lu_pillar_topic_cache" to "anon";

grant delete on table "public"."lu_pillar_topic_cache" to "authenticated";

grant insert on table "public"."lu_pillar_topic_cache" to "authenticated";

grant references on table "public"."lu_pillar_topic_cache" to "authenticated";

grant select on table "public"."lu_pillar_topic_cache" to "authenticated";

grant trigger on table "public"."lu_pillar_topic_cache" to "authenticated";

grant truncate on table "public"."lu_pillar_topic_cache" to "authenticated";

grant update on table "public"."lu_pillar_topic_cache" to "authenticated";

grant delete on table "public"."lu_pillar_topic_cache" to "service_role";

grant insert on table "public"."lu_pillar_topic_cache" to "service_role";

grant references on table "public"."lu_pillar_topic_cache" to "service_role";

grant select on table "public"."lu_pillar_topic_cache" to "service_role";

grant trigger on table "public"."lu_pillar_topic_cache" to "service_role";

grant truncate on table "public"."lu_pillar_topic_cache" to "service_role";

grant update on table "public"."lu_pillar_topic_cache" to "service_role";

grant delete on table "public"."lu_record_categories" to "anon";

grant insert on table "public"."lu_record_categories" to "anon";

grant references on table "public"."lu_record_categories" to "anon";

grant select on table "public"."lu_record_categories" to "anon";

grant trigger on table "public"."lu_record_categories" to "anon";

grant truncate on table "public"."lu_record_categories" to "anon";

grant update on table "public"."lu_record_categories" to "anon";

grant delete on table "public"."lu_record_categories" to "authenticated";

grant insert on table "public"."lu_record_categories" to "authenticated";

grant references on table "public"."lu_record_categories" to "authenticated";

grant select on table "public"."lu_record_categories" to "authenticated";

grant trigger on table "public"."lu_record_categories" to "authenticated";

grant truncate on table "public"."lu_record_categories" to "authenticated";

grant update on table "public"."lu_record_categories" to "authenticated";

grant delete on table "public"."lu_record_categories" to "service_role";

grant insert on table "public"."lu_record_categories" to "service_role";

grant references on table "public"."lu_record_categories" to "service_role";

grant select on table "public"."lu_record_categories" to "service_role";

grant trigger on table "public"."lu_record_categories" to "service_role";

grant truncate on table "public"."lu_record_categories" to "service_role";

grant update on table "public"."lu_record_categories" to "service_role";

grant delete on table "public"."lu_record_subcategories" to "anon";

grant insert on table "public"."lu_record_subcategories" to "anon";

grant references on table "public"."lu_record_subcategories" to "anon";

grant select on table "public"."lu_record_subcategories" to "anon";

grant trigger on table "public"."lu_record_subcategories" to "anon";

grant truncate on table "public"."lu_record_subcategories" to "anon";

grant update on table "public"."lu_record_subcategories" to "anon";

grant delete on table "public"."lu_record_subcategories" to "authenticated";

grant insert on table "public"."lu_record_subcategories" to "authenticated";

grant references on table "public"."lu_record_subcategories" to "authenticated";

grant select on table "public"."lu_record_subcategories" to "authenticated";

grant trigger on table "public"."lu_record_subcategories" to "authenticated";

grant truncate on table "public"."lu_record_subcategories" to "authenticated";

grant update on table "public"."lu_record_subcategories" to "authenticated";

grant delete on table "public"."lu_record_subcategories" to "service_role";

grant insert on table "public"."lu_record_subcategories" to "service_role";

grant references on table "public"."lu_record_subcategories" to "service_role";

grant select on table "public"."lu_record_subcategories" to "service_role";

grant trigger on table "public"."lu_record_subcategories" to "service_role";

grant truncate on table "public"."lu_record_subcategories" to "service_role";

grant update on table "public"."lu_record_subcategories" to "service_role";

grant delete on table "public"."lu_ref_stage" to "anon";

grant insert on table "public"."lu_ref_stage" to "anon";

grant references on table "public"."lu_ref_stage" to "anon";

grant select on table "public"."lu_ref_stage" to "anon";

grant trigger on table "public"."lu_ref_stage" to "anon";

grant truncate on table "public"."lu_ref_stage" to "anon";

grant update on table "public"."lu_ref_stage" to "anon";

grant delete on table "public"."lu_ref_stage" to "authenticated";

grant insert on table "public"."lu_ref_stage" to "authenticated";

grant references on table "public"."lu_ref_stage" to "authenticated";

grant select on table "public"."lu_ref_stage" to "authenticated";

grant trigger on table "public"."lu_ref_stage" to "authenticated";

grant truncate on table "public"."lu_ref_stage" to "authenticated";

grant update on table "public"."lu_ref_stage" to "authenticated";

grant delete on table "public"."lu_ref_stage" to "service_role";

grant insert on table "public"."lu_ref_stage" to "service_role";

grant references on table "public"."lu_ref_stage" to "service_role";

grant select on table "public"."lu_ref_stage" to "service_role";

grant trigger on table "public"."lu_ref_stage" to "service_role";

grant truncate on table "public"."lu_ref_stage" to "service_role";

grant update on table "public"."lu_ref_stage" to "service_role";

grant delete on table "public"."lu_ref_status" to "anon";

grant insert on table "public"."lu_ref_status" to "anon";

grant references on table "public"."lu_ref_status" to "anon";

grant select on table "public"."lu_ref_status" to "anon";

grant trigger on table "public"."lu_ref_status" to "anon";

grant truncate on table "public"."lu_ref_status" to "anon";

grant update on table "public"."lu_ref_status" to "anon";

grant delete on table "public"."lu_ref_status" to "authenticated";

grant insert on table "public"."lu_ref_status" to "authenticated";

grant references on table "public"."lu_ref_status" to "authenticated";

grant select on table "public"."lu_ref_status" to "authenticated";

grant trigger on table "public"."lu_ref_status" to "authenticated";

grant truncate on table "public"."lu_ref_status" to "authenticated";

grant update on table "public"."lu_ref_status" to "authenticated";

grant delete on table "public"."lu_ref_status" to "service_role";

grant insert on table "public"."lu_ref_status" to "service_role";

grant references on table "public"."lu_ref_status" to "service_role";

grant select on table "public"."lu_ref_status" to "service_role";

grant trigger on table "public"."lu_ref_status" to "service_role";

grant truncate on table "public"."lu_ref_status" to "service_role";

grant update on table "public"."lu_ref_status" to "service_role";

grant delete on table "public"."lu_risk_categories" to "anon";

grant insert on table "public"."lu_risk_categories" to "anon";

grant references on table "public"."lu_risk_categories" to "anon";

grant select on table "public"."lu_risk_categories" to "anon";

grant trigger on table "public"."lu_risk_categories" to "anon";

grant truncate on table "public"."lu_risk_categories" to "anon";

grant update on table "public"."lu_risk_categories" to "anon";

grant delete on table "public"."lu_risk_categories" to "authenticated";

grant insert on table "public"."lu_risk_categories" to "authenticated";

grant references on table "public"."lu_risk_categories" to "authenticated";

grant select on table "public"."lu_risk_categories" to "authenticated";

grant trigger on table "public"."lu_risk_categories" to "authenticated";

grant truncate on table "public"."lu_risk_categories" to "authenticated";

grant update on table "public"."lu_risk_categories" to "authenticated";

grant delete on table "public"."lu_risk_categories" to "service_role";

grant insert on table "public"."lu_risk_categories" to "service_role";

grant references on table "public"."lu_risk_categories" to "service_role";

grant select on table "public"."lu_risk_categories" to "service_role";

grant trigger on table "public"."lu_risk_categories" to "service_role";

grant truncate on table "public"."lu_risk_categories" to "service_role";

grant update on table "public"."lu_risk_categories" to "service_role";

grant delete on table "public"."lu_risk_subcategories" to "anon";

grant insert on table "public"."lu_risk_subcategories" to "anon";

grant references on table "public"."lu_risk_subcategories" to "anon";

grant select on table "public"."lu_risk_subcategories" to "anon";

grant trigger on table "public"."lu_risk_subcategories" to "anon";

grant truncate on table "public"."lu_risk_subcategories" to "anon";

grant update on table "public"."lu_risk_subcategories" to "anon";

grant delete on table "public"."lu_risk_subcategories" to "authenticated";

grant insert on table "public"."lu_risk_subcategories" to "authenticated";

grant references on table "public"."lu_risk_subcategories" to "authenticated";

grant select on table "public"."lu_risk_subcategories" to "authenticated";

grant trigger on table "public"."lu_risk_subcategories" to "authenticated";

grant truncate on table "public"."lu_risk_subcategories" to "authenticated";

grant update on table "public"."lu_risk_subcategories" to "authenticated";

grant delete on table "public"."lu_risk_subcategories" to "service_role";

grant insert on table "public"."lu_risk_subcategories" to "service_role";

grant references on table "public"."lu_risk_subcategories" to "service_role";

grant select on table "public"."lu_risk_subcategories" to "service_role";

grant trigger on table "public"."lu_risk_subcategories" to "service_role";

grant truncate on table "public"."lu_risk_subcategories" to "service_role";

grant update on table "public"."lu_risk_subcategories" to "service_role";

grant delete on table "public"."lu_sow_steps" to "anon";

grant insert on table "public"."lu_sow_steps" to "anon";

grant references on table "public"."lu_sow_steps" to "anon";

grant select on table "public"."lu_sow_steps" to "anon";

grant trigger on table "public"."lu_sow_steps" to "anon";

grant truncate on table "public"."lu_sow_steps" to "anon";

grant update on table "public"."lu_sow_steps" to "anon";

grant delete on table "public"."lu_sow_steps" to "authenticated";

grant insert on table "public"."lu_sow_steps" to "authenticated";

grant references on table "public"."lu_sow_steps" to "authenticated";

grant select on table "public"."lu_sow_steps" to "authenticated";

grant trigger on table "public"."lu_sow_steps" to "authenticated";

grant truncate on table "public"."lu_sow_steps" to "authenticated";

grant update on table "public"."lu_sow_steps" to "authenticated";

grant delete on table "public"."lu_sow_steps" to "service_role";

grant insert on table "public"."lu_sow_steps" to "service_role";

grant references on table "public"."lu_sow_steps" to "service_role";

grant select on table "public"."lu_sow_steps" to "service_role";

grant trigger on table "public"."lu_sow_steps" to "service_role";

grant truncate on table "public"."lu_sow_steps" to "service_role";

grant update on table "public"."lu_sow_steps" to "service_role";

grant delete on table "public"."lu_themes" to "anon";

grant insert on table "public"."lu_themes" to "anon";

grant references on table "public"."lu_themes" to "anon";

grant select on table "public"."lu_themes" to "anon";

grant trigger on table "public"."lu_themes" to "anon";

grant truncate on table "public"."lu_themes" to "anon";

grant update on table "public"."lu_themes" to "anon";

grant delete on table "public"."lu_themes" to "authenticated";

grant insert on table "public"."lu_themes" to "authenticated";

grant references on table "public"."lu_themes" to "authenticated";

grant select on table "public"."lu_themes" to "authenticated";

grant trigger on table "public"."lu_themes" to "authenticated";

grant truncate on table "public"."lu_themes" to "authenticated";

grant update on table "public"."lu_themes" to "authenticated";

grant delete on table "public"."lu_themes" to "service_role";

grant insert on table "public"."lu_themes" to "service_role";

grant references on table "public"."lu_themes" to "service_role";

grant select on table "public"."lu_themes" to "service_role";

grant trigger on table "public"."lu_themes" to "service_role";

grant truncate on table "public"."lu_themes" to "service_role";

grant update on table "public"."lu_themes" to "service_role";

grant delete on table "public"."lu_ticket_categories" to "anon";

grant insert on table "public"."lu_ticket_categories" to "anon";

grant references on table "public"."lu_ticket_categories" to "anon";

grant select on table "public"."lu_ticket_categories" to "anon";

grant trigger on table "public"."lu_ticket_categories" to "anon";

grant truncate on table "public"."lu_ticket_categories" to "anon";

grant update on table "public"."lu_ticket_categories" to "anon";

grant delete on table "public"."lu_ticket_categories" to "authenticated";

grant insert on table "public"."lu_ticket_categories" to "authenticated";

grant references on table "public"."lu_ticket_categories" to "authenticated";

grant select on table "public"."lu_ticket_categories" to "authenticated";

grant trigger on table "public"."lu_ticket_categories" to "authenticated";

grant truncate on table "public"."lu_ticket_categories" to "authenticated";

grant update on table "public"."lu_ticket_categories" to "authenticated";

grant delete on table "public"."lu_ticket_categories" to "service_role";

grant insert on table "public"."lu_ticket_categories" to "service_role";

grant references on table "public"."lu_ticket_categories" to "service_role";

grant select on table "public"."lu_ticket_categories" to "service_role";

grant trigger on table "public"."lu_ticket_categories" to "service_role";

grant truncate on table "public"."lu_ticket_categories" to "service_role";

grant update on table "public"."lu_ticket_categories" to "service_role";

grant delete on table "public"."lu_ticket_group" to "anon";

grant insert on table "public"."lu_ticket_group" to "anon";

grant references on table "public"."lu_ticket_group" to "anon";

grant select on table "public"."lu_ticket_group" to "anon";

grant trigger on table "public"."lu_ticket_group" to "anon";

grant truncate on table "public"."lu_ticket_group" to "anon";

grant update on table "public"."lu_ticket_group" to "anon";

grant delete on table "public"."lu_ticket_group" to "authenticated";

grant insert on table "public"."lu_ticket_group" to "authenticated";

grant references on table "public"."lu_ticket_group" to "authenticated";

grant select on table "public"."lu_ticket_group" to "authenticated";

grant trigger on table "public"."lu_ticket_group" to "authenticated";

grant truncate on table "public"."lu_ticket_group" to "authenticated";

grant update on table "public"."lu_ticket_group" to "authenticated";

grant delete on table "public"."lu_ticket_group" to "service_role";

grant insert on table "public"."lu_ticket_group" to "service_role";

grant references on table "public"."lu_ticket_group" to "service_role";

grant select on table "public"."lu_ticket_group" to "service_role";

grant trigger on table "public"."lu_ticket_group" to "service_role";

grant truncate on table "public"."lu_ticket_group" to "service_role";

grant update on table "public"."lu_ticket_group" to "service_role";

grant delete on table "public"."lu_ticket_queue" to "anon";

grant insert on table "public"."lu_ticket_queue" to "anon";

grant references on table "public"."lu_ticket_queue" to "anon";

grant select on table "public"."lu_ticket_queue" to "anon";

grant trigger on table "public"."lu_ticket_queue" to "anon";

grant truncate on table "public"."lu_ticket_queue" to "anon";

grant update on table "public"."lu_ticket_queue" to "anon";

grant delete on table "public"."lu_ticket_queue" to "authenticated";

grant insert on table "public"."lu_ticket_queue" to "authenticated";

grant references on table "public"."lu_ticket_queue" to "authenticated";

grant select on table "public"."lu_ticket_queue" to "authenticated";

grant trigger on table "public"."lu_ticket_queue" to "authenticated";

grant truncate on table "public"."lu_ticket_queue" to "authenticated";

grant update on table "public"."lu_ticket_queue" to "authenticated";

grant delete on table "public"."lu_ticket_queue" to "service_role";

grant insert on table "public"."lu_ticket_queue" to "service_role";

grant references on table "public"."lu_ticket_queue" to "service_role";

grant select on table "public"."lu_ticket_queue" to "service_role";

grant trigger on table "public"."lu_ticket_queue" to "service_role";

grant truncate on table "public"."lu_ticket_queue" to "service_role";

grant update on table "public"."lu_ticket_queue" to "service_role";

grant delete on table "public"."lu_ticket_reasons" to "anon";

grant insert on table "public"."lu_ticket_reasons" to "anon";

grant references on table "public"."lu_ticket_reasons" to "anon";

grant select on table "public"."lu_ticket_reasons" to "anon";

grant trigger on table "public"."lu_ticket_reasons" to "anon";

grant truncate on table "public"."lu_ticket_reasons" to "anon";

grant update on table "public"."lu_ticket_reasons" to "anon";

grant delete on table "public"."lu_ticket_reasons" to "authenticated";

grant insert on table "public"."lu_ticket_reasons" to "authenticated";

grant references on table "public"."lu_ticket_reasons" to "authenticated";

grant select on table "public"."lu_ticket_reasons" to "authenticated";

grant trigger on table "public"."lu_ticket_reasons" to "authenticated";

grant truncate on table "public"."lu_ticket_reasons" to "authenticated";

grant update on table "public"."lu_ticket_reasons" to "authenticated";

grant delete on table "public"."lu_ticket_reasons" to "service_role";

grant insert on table "public"."lu_ticket_reasons" to "service_role";

grant references on table "public"."lu_ticket_reasons" to "service_role";

grant select on table "public"."lu_ticket_reasons" to "service_role";

grant trigger on table "public"."lu_ticket_reasons" to "service_role";

grant truncate on table "public"."lu_ticket_reasons" to "service_role";

grant update on table "public"."lu_ticket_reasons" to "service_role";

grant delete on table "public"."lu_ticket_status" to "anon";

grant insert on table "public"."lu_ticket_status" to "anon";

grant references on table "public"."lu_ticket_status" to "anon";

grant select on table "public"."lu_ticket_status" to "anon";

grant trigger on table "public"."lu_ticket_status" to "anon";

grant truncate on table "public"."lu_ticket_status" to "anon";

grant update on table "public"."lu_ticket_status" to "anon";

grant delete on table "public"."lu_ticket_status" to "authenticated";

grant insert on table "public"."lu_ticket_status" to "authenticated";

grant references on table "public"."lu_ticket_status" to "authenticated";

grant select on table "public"."lu_ticket_status" to "authenticated";

grant trigger on table "public"."lu_ticket_status" to "authenticated";

grant truncate on table "public"."lu_ticket_status" to "authenticated";

grant update on table "public"."lu_ticket_status" to "authenticated";

grant delete on table "public"."lu_ticket_status" to "service_role";

grant insert on table "public"."lu_ticket_status" to "service_role";

grant references on table "public"."lu_ticket_status" to "service_role";

grant select on table "public"."lu_ticket_status" to "service_role";

grant trigger on table "public"."lu_ticket_status" to "service_role";

grant truncate on table "public"."lu_ticket_status" to "service_role";

grant update on table "public"."lu_ticket_status" to "service_role";

grant delete on table "public"."lu_ticket_sub_reasons" to "anon";

grant insert on table "public"."lu_ticket_sub_reasons" to "anon";

grant references on table "public"."lu_ticket_sub_reasons" to "anon";

grant select on table "public"."lu_ticket_sub_reasons" to "anon";

grant trigger on table "public"."lu_ticket_sub_reasons" to "anon";

grant truncate on table "public"."lu_ticket_sub_reasons" to "anon";

grant update on table "public"."lu_ticket_sub_reasons" to "anon";

grant delete on table "public"."lu_ticket_sub_reasons" to "authenticated";

grant insert on table "public"."lu_ticket_sub_reasons" to "authenticated";

grant references on table "public"."lu_ticket_sub_reasons" to "authenticated";

grant select on table "public"."lu_ticket_sub_reasons" to "authenticated";

grant trigger on table "public"."lu_ticket_sub_reasons" to "authenticated";

grant truncate on table "public"."lu_ticket_sub_reasons" to "authenticated";

grant update on table "public"."lu_ticket_sub_reasons" to "authenticated";

grant delete on table "public"."lu_ticket_sub_reasons" to "service_role";

grant insert on table "public"."lu_ticket_sub_reasons" to "service_role";

grant references on table "public"."lu_ticket_sub_reasons" to "service_role";

grant select on table "public"."lu_ticket_sub_reasons" to "service_role";

grant trigger on table "public"."lu_ticket_sub_reasons" to "service_role";

grant truncate on table "public"."lu_ticket_sub_reasons" to "service_role";

grant update on table "public"."lu_ticket_sub_reasons" to "service_role";

grant delete on table "public"."lu_ticket_subcategories" to "anon";

grant insert on table "public"."lu_ticket_subcategories" to "anon";

grant references on table "public"."lu_ticket_subcategories" to "anon";

grant select on table "public"."lu_ticket_subcategories" to "anon";

grant trigger on table "public"."lu_ticket_subcategories" to "anon";

grant truncate on table "public"."lu_ticket_subcategories" to "anon";

grant update on table "public"."lu_ticket_subcategories" to "anon";

grant delete on table "public"."lu_ticket_subcategories" to "authenticated";

grant insert on table "public"."lu_ticket_subcategories" to "authenticated";

grant references on table "public"."lu_ticket_subcategories" to "authenticated";

grant select on table "public"."lu_ticket_subcategories" to "authenticated";

grant trigger on table "public"."lu_ticket_subcategories" to "authenticated";

grant truncate on table "public"."lu_ticket_subcategories" to "authenticated";

grant update on table "public"."lu_ticket_subcategories" to "authenticated";

grant delete on table "public"."lu_ticket_subcategories" to "service_role";

grant insert on table "public"."lu_ticket_subcategories" to "service_role";

grant references on table "public"."lu_ticket_subcategories" to "service_role";

grant select on table "public"."lu_ticket_subcategories" to "service_role";

grant trigger on table "public"."lu_ticket_subcategories" to "service_role";

grant truncate on table "public"."lu_ticket_subcategories" to "service_role";

grant update on table "public"."lu_ticket_subcategories" to "service_role";

grant delete on table "public"."lu_ticket_types" to "anon";

grant insert on table "public"."lu_ticket_types" to "anon";

grant references on table "public"."lu_ticket_types" to "anon";

grant select on table "public"."lu_ticket_types" to "anon";

grant trigger on table "public"."lu_ticket_types" to "anon";

grant truncate on table "public"."lu_ticket_types" to "anon";

grant update on table "public"."lu_ticket_types" to "anon";

grant delete on table "public"."lu_ticket_types" to "authenticated";

grant insert on table "public"."lu_ticket_types" to "authenticated";

grant references on table "public"."lu_ticket_types" to "authenticated";

grant select on table "public"."lu_ticket_types" to "authenticated";

grant trigger on table "public"."lu_ticket_types" to "authenticated";

grant truncate on table "public"."lu_ticket_types" to "authenticated";

grant update on table "public"."lu_ticket_types" to "authenticated";

grant delete on table "public"."lu_ticket_types" to "service_role";

grant insert on table "public"."lu_ticket_types" to "service_role";

grant references on table "public"."lu_ticket_types" to "service_role";

grant select on table "public"."lu_ticket_types" to "service_role";

grant trigger on table "public"."lu_ticket_types" to "service_role";

grant truncate on table "public"."lu_ticket_types" to "service_role";

grant update on table "public"."lu_ticket_types" to "service_role";

grant delete on table "public"."meetings" to "anon";

grant insert on table "public"."meetings" to "anon";

grant references on table "public"."meetings" to "anon";

grant select on table "public"."meetings" to "anon";

grant trigger on table "public"."meetings" to "anon";

grant truncate on table "public"."meetings" to "anon";

grant update on table "public"."meetings" to "anon";

grant delete on table "public"."meetings" to "authenticated";

grant insert on table "public"."meetings" to "authenticated";

grant references on table "public"."meetings" to "authenticated";

grant select on table "public"."meetings" to "authenticated";

grant trigger on table "public"."meetings" to "authenticated";

grant truncate on table "public"."meetings" to "authenticated";

grant update on table "public"."meetings" to "authenticated";

grant delete on table "public"."meetings" to "service_role";

grant insert on table "public"."meetings" to "service_role";

grant references on table "public"."meetings" to "service_role";

grant select on table "public"."meetings" to "service_role";

grant trigger on table "public"."meetings" to "service_role";

grant truncate on table "public"."meetings" to "service_role";

grant update on table "public"."meetings" to "service_role";

grant delete on table "public"."notification_distribution" to "anon";

grant insert on table "public"."notification_distribution" to "anon";

grant references on table "public"."notification_distribution" to "anon";

grant select on table "public"."notification_distribution" to "anon";

grant trigger on table "public"."notification_distribution" to "anon";

grant truncate on table "public"."notification_distribution" to "anon";

grant update on table "public"."notification_distribution" to "anon";

grant delete on table "public"."notification_distribution" to "authenticated";

grant insert on table "public"."notification_distribution" to "authenticated";

grant references on table "public"."notification_distribution" to "authenticated";

grant select on table "public"."notification_distribution" to "authenticated";

grant trigger on table "public"."notification_distribution" to "authenticated";

grant truncate on table "public"."notification_distribution" to "authenticated";

grant update on table "public"."notification_distribution" to "authenticated";

grant delete on table "public"."notification_distribution" to "service_role";

grant insert on table "public"."notification_distribution" to "service_role";

grant references on table "public"."notification_distribution" to "service_role";

grant select on table "public"."notification_distribution" to "service_role";

grant trigger on table "public"."notification_distribution" to "service_role";

grant truncate on table "public"."notification_distribution" to "service_role";

grant update on table "public"."notification_distribution" to "service_role";

grant delete on table "public"."notification_header" to "anon";

grant insert on table "public"."notification_header" to "anon";

grant references on table "public"."notification_header" to "anon";

grant select on table "public"."notification_header" to "anon";

grant trigger on table "public"."notification_header" to "anon";

grant truncate on table "public"."notification_header" to "anon";

grant update on table "public"."notification_header" to "anon";

grant delete on table "public"."notification_header" to "authenticated";

grant insert on table "public"."notification_header" to "authenticated";

grant references on table "public"."notification_header" to "authenticated";

grant select on table "public"."notification_header" to "authenticated";

grant trigger on table "public"."notification_header" to "authenticated";

grant truncate on table "public"."notification_header" to "authenticated";

grant update on table "public"."notification_header" to "authenticated";

grant delete on table "public"."notification_header" to "service_role";

grant insert on table "public"."notification_header" to "service_role";

grant references on table "public"."notification_header" to "service_role";

grant select on table "public"."notification_header" to "service_role";

grant trigger on table "public"."notification_header" to "service_role";

grant truncate on table "public"."notification_header" to "service_role";

grant update on table "public"."notification_header" to "service_role";

grant delete on table "public"."organisations" to "anon";

grant insert on table "public"."organisations" to "anon";

grant references on table "public"."organisations" to "anon";

grant select on table "public"."organisations" to "anon";

grant trigger on table "public"."organisations" to "anon";

grant truncate on table "public"."organisations" to "anon";

grant update on table "public"."organisations" to "anon";

grant delete on table "public"."organisations" to "authenticated";

grant insert on table "public"."organisations" to "authenticated";

grant references on table "public"."organisations" to "authenticated";

grant select on table "public"."organisations" to "authenticated";

grant trigger on table "public"."organisations" to "authenticated";

grant truncate on table "public"."organisations" to "authenticated";

grant update on table "public"."organisations" to "authenticated";

grant delete on table "public"."organisations" to "service_role";

grant insert on table "public"."organisations" to "service_role";

grant references on table "public"."organisations" to "service_role";

grant select on table "public"."organisations" to "service_role";

grant trigger on table "public"."organisations" to "service_role";

grant truncate on table "public"."organisations" to "service_role";

grant update on table "public"."organisations" to "service_role";

grant delete on table "public"."progress_notes" to "anon";

grant insert on table "public"."progress_notes" to "anon";

grant references on table "public"."progress_notes" to "anon";

grant select on table "public"."progress_notes" to "anon";

grant trigger on table "public"."progress_notes" to "anon";

grant truncate on table "public"."progress_notes" to "anon";

grant update on table "public"."progress_notes" to "anon";

grant delete on table "public"."progress_notes" to "authenticated";

grant insert on table "public"."progress_notes" to "authenticated";

grant references on table "public"."progress_notes" to "authenticated";

grant select on table "public"."progress_notes" to "authenticated";

grant trigger on table "public"."progress_notes" to "authenticated";

grant truncate on table "public"."progress_notes" to "authenticated";

grant update on table "public"."progress_notes" to "authenticated";

grant delete on table "public"."progress_notes" to "service_role";

grant insert on table "public"."progress_notes" to "service_role";

grant references on table "public"."progress_notes" to "service_role";

grant select on table "public"."progress_notes" to "service_role";

grant trigger on table "public"."progress_notes" to "service_role";

grant truncate on table "public"."progress_notes" to "service_role";

grant update on table "public"."progress_notes" to "service_role";

grant delete on table "public"."projects" to "anon";

grant insert on table "public"."projects" to "anon";

grant references on table "public"."projects" to "anon";

grant select on table "public"."projects" to "anon";

grant trigger on table "public"."projects" to "anon";

grant truncate on table "public"."projects" to "anon";

grant update on table "public"."projects" to "anon";

grant delete on table "public"."projects" to "authenticated";

grant insert on table "public"."projects" to "authenticated";

grant references on table "public"."projects" to "authenticated";

grant select on table "public"."projects" to "authenticated";

grant trigger on table "public"."projects" to "authenticated";

grant truncate on table "public"."projects" to "authenticated";

grant update on table "public"."projects" to "authenticated";

grant delete on table "public"."projects" to "service_role";

grant insert on table "public"."projects" to "service_role";

grant references on table "public"."projects" to "service_role";

grant select on table "public"."projects" to "service_role";

grant trigger on table "public"."projects" to "service_role";

grant truncate on table "public"."projects" to "service_role";

grant update on table "public"."projects" to "service_role";

grant delete on table "public"."referral_details" to "anon";

grant insert on table "public"."referral_details" to "anon";

grant references on table "public"."referral_details" to "anon";

grant select on table "public"."referral_details" to "anon";

grant trigger on table "public"."referral_details" to "anon";

grant truncate on table "public"."referral_details" to "anon";

grant update on table "public"."referral_details" to "anon";

grant delete on table "public"."referral_details" to "authenticated";

grant insert on table "public"."referral_details" to "authenticated";

grant references on table "public"."referral_details" to "authenticated";

grant select on table "public"."referral_details" to "authenticated";

grant trigger on table "public"."referral_details" to "authenticated";

grant truncate on table "public"."referral_details" to "authenticated";

grant update on table "public"."referral_details" to "authenticated";

grant delete on table "public"."referral_details" to "service_role";

grant insert on table "public"."referral_details" to "service_role";

grant references on table "public"."referral_details" to "service_role";

grant select on table "public"."referral_details" to "service_role";

grant trigger on table "public"."referral_details" to "service_role";

grant truncate on table "public"."referral_details" to "service_role";

grant update on table "public"."referral_details" to "service_role";

grant delete on table "public"."referral_export" to "anon";

grant insert on table "public"."referral_export" to "anon";

grant references on table "public"."referral_export" to "anon";

grant select on table "public"."referral_export" to "anon";

grant trigger on table "public"."referral_export" to "anon";

grant truncate on table "public"."referral_export" to "anon";

grant update on table "public"."referral_export" to "anon";

grant delete on table "public"."referral_export" to "authenticated";

grant insert on table "public"."referral_export" to "authenticated";

grant references on table "public"."referral_export" to "authenticated";

grant select on table "public"."referral_export" to "authenticated";

grant trigger on table "public"."referral_export" to "authenticated";

grant truncate on table "public"."referral_export" to "authenticated";

grant update on table "public"."referral_export" to "authenticated";

grant delete on table "public"."referral_export" to "service_role";

grant insert on table "public"."referral_export" to "service_role";

grant references on table "public"."referral_export" to "service_role";

grant select on table "public"."referral_export" to "service_role";

grant trigger on table "public"."referral_export" to "service_role";

grant truncate on table "public"."referral_export" to "service_role";

grant update on table "public"."referral_export" to "service_role";

grant delete on table "public"."referral_header" to "anon";

grant insert on table "public"."referral_header" to "anon";

grant references on table "public"."referral_header" to "anon";

grant select on table "public"."referral_header" to "anon";

grant trigger on table "public"."referral_header" to "anon";

grant truncate on table "public"."referral_header" to "anon";

grant update on table "public"."referral_header" to "anon";

grant delete on table "public"."referral_header" to "authenticated";

grant insert on table "public"."referral_header" to "authenticated";

grant references on table "public"."referral_header" to "authenticated";

grant select on table "public"."referral_header" to "authenticated";

grant trigger on table "public"."referral_header" to "authenticated";

grant truncate on table "public"."referral_header" to "authenticated";

grant update on table "public"."referral_header" to "authenticated";

grant delete on table "public"."referral_header" to "service_role";

grant insert on table "public"."referral_header" to "service_role";

grant references on table "public"."referral_header" to "service_role";

grant select on table "public"."referral_header" to "service_role";

grant trigger on table "public"."referral_header" to "service_role";

grant truncate on table "public"."referral_header" to "service_role";

grant update on table "public"."referral_header" to "service_role";

grant delete on table "public"."referral_status_history" to "anon";

grant insert on table "public"."referral_status_history" to "anon";

grant references on table "public"."referral_status_history" to "anon";

grant select on table "public"."referral_status_history" to "anon";

grant trigger on table "public"."referral_status_history" to "anon";

grant truncate on table "public"."referral_status_history" to "anon";

grant update on table "public"."referral_status_history" to "anon";

grant delete on table "public"."referral_status_history" to "authenticated";

grant insert on table "public"."referral_status_history" to "authenticated";

grant references on table "public"."referral_status_history" to "authenticated";

grant select on table "public"."referral_status_history" to "authenticated";

grant trigger on table "public"."referral_status_history" to "authenticated";

grant truncate on table "public"."referral_status_history" to "authenticated";

grant update on table "public"."referral_status_history" to "authenticated";

grant delete on table "public"."referral_status_history" to "service_role";

grant insert on table "public"."referral_status_history" to "service_role";

grant references on table "public"."referral_status_history" to "service_role";

grant select on table "public"."referral_status_history" to "service_role";

grant trigger on table "public"."referral_status_history" to "service_role";

grant truncate on table "public"."referral_status_history" to "service_role";

grant update on table "public"."referral_status_history" to "service_role";

grant delete on table "public"."referrals" to "anon";

grant insert on table "public"."referrals" to "anon";

grant references on table "public"."referrals" to "anon";

grant select on table "public"."referrals" to "anon";

grant trigger on table "public"."referrals" to "anon";

grant truncate on table "public"."referrals" to "anon";

grant update on table "public"."referrals" to "anon";

grant delete on table "public"."referrals" to "authenticated";

grant insert on table "public"."referrals" to "authenticated";

grant references on table "public"."referrals" to "authenticated";

grant select on table "public"."referrals" to "authenticated";

grant trigger on table "public"."referrals" to "authenticated";

grant truncate on table "public"."referrals" to "authenticated";

grant update on table "public"."referrals" to "authenticated";

grant delete on table "public"."referrals" to "service_role";

grant insert on table "public"."referrals" to "service_role";

grant references on table "public"."referrals" to "service_role";

grant select on table "public"."referrals" to "service_role";

grant trigger on table "public"."referrals" to "service_role";

grant truncate on table "public"."referrals" to "service_role";

grant update on table "public"."referrals" to "service_role";

grant delete on table "public"."referrals_stage1" to "anon";

grant insert on table "public"."referrals_stage1" to "anon";

grant references on table "public"."referrals_stage1" to "anon";

grant select on table "public"."referrals_stage1" to "anon";

grant trigger on table "public"."referrals_stage1" to "anon";

grant truncate on table "public"."referrals_stage1" to "anon";

grant update on table "public"."referrals_stage1" to "anon";

grant delete on table "public"."referrals_stage1" to "authenticated";

grant insert on table "public"."referrals_stage1" to "authenticated";

grant references on table "public"."referrals_stage1" to "authenticated";

grant select on table "public"."referrals_stage1" to "authenticated";

grant trigger on table "public"."referrals_stage1" to "authenticated";

grant truncate on table "public"."referrals_stage1" to "authenticated";

grant update on table "public"."referrals_stage1" to "authenticated";

grant delete on table "public"."referrals_stage1" to "service_role";

grant insert on table "public"."referrals_stage1" to "service_role";

grant references on table "public"."referrals_stage1" to "service_role";

grant select on table "public"."referrals_stage1" to "service_role";

grant trigger on table "public"."referrals_stage1" to "service_role";

grant truncate on table "public"."referrals_stage1" to "service_role";

grant update on table "public"."referrals_stage1" to "service_role";

grant delete on table "public"."referrals_stage2" to "anon";

grant insert on table "public"."referrals_stage2" to "anon";

grant references on table "public"."referrals_stage2" to "anon";

grant select on table "public"."referrals_stage2" to "anon";

grant trigger on table "public"."referrals_stage2" to "anon";

grant truncate on table "public"."referrals_stage2" to "anon";

grant update on table "public"."referrals_stage2" to "anon";

grant delete on table "public"."referrals_stage2" to "authenticated";

grant insert on table "public"."referrals_stage2" to "authenticated";

grant references on table "public"."referrals_stage2" to "authenticated";

grant select on table "public"."referrals_stage2" to "authenticated";

grant trigger on table "public"."referrals_stage2" to "authenticated";

grant truncate on table "public"."referrals_stage2" to "authenticated";

grant update on table "public"."referrals_stage2" to "authenticated";

grant delete on table "public"."referrals_stage2" to "service_role";

grant insert on table "public"."referrals_stage2" to "service_role";

grant references on table "public"."referrals_stage2" to "service_role";

grant select on table "public"."referrals_stage2" to "service_role";

grant trigger on table "public"."referrals_stage2" to "service_role";

grant truncate on table "public"."referrals_stage2" to "service_role";

grant update on table "public"."referrals_stage2" to "service_role";

grant delete on table "public"."referrals_stage3" to "anon";

grant insert on table "public"."referrals_stage3" to "anon";

grant references on table "public"."referrals_stage3" to "anon";

grant select on table "public"."referrals_stage3" to "anon";

grant trigger on table "public"."referrals_stage3" to "anon";

grant truncate on table "public"."referrals_stage3" to "anon";

grant update on table "public"."referrals_stage3" to "anon";

grant delete on table "public"."referrals_stage3" to "authenticated";

grant insert on table "public"."referrals_stage3" to "authenticated";

grant references on table "public"."referrals_stage3" to "authenticated";

grant select on table "public"."referrals_stage3" to "authenticated";

grant trigger on table "public"."referrals_stage3" to "authenticated";

grant truncate on table "public"."referrals_stage3" to "authenticated";

grant update on table "public"."referrals_stage3" to "authenticated";

grant delete on table "public"."referrals_stage3" to "service_role";

grant insert on table "public"."referrals_stage3" to "service_role";

grant references on table "public"."referrals_stage3" to "service_role";

grant select on table "public"."referrals_stage3" to "service_role";

grant trigger on table "public"."referrals_stage3" to "service_role";

grant truncate on table "public"."referrals_stage3" to "service_role";

grant update on table "public"."referrals_stage3" to "service_role";

grant delete on table "public"."referrals_stage4" to "anon";

grant insert on table "public"."referrals_stage4" to "anon";

grant references on table "public"."referrals_stage4" to "anon";

grant select on table "public"."referrals_stage4" to "anon";

grant trigger on table "public"."referrals_stage4" to "anon";

grant truncate on table "public"."referrals_stage4" to "anon";

grant update on table "public"."referrals_stage4" to "anon";

grant delete on table "public"."referrals_stage4" to "authenticated";

grant insert on table "public"."referrals_stage4" to "authenticated";

grant references on table "public"."referrals_stage4" to "authenticated";

grant select on table "public"."referrals_stage4" to "authenticated";

grant trigger on table "public"."referrals_stage4" to "authenticated";

grant truncate on table "public"."referrals_stage4" to "authenticated";

grant update on table "public"."referrals_stage4" to "authenticated";

grant delete on table "public"."referrals_stage4" to "service_role";

grant insert on table "public"."referrals_stage4" to "service_role";

grant references on table "public"."referrals_stage4" to "service_role";

grant select on table "public"."referrals_stage4" to "service_role";

grant trigger on table "public"."referrals_stage4" to "service_role";

grant truncate on table "public"."referrals_stage4" to "service_role";

grant update on table "public"."referrals_stage4" to "service_role";

grant delete on table "public"."referrals_stage5" to "anon";

grant insert on table "public"."referrals_stage5" to "anon";

grant references on table "public"."referrals_stage5" to "anon";

grant select on table "public"."referrals_stage5" to "anon";

grant trigger on table "public"."referrals_stage5" to "anon";

grant truncate on table "public"."referrals_stage5" to "anon";

grant update on table "public"."referrals_stage5" to "anon";

grant delete on table "public"."referrals_stage5" to "authenticated";

grant insert on table "public"."referrals_stage5" to "authenticated";

grant references on table "public"."referrals_stage5" to "authenticated";

grant select on table "public"."referrals_stage5" to "authenticated";

grant trigger on table "public"."referrals_stage5" to "authenticated";

grant truncate on table "public"."referrals_stage5" to "authenticated";

grant update on table "public"."referrals_stage5" to "authenticated";

grant delete on table "public"."referrals_stage5" to "service_role";

grant insert on table "public"."referrals_stage5" to "service_role";

grant references on table "public"."referrals_stage5" to "service_role";

grant select on table "public"."referrals_stage5" to "service_role";

grant trigger on table "public"."referrals_stage5" to "service_role";

grant truncate on table "public"."referrals_stage5" to "service_role";

grant update on table "public"."referrals_stage5" to "service_role";

grant delete on table "public"."referrals_stage6" to "anon";

grant insert on table "public"."referrals_stage6" to "anon";

grant references on table "public"."referrals_stage6" to "anon";

grant select on table "public"."referrals_stage6" to "anon";

grant trigger on table "public"."referrals_stage6" to "anon";

grant truncate on table "public"."referrals_stage6" to "anon";

grant update on table "public"."referrals_stage6" to "anon";

grant delete on table "public"."referrals_stage6" to "authenticated";

grant insert on table "public"."referrals_stage6" to "authenticated";

grant references on table "public"."referrals_stage6" to "authenticated";

grant select on table "public"."referrals_stage6" to "authenticated";

grant trigger on table "public"."referrals_stage6" to "authenticated";

grant truncate on table "public"."referrals_stage6" to "authenticated";

grant update on table "public"."referrals_stage6" to "authenticated";

grant delete on table "public"."referrals_stage6" to "service_role";

grant insert on table "public"."referrals_stage6" to "service_role";

grant references on table "public"."referrals_stage6" to "service_role";

grant select on table "public"."referrals_stage6" to "service_role";

grant trigger on table "public"."referrals_stage6" to "service_role";

grant truncate on table "public"."referrals_stage6" to "service_role";

grant update on table "public"."referrals_stage6" to "service_role";

grant delete on table "public"."report_details" to "anon";

grant insert on table "public"."report_details" to "anon";

grant references on table "public"."report_details" to "anon";

grant select on table "public"."report_details" to "anon";

grant trigger on table "public"."report_details" to "anon";

grant truncate on table "public"."report_details" to "anon";

grant update on table "public"."report_details" to "anon";

grant delete on table "public"."report_details" to "authenticated";

grant insert on table "public"."report_details" to "authenticated";

grant references on table "public"."report_details" to "authenticated";

grant select on table "public"."report_details" to "authenticated";

grant trigger on table "public"."report_details" to "authenticated";

grant truncate on table "public"."report_details" to "authenticated";

grant update on table "public"."report_details" to "authenticated";

grant delete on table "public"."report_details" to "service_role";

grant insert on table "public"."report_details" to "service_role";

grant references on table "public"."report_details" to "service_role";

grant select on table "public"."report_details" to "service_role";

grant trigger on table "public"."report_details" to "service_role";

grant truncate on table "public"."report_details" to "service_role";

grant update on table "public"."report_details" to "service_role";

grant delete on table "public"."report_header" to "anon";

grant insert on table "public"."report_header" to "anon";

grant references on table "public"."report_header" to "anon";

grant select on table "public"."report_header" to "anon";

grant trigger on table "public"."report_header" to "anon";

grant truncate on table "public"."report_header" to "anon";

grant update on table "public"."report_header" to "anon";

grant delete on table "public"."report_header" to "authenticated";

grant insert on table "public"."report_header" to "authenticated";

grant references on table "public"."report_header" to "authenticated";

grant select on table "public"."report_header" to "authenticated";

grant trigger on table "public"."report_header" to "authenticated";

grant truncate on table "public"."report_header" to "authenticated";

grant update on table "public"."report_header" to "authenticated";

grant delete on table "public"."report_header" to "service_role";

grant insert on table "public"."report_header" to "service_role";

grant references on table "public"."report_header" to "service_role";

grant select on table "public"."report_header" to "service_role";

grant trigger on table "public"."report_header" to "service_role";

grant truncate on table "public"."report_header" to "service_role";

grant update on table "public"."report_header" to "service_role";

grant delete on table "public"."risks" to "anon";

grant insert on table "public"."risks" to "anon";

grant references on table "public"."risks" to "anon";

grant select on table "public"."risks" to "anon";

grant trigger on table "public"."risks" to "anon";

grant truncate on table "public"."risks" to "anon";

grant update on table "public"."risks" to "anon";

grant delete on table "public"."risks" to "authenticated";

grant insert on table "public"."risks" to "authenticated";

grant references on table "public"."risks" to "authenticated";

grant select on table "public"."risks" to "authenticated";

grant trigger on table "public"."risks" to "authenticated";

grant truncate on table "public"."risks" to "authenticated";

grant update on table "public"."risks" to "authenticated";

grant delete on table "public"."risks" to "service_role";

grant insert on table "public"."risks" to "service_role";

grant references on table "public"."risks" to "service_role";

grant select on table "public"."risks" to "service_role";

grant trigger on table "public"."risks" to "service_role";

grant truncate on table "public"."risks" to "service_role";

grant update on table "public"."risks" to "service_role";

grant delete on table "public"."rm_risks" to "anon";

grant insert on table "public"."rm_risks" to "anon";

grant references on table "public"."rm_risks" to "anon";

grant select on table "public"."rm_risks" to "anon";

grant trigger on table "public"."rm_risks" to "anon";

grant truncate on table "public"."rm_risks" to "anon";

grant update on table "public"."rm_risks" to "anon";

grant delete on table "public"."rm_risks" to "authenticated";

grant insert on table "public"."rm_risks" to "authenticated";

grant references on table "public"."rm_risks" to "authenticated";

grant select on table "public"."rm_risks" to "authenticated";

grant trigger on table "public"."rm_risks" to "authenticated";

grant truncate on table "public"."rm_risks" to "authenticated";

grant update on table "public"."rm_risks" to "authenticated";

grant delete on table "public"."rm_risks" to "service_role";

grant insert on table "public"."rm_risks" to "service_role";

grant references on table "public"."rm_risks" to "service_role";

grant select on table "public"."rm_risks" to "service_role";

grant trigger on table "public"."rm_risks" to "service_role";

grant truncate on table "public"."rm_risks" to "service_role";

grant update on table "public"."rm_risks" to "service_role";

grant delete on table "public"."service_profiles" to "anon";

grant insert on table "public"."service_profiles" to "anon";

grant references on table "public"."service_profiles" to "anon";

grant select on table "public"."service_profiles" to "anon";

grant trigger on table "public"."service_profiles" to "anon";

grant truncate on table "public"."service_profiles" to "anon";

grant update on table "public"."service_profiles" to "anon";

grant delete on table "public"."service_profiles" to "authenticated";

grant insert on table "public"."service_profiles" to "authenticated";

grant references on table "public"."service_profiles" to "authenticated";

grant select on table "public"."service_profiles" to "authenticated";

grant trigger on table "public"."service_profiles" to "authenticated";

grant truncate on table "public"."service_profiles" to "authenticated";

grant update on table "public"."service_profiles" to "authenticated";

grant delete on table "public"."service_profiles" to "service_role";

grant insert on table "public"."service_profiles" to "service_role";

grant references on table "public"."service_profiles" to "service_role";

grant select on table "public"."service_profiles" to "service_role";

grant trigger on table "public"."service_profiles" to "service_role";

grant truncate on table "public"."service_profiles" to "service_role";

grant update on table "public"."service_profiles" to "service_role";

grant delete on table "public"."services" to "anon";

grant insert on table "public"."services" to "anon";

grant references on table "public"."services" to "anon";

grant select on table "public"."services" to "anon";

grant trigger on table "public"."services" to "anon";

grant truncate on table "public"."services" to "anon";

grant update on table "public"."services" to "anon";

grant delete on table "public"."services" to "authenticated";

grant insert on table "public"."services" to "authenticated";

grant references on table "public"."services" to "authenticated";

grant select on table "public"."services" to "authenticated";

grant trigger on table "public"."services" to "authenticated";

grant truncate on table "public"."services" to "authenticated";

grant update on table "public"."services" to "authenticated";

grant delete on table "public"."services" to "service_role";

grant insert on table "public"."services" to "service_role";

grant references on table "public"."services" to "service_role";

grant select on table "public"."services" to "service_role";

grant trigger on table "public"."services" to "service_role";

grant truncate on table "public"."services" to "service_role";

grant update on table "public"."services" to "service_role";

grant delete on table "public"."sow_header" to "anon";

grant insert on table "public"."sow_header" to "anon";

grant references on table "public"."sow_header" to "anon";

grant select on table "public"."sow_header" to "anon";

grant trigger on table "public"."sow_header" to "anon";

grant truncate on table "public"."sow_header" to "anon";

grant update on table "public"."sow_header" to "anon";

grant delete on table "public"."sow_header" to "authenticated";

grant insert on table "public"."sow_header" to "authenticated";

grant references on table "public"."sow_header" to "authenticated";

grant select on table "public"."sow_header" to "authenticated";

grant trigger on table "public"."sow_header" to "authenticated";

grant truncate on table "public"."sow_header" to "authenticated";

grant update on table "public"."sow_header" to "authenticated";

grant delete on table "public"."sow_header" to "service_role";

grant insert on table "public"."sow_header" to "service_role";

grant references on table "public"."sow_header" to "service_role";

grant select on table "public"."sow_header" to "service_role";

grant trigger on table "public"."sow_header" to "service_role";

grant truncate on table "public"."sow_header" to "service_role";

grant update on table "public"."sow_header" to "service_role";

grant delete on table "public"."sow_plan" to "anon";

grant insert on table "public"."sow_plan" to "anon";

grant references on table "public"."sow_plan" to "anon";

grant select on table "public"."sow_plan" to "anon";

grant trigger on table "public"."sow_plan" to "anon";

grant truncate on table "public"."sow_plan" to "anon";

grant update on table "public"."sow_plan" to "anon";

grant delete on table "public"."sow_plan" to "authenticated";

grant insert on table "public"."sow_plan" to "authenticated";

grant references on table "public"."sow_plan" to "authenticated";

grant select on table "public"."sow_plan" to "authenticated";

grant trigger on table "public"."sow_plan" to "authenticated";

grant truncate on table "public"."sow_plan" to "authenticated";

grant update on table "public"."sow_plan" to "authenticated";

grant delete on table "public"."sow_plan" to "service_role";

grant insert on table "public"."sow_plan" to "service_role";

grant references on table "public"."sow_plan" to "service_role";

grant select on table "public"."sow_plan" to "service_role";

grant trigger on table "public"."sow_plan" to "service_role";

grant truncate on table "public"."sow_plan" to "service_role";

grant update on table "public"."sow_plan" to "service_role";

grant delete on table "public"."sow_steps" to "anon";

grant insert on table "public"."sow_steps" to "anon";

grant references on table "public"."sow_steps" to "anon";

grant select on table "public"."sow_steps" to "anon";

grant trigger on table "public"."sow_steps" to "anon";

grant truncate on table "public"."sow_steps" to "anon";

grant update on table "public"."sow_steps" to "anon";

grant delete on table "public"."sow_steps" to "authenticated";

grant insert on table "public"."sow_steps" to "authenticated";

grant references on table "public"."sow_steps" to "authenticated";

grant select on table "public"."sow_steps" to "authenticated";

grant trigger on table "public"."sow_steps" to "authenticated";

grant truncate on table "public"."sow_steps" to "authenticated";

grant update on table "public"."sow_steps" to "authenticated";

grant delete on table "public"."sow_steps" to "service_role";

grant insert on table "public"."sow_steps" to "service_role";

grant references on table "public"."sow_steps" to "service_role";

grant select on table "public"."sow_steps" to "service_role";

grant trigger on table "public"."sow_steps" to "service_role";

grant truncate on table "public"."sow_steps" to "service_role";

grant update on table "public"."sow_steps" to "service_role";

grant delete on table "public"."sow_texts" to "anon";

grant insert on table "public"."sow_texts" to "anon";

grant references on table "public"."sow_texts" to "anon";

grant select on table "public"."sow_texts" to "anon";

grant trigger on table "public"."sow_texts" to "anon";

grant truncate on table "public"."sow_texts" to "anon";

grant update on table "public"."sow_texts" to "anon";

grant delete on table "public"."sow_texts" to "authenticated";

grant insert on table "public"."sow_texts" to "authenticated";

grant references on table "public"."sow_texts" to "authenticated";

grant select on table "public"."sow_texts" to "authenticated";

grant trigger on table "public"."sow_texts" to "authenticated";

grant truncate on table "public"."sow_texts" to "authenticated";

grant update on table "public"."sow_texts" to "authenticated";

grant delete on table "public"."sow_texts" to "service_role";

grant insert on table "public"."sow_texts" to "service_role";

grant references on table "public"."sow_texts" to "service_role";

grant select on table "public"."sow_texts" to "service_role";

grant trigger on table "public"."sow_texts" to "service_role";

grant truncate on table "public"."sow_texts" to "service_role";

grant update on table "public"."sow_texts" to "service_role";

grant delete on table "public"."sow_topics" to "anon";

grant insert on table "public"."sow_topics" to "anon";

grant references on table "public"."sow_topics" to "anon";

grant select on table "public"."sow_topics" to "anon";

grant trigger on table "public"."sow_topics" to "anon";

grant truncate on table "public"."sow_topics" to "anon";

grant update on table "public"."sow_topics" to "anon";

grant delete on table "public"."sow_topics" to "authenticated";

grant insert on table "public"."sow_topics" to "authenticated";

grant references on table "public"."sow_topics" to "authenticated";

grant select on table "public"."sow_topics" to "authenticated";

grant trigger on table "public"."sow_topics" to "authenticated";

grant truncate on table "public"."sow_topics" to "authenticated";

grant update on table "public"."sow_topics" to "authenticated";

grant delete on table "public"."sow_topics" to "service_role";

grant insert on table "public"."sow_topics" to "service_role";

grant references on table "public"."sow_topics" to "service_role";

grant select on table "public"."sow_topics" to "service_role";

grant trigger on table "public"."sow_topics" to "service_role";

grant truncate on table "public"."sow_topics" to "service_role";

grant update on table "public"."sow_topics" to "service_role";

grant delete on table "public"."student_admissions" to "anon";

grant insert on table "public"."student_admissions" to "anon";

grant references on table "public"."student_admissions" to "anon";

grant select on table "public"."student_admissions" to "anon";

grant trigger on table "public"."student_admissions" to "anon";

grant truncate on table "public"."student_admissions" to "anon";

grant update on table "public"."student_admissions" to "anon";

grant delete on table "public"."student_admissions" to "authenticated";

grant insert on table "public"."student_admissions" to "authenticated";

grant references on table "public"."student_admissions" to "authenticated";

grant select on table "public"."student_admissions" to "authenticated";

grant trigger on table "public"."student_admissions" to "authenticated";

grant truncate on table "public"."student_admissions" to "authenticated";

grant update on table "public"."student_admissions" to "authenticated";

grant delete on table "public"."student_admissions" to "service_role";

grant insert on table "public"."student_admissions" to "service_role";

grant references on table "public"."student_admissions" to "service_role";

grant select on table "public"."student_admissions" to "service_role";

grant trigger on table "public"."student_admissions" to "service_role";

grant truncate on table "public"."student_admissions" to "service_role";

grant update on table "public"."student_admissions" to "service_role";

grant delete on table "public"."student_ap" to "anon";

grant insert on table "public"."student_ap" to "anon";

grant references on table "public"."student_ap" to "anon";

grant select on table "public"."student_ap" to "anon";

grant trigger on table "public"."student_ap" to "anon";

grant truncate on table "public"."student_ap" to "anon";

grant update on table "public"."student_ap" to "anon";

grant delete on table "public"."student_ap" to "authenticated";

grant insert on table "public"."student_ap" to "authenticated";

grant references on table "public"."student_ap" to "authenticated";

grant select on table "public"."student_ap" to "authenticated";

grant trigger on table "public"."student_ap" to "authenticated";

grant truncate on table "public"."student_ap" to "authenticated";

grant update on table "public"."student_ap" to "authenticated";

grant delete on table "public"."student_ap" to "service_role";

grant insert on table "public"."student_ap" to "service_role";

grant references on table "public"."student_ap" to "service_role";

grant select on table "public"."student_ap" to "service_role";

grant trigger on table "public"."student_ap" to "service_role";

grant truncate on table "public"."student_ap" to "service_role";

grant update on table "public"."student_ap" to "service_role";

grant delete on table "public"."student_assessment_tracking" to "anon";

grant insert on table "public"."student_assessment_tracking" to "anon";

grant references on table "public"."student_assessment_tracking" to "anon";

grant select on table "public"."student_assessment_tracking" to "anon";

grant trigger on table "public"."student_assessment_tracking" to "anon";

grant truncate on table "public"."student_assessment_tracking" to "anon";

grant update on table "public"."student_assessment_tracking" to "anon";

grant delete on table "public"."student_assessment_tracking" to "authenticated";

grant insert on table "public"."student_assessment_tracking" to "authenticated";

grant references on table "public"."student_assessment_tracking" to "authenticated";

grant select on table "public"."student_assessment_tracking" to "authenticated";

grant trigger on table "public"."student_assessment_tracking" to "authenticated";

grant truncate on table "public"."student_assessment_tracking" to "authenticated";

grant update on table "public"."student_assessment_tracking" to "authenticated";

grant delete on table "public"."student_assessment_tracking" to "service_role";

grant insert on table "public"."student_assessment_tracking" to "service_role";

grant references on table "public"."student_assessment_tracking" to "service_role";

grant select on table "public"."student_assessment_tracking" to "service_role";

grant trigger on table "public"."student_assessment_tracking" to "service_role";

grant truncate on table "public"."student_assessment_tracking" to "service_role";

grant update on table "public"."student_assessment_tracking" to "service_role";

grant delete on table "public"."student_assessments" to "anon";

grant insert on table "public"."student_assessments" to "anon";

grant references on table "public"."student_assessments" to "anon";

grant select on table "public"."student_assessments" to "anon";

grant trigger on table "public"."student_assessments" to "anon";

grant truncate on table "public"."student_assessments" to "anon";

grant update on table "public"."student_assessments" to "anon";

grant delete on table "public"."student_assessments" to "authenticated";

grant insert on table "public"."student_assessments" to "authenticated";

grant references on table "public"."student_assessments" to "authenticated";

grant select on table "public"."student_assessments" to "authenticated";

grant trigger on table "public"."student_assessments" to "authenticated";

grant truncate on table "public"."student_assessments" to "authenticated";

grant update on table "public"."student_assessments" to "authenticated";

grant delete on table "public"."student_assessments" to "service_role";

grant insert on table "public"."student_assessments" to "service_role";

grant references on table "public"."student_assessments" to "service_role";

grant select on table "public"."student_assessments" to "service_role";

grant trigger on table "public"."student_assessments" to "service_role";

grant truncate on table "public"."student_assessments" to "service_role";

grant update on table "public"."student_assessments" to "service_role";

grant delete on table "public"."student_ilp_header" to "anon";

grant insert on table "public"."student_ilp_header" to "anon";

grant references on table "public"."student_ilp_header" to "anon";

grant select on table "public"."student_ilp_header" to "anon";

grant trigger on table "public"."student_ilp_header" to "anon";

grant truncate on table "public"."student_ilp_header" to "anon";

grant update on table "public"."student_ilp_header" to "anon";

grant delete on table "public"."student_ilp_header" to "authenticated";

grant insert on table "public"."student_ilp_header" to "authenticated";

grant references on table "public"."student_ilp_header" to "authenticated";

grant select on table "public"."student_ilp_header" to "authenticated";

grant trigger on table "public"."student_ilp_header" to "authenticated";

grant truncate on table "public"."student_ilp_header" to "authenticated";

grant update on table "public"."student_ilp_header" to "authenticated";

grant delete on table "public"."student_ilp_header" to "service_role";

grant insert on table "public"."student_ilp_header" to "service_role";

grant references on table "public"."student_ilp_header" to "service_role";

grant select on table "public"."student_ilp_header" to "service_role";

grant trigger on table "public"."student_ilp_header" to "service_role";

grant truncate on table "public"."student_ilp_header" to "service_role";

grant update on table "public"."student_ilp_header" to "service_role";

grant delete on table "public"."student_milestone_assessments" to "anon";

grant insert on table "public"."student_milestone_assessments" to "anon";

grant references on table "public"."student_milestone_assessments" to "anon";

grant select on table "public"."student_milestone_assessments" to "anon";

grant trigger on table "public"."student_milestone_assessments" to "anon";

grant truncate on table "public"."student_milestone_assessments" to "anon";

grant update on table "public"."student_milestone_assessments" to "anon";

grant delete on table "public"."student_milestone_assessments" to "authenticated";

grant insert on table "public"."student_milestone_assessments" to "authenticated";

grant references on table "public"."student_milestone_assessments" to "authenticated";

grant select on table "public"."student_milestone_assessments" to "authenticated";

grant trigger on table "public"."student_milestone_assessments" to "authenticated";

grant truncate on table "public"."student_milestone_assessments" to "authenticated";

grant update on table "public"."student_milestone_assessments" to "authenticated";

grant delete on table "public"."student_milestone_assessments" to "service_role";

grant insert on table "public"."student_milestone_assessments" to "service_role";

grant references on table "public"."student_milestone_assessments" to "service_role";

grant select on table "public"."student_milestone_assessments" to "service_role";

grant trigger on table "public"."student_milestone_assessments" to "service_role";

grant truncate on table "public"."student_milestone_assessments" to "service_role";

grant update on table "public"."student_milestone_assessments" to "service_role";

grant delete on table "public"."student_milestones" to "anon";

grant insert on table "public"."student_milestones" to "anon";

grant references on table "public"."student_milestones" to "anon";

grant select on table "public"."student_milestones" to "anon";

grant trigger on table "public"."student_milestones" to "anon";

grant truncate on table "public"."student_milestones" to "anon";

grant update on table "public"."student_milestones" to "anon";

grant delete on table "public"."student_milestones" to "authenticated";

grant insert on table "public"."student_milestones" to "authenticated";

grant references on table "public"."student_milestones" to "authenticated";

grant select on table "public"."student_milestones" to "authenticated";

grant trigger on table "public"."student_milestones" to "authenticated";

grant truncate on table "public"."student_milestones" to "authenticated";

grant update on table "public"."student_milestones" to "authenticated";

grant delete on table "public"."student_milestones" to "service_role";

grant insert on table "public"."student_milestones" to "service_role";

grant references on table "public"."student_milestones" to "service_role";

grant select on table "public"."student_milestones" to "service_role";

grant trigger on table "public"."student_milestones" to "service_role";

grant truncate on table "public"."student_milestones" to "service_role";

grant update on table "public"."student_milestones" to "service_role";

grant delete on table "public"."student_needsoutcomes" to "anon";

grant insert on table "public"."student_needsoutcomes" to "anon";

grant references on table "public"."student_needsoutcomes" to "anon";

grant select on table "public"."student_needsoutcomes" to "anon";

grant trigger on table "public"."student_needsoutcomes" to "anon";

grant truncate on table "public"."student_needsoutcomes" to "anon";

grant update on table "public"."student_needsoutcomes" to "anon";

grant delete on table "public"."student_needsoutcomes" to "authenticated";

grant insert on table "public"."student_needsoutcomes" to "authenticated";

grant references on table "public"."student_needsoutcomes" to "authenticated";

grant select on table "public"."student_needsoutcomes" to "authenticated";

grant trigger on table "public"."student_needsoutcomes" to "authenticated";

grant truncate on table "public"."student_needsoutcomes" to "authenticated";

grant update on table "public"."student_needsoutcomes" to "authenticated";

grant delete on table "public"."student_needsoutcomes" to "service_role";

grant insert on table "public"."student_needsoutcomes" to "service_role";

grant references on table "public"."student_needsoutcomes" to "service_role";

grant select on table "public"."student_needsoutcomes" to "service_role";

grant trigger on table "public"."student_needsoutcomes" to "service_role";

grant truncate on table "public"."student_needsoutcomes" to "service_role";

grant update on table "public"."student_needsoutcomes" to "service_role";

grant delete on table "public"."student_pillar_levels" to "anon";

grant insert on table "public"."student_pillar_levels" to "anon";

grant references on table "public"."student_pillar_levels" to "anon";

grant select on table "public"."student_pillar_levels" to "anon";

grant trigger on table "public"."student_pillar_levels" to "anon";

grant truncate on table "public"."student_pillar_levels" to "anon";

grant update on table "public"."student_pillar_levels" to "anon";

grant delete on table "public"."student_pillar_levels" to "authenticated";

grant insert on table "public"."student_pillar_levels" to "authenticated";

grant references on table "public"."student_pillar_levels" to "authenticated";

grant select on table "public"."student_pillar_levels" to "authenticated";

grant trigger on table "public"."student_pillar_levels" to "authenticated";

grant truncate on table "public"."student_pillar_levels" to "authenticated";

grant update on table "public"."student_pillar_levels" to "authenticated";

grant delete on table "public"."student_pillar_levels" to "service_role";

grant insert on table "public"."student_pillar_levels" to "service_role";

grant references on table "public"."student_pillar_levels" to "service_role";

grant select on table "public"."student_pillar_levels" to "service_role";

grant trigger on table "public"."student_pillar_levels" to "service_role";

grant truncate on table "public"."student_pillar_levels" to "service_role";

grant update on table "public"."student_pillar_levels" to "service_role";

grant delete on table "public"."student_target_assessments" to "anon";

grant insert on table "public"."student_target_assessments" to "anon";

grant references on table "public"."student_target_assessments" to "anon";

grant select on table "public"."student_target_assessments" to "anon";

grant trigger on table "public"."student_target_assessments" to "anon";

grant truncate on table "public"."student_target_assessments" to "anon";

grant update on table "public"."student_target_assessments" to "anon";

grant delete on table "public"."student_target_assessments" to "authenticated";

grant insert on table "public"."student_target_assessments" to "authenticated";

grant references on table "public"."student_target_assessments" to "authenticated";

grant select on table "public"."student_target_assessments" to "authenticated";

grant trigger on table "public"."student_target_assessments" to "authenticated";

grant truncate on table "public"."student_target_assessments" to "authenticated";

grant update on table "public"."student_target_assessments" to "authenticated";

grant delete on table "public"."student_target_assessments" to "service_role";

grant insert on table "public"."student_target_assessments" to "service_role";

grant references on table "public"."student_target_assessments" to "service_role";

grant select on table "public"."student_target_assessments" to "service_role";

grant trigger on table "public"."student_target_assessments" to "service_role";

grant truncate on table "public"."student_target_assessments" to "service_role";

grant update on table "public"."student_target_assessments" to "service_role";

grant delete on table "public"."student_targets" to "anon";

grant insert on table "public"."student_targets" to "anon";

grant references on table "public"."student_targets" to "anon";

grant select on table "public"."student_targets" to "anon";

grant trigger on table "public"."student_targets" to "anon";

grant truncate on table "public"."student_targets" to "anon";

grant update on table "public"."student_targets" to "anon";

grant delete on table "public"."student_targets" to "authenticated";

grant insert on table "public"."student_targets" to "authenticated";

grant references on table "public"."student_targets" to "authenticated";

grant select on table "public"."student_targets" to "authenticated";

grant trigger on table "public"."student_targets" to "authenticated";

grant truncate on table "public"."student_targets" to "authenticated";

grant update on table "public"."student_targets" to "authenticated";

grant delete on table "public"."student_targets" to "service_role";

grant insert on table "public"."student_targets" to "service_role";

grant references on table "public"."student_targets" to "service_role";

grant select on table "public"."student_targets" to "service_role";

grant trigger on table "public"."student_targets" to "service_role";

grant truncate on table "public"."student_targets" to "service_role";

grant update on table "public"."student_targets" to "service_role";

grant delete on table "public"."students" to "anon";

grant insert on table "public"."students" to "anon";

grant references on table "public"."students" to "anon";

grant select on table "public"."students" to "anon";

grant trigger on table "public"."students" to "anon";

grant truncate on table "public"."students" to "anon";

grant update on table "public"."students" to "anon";

grant delete on table "public"."students" to "authenticated";

grant insert on table "public"."students" to "authenticated";

grant references on table "public"."students" to "authenticated";

grant select on table "public"."students" to "authenticated";

grant trigger on table "public"."students" to "authenticated";

grant truncate on table "public"."students" to "authenticated";

grant update on table "public"."students" to "authenticated";

grant delete on table "public"."students" to "service_role";

grant insert on table "public"."students" to "service_role";

grant references on table "public"."students" to "service_role";

grant select on table "public"."students" to "service_role";

grant trigger on table "public"."students" to "service_role";

grant truncate on table "public"."students" to "service_role";

grant update on table "public"."students" to "service_role";

grant delete on table "public"."tasklists" to "anon";

grant insert on table "public"."tasklists" to "anon";

grant references on table "public"."tasklists" to "anon";

grant select on table "public"."tasklists" to "anon";

grant trigger on table "public"."tasklists" to "anon";

grant truncate on table "public"."tasklists" to "anon";

grant update on table "public"."tasklists" to "anon";

grant delete on table "public"."tasklists" to "authenticated";

grant insert on table "public"."tasklists" to "authenticated";

grant references on table "public"."tasklists" to "authenticated";

grant select on table "public"."tasklists" to "authenticated";

grant trigger on table "public"."tasklists" to "authenticated";

grant truncate on table "public"."tasklists" to "authenticated";

grant update on table "public"."tasklists" to "authenticated";

grant delete on table "public"."tasklists" to "service_role";

grant insert on table "public"."tasklists" to "service_role";

grant references on table "public"."tasklists" to "service_role";

grant select on table "public"."tasklists" to "service_role";

grant trigger on table "public"."tasklists" to "service_role";

grant truncate on table "public"."tasklists" to "service_role";

grant update on table "public"."tasklists" to "service_role";

grant delete on table "public"."temp_import_student_admissions" to "anon";

grant insert on table "public"."temp_import_student_admissions" to "anon";

grant references on table "public"."temp_import_student_admissions" to "anon";

grant select on table "public"."temp_import_student_admissions" to "anon";

grant trigger on table "public"."temp_import_student_admissions" to "anon";

grant truncate on table "public"."temp_import_student_admissions" to "anon";

grant update on table "public"."temp_import_student_admissions" to "anon";

grant delete on table "public"."temp_import_student_admissions" to "authenticated";

grant insert on table "public"."temp_import_student_admissions" to "authenticated";

grant references on table "public"."temp_import_student_admissions" to "authenticated";

grant select on table "public"."temp_import_student_admissions" to "authenticated";

grant trigger on table "public"."temp_import_student_admissions" to "authenticated";

grant truncate on table "public"."temp_import_student_admissions" to "authenticated";

grant update on table "public"."temp_import_student_admissions" to "authenticated";

grant delete on table "public"."temp_import_student_admissions" to "service_role";

grant insert on table "public"."temp_import_student_admissions" to "service_role";

grant references on table "public"."temp_import_student_admissions" to "service_role";

grant select on table "public"."temp_import_student_admissions" to "service_role";

grant trigger on table "public"."temp_import_student_admissions" to "service_role";

grant truncate on table "public"."temp_import_student_admissions" to "service_role";

grant update on table "public"."temp_import_student_admissions" to "service_role";

grant delete on table "public"."temp_import_students" to "anon";

grant insert on table "public"."temp_import_students" to "anon";

grant references on table "public"."temp_import_students" to "anon";

grant select on table "public"."temp_import_students" to "anon";

grant trigger on table "public"."temp_import_students" to "anon";

grant truncate on table "public"."temp_import_students" to "anon";

grant update on table "public"."temp_import_students" to "anon";

grant delete on table "public"."temp_import_students" to "authenticated";

grant insert on table "public"."temp_import_students" to "authenticated";

grant references on table "public"."temp_import_students" to "authenticated";

grant select on table "public"."temp_import_students" to "authenticated";

grant trigger on table "public"."temp_import_students" to "authenticated";

grant truncate on table "public"."temp_import_students" to "authenticated";

grant update on table "public"."temp_import_students" to "authenticated";

grant delete on table "public"."temp_import_students" to "service_role";

grant insert on table "public"."temp_import_students" to "service_role";

grant references on table "public"."temp_import_students" to "service_role";

grant select on table "public"."temp_import_students" to "service_role";

grant trigger on table "public"."temp_import_students" to "service_role";

grant truncate on table "public"."temp_import_students" to "service_role";

grant update on table "public"."temp_import_students" to "service_role";

grant delete on table "public"."temp_imported_outcomes" to "anon";

grant insert on table "public"."temp_imported_outcomes" to "anon";

grant references on table "public"."temp_imported_outcomes" to "anon";

grant select on table "public"."temp_imported_outcomes" to "anon";

grant trigger on table "public"."temp_imported_outcomes" to "anon";

grant truncate on table "public"."temp_imported_outcomes" to "anon";

grant update on table "public"."temp_imported_outcomes" to "anon";

grant delete on table "public"."temp_imported_outcomes" to "authenticated";

grant insert on table "public"."temp_imported_outcomes" to "authenticated";

grant references on table "public"."temp_imported_outcomes" to "authenticated";

grant select on table "public"."temp_imported_outcomes" to "authenticated";

grant trigger on table "public"."temp_imported_outcomes" to "authenticated";

grant truncate on table "public"."temp_imported_outcomes" to "authenticated";

grant update on table "public"."temp_imported_outcomes" to "authenticated";

grant delete on table "public"."temp_imported_outcomes" to "service_role";

grant insert on table "public"."temp_imported_outcomes" to "service_role";

grant references on table "public"."temp_imported_outcomes" to "service_role";

grant select on table "public"."temp_imported_outcomes" to "service_role";

grant trigger on table "public"."temp_imported_outcomes" to "service_role";

grant truncate on table "public"."temp_imported_outcomes" to "service_role";

grant update on table "public"."temp_imported_outcomes" to "service_role";

grant delete on table "public"."temp_targetcheck" to "anon";

grant insert on table "public"."temp_targetcheck" to "anon";

grant references on table "public"."temp_targetcheck" to "anon";

grant select on table "public"."temp_targetcheck" to "anon";

grant trigger on table "public"."temp_targetcheck" to "anon";

grant truncate on table "public"."temp_targetcheck" to "anon";

grant update on table "public"."temp_targetcheck" to "anon";

grant delete on table "public"."temp_targetcheck" to "authenticated";

grant insert on table "public"."temp_targetcheck" to "authenticated";

grant references on table "public"."temp_targetcheck" to "authenticated";

grant select on table "public"."temp_targetcheck" to "authenticated";

grant trigger on table "public"."temp_targetcheck" to "authenticated";

grant truncate on table "public"."temp_targetcheck" to "authenticated";

grant update on table "public"."temp_targetcheck" to "authenticated";

grant delete on table "public"."temp_targetcheck" to "service_role";

grant insert on table "public"."temp_targetcheck" to "service_role";

grant references on table "public"."temp_targetcheck" to "service_role";

grant select on table "public"."temp_targetcheck" to "service_role";

grant trigger on table "public"."temp_targetcheck" to "service_role";

grant truncate on table "public"."temp_targetcheck" to "service_role";

grant update on table "public"."temp_targetcheck" to "service_role";

grant delete on table "public"."terms" to "anon";

grant insert on table "public"."terms" to "anon";

grant references on table "public"."terms" to "anon";

grant select on table "public"."terms" to "anon";

grant trigger on table "public"."terms" to "anon";

grant truncate on table "public"."terms" to "anon";

grant update on table "public"."terms" to "anon";

grant delete on table "public"."terms" to "authenticated";

grant insert on table "public"."terms" to "authenticated";

grant references on table "public"."terms" to "authenticated";

grant select on table "public"."terms" to "authenticated";

grant trigger on table "public"."terms" to "authenticated";

grant truncate on table "public"."terms" to "authenticated";

grant update on table "public"."terms" to "authenticated";

grant delete on table "public"."terms" to "service_role";

grant insert on table "public"."terms" to "service_role";

grant references on table "public"."terms" to "service_role";

grant select on table "public"."terms" to "service_role";

grant trigger on table "public"."terms" to "service_role";

grant truncate on table "public"."terms" to "service_role";

grant update on table "public"."terms" to "service_role";

grant delete on table "public"."test_mr" to "anon";

grant insert on table "public"."test_mr" to "anon";

grant references on table "public"."test_mr" to "anon";

grant select on table "public"."test_mr" to "anon";

grant trigger on table "public"."test_mr" to "anon";

grant truncate on table "public"."test_mr" to "anon";

grant update on table "public"."test_mr" to "anon";

grant delete on table "public"."test_mr" to "authenticated";

grant insert on table "public"."test_mr" to "authenticated";

grant references on table "public"."test_mr" to "authenticated";

grant select on table "public"."test_mr" to "authenticated";

grant trigger on table "public"."test_mr" to "authenticated";

grant truncate on table "public"."test_mr" to "authenticated";

grant update on table "public"."test_mr" to "authenticated";

grant delete on table "public"."test_mr" to "service_role";

grant insert on table "public"."test_mr" to "service_role";

grant references on table "public"."test_mr" to "service_role";

grant select on table "public"."test_mr" to "service_role";

grant trigger on table "public"."test_mr" to "service_role";

grant truncate on table "public"."test_mr" to "service_role";

grant update on table "public"."test_mr" to "service_role";

grant delete on table "public"."threads" to "anon";

grant insert on table "public"."threads" to "anon";

grant references on table "public"."threads" to "anon";

grant select on table "public"."threads" to "anon";

grant trigger on table "public"."threads" to "anon";

grant truncate on table "public"."threads" to "anon";

grant update on table "public"."threads" to "anon";

grant delete on table "public"."threads" to "authenticated";

grant insert on table "public"."threads" to "authenticated";

grant references on table "public"."threads" to "authenticated";

grant select on table "public"."threads" to "authenticated";

grant trigger on table "public"."threads" to "authenticated";

grant truncate on table "public"."threads" to "authenticated";

grant update on table "public"."threads" to "authenticated";

grant delete on table "public"."threads" to "service_role";

grant insert on table "public"."threads" to "service_role";

grant references on table "public"."threads" to "service_role";

grant select on table "public"."threads" to "service_role";

grant trigger on table "public"."threads" to "service_role";

grant truncate on table "public"."threads" to "service_role";

grant update on table "public"."threads" to "service_role";

grant delete on table "public"."ticket_messages" to "anon";

grant insert on table "public"."ticket_messages" to "anon";

grant references on table "public"."ticket_messages" to "anon";

grant select on table "public"."ticket_messages" to "anon";

grant trigger on table "public"."ticket_messages" to "anon";

grant truncate on table "public"."ticket_messages" to "anon";

grant update on table "public"."ticket_messages" to "anon";

grant delete on table "public"."ticket_messages" to "authenticated";

grant insert on table "public"."ticket_messages" to "authenticated";

grant references on table "public"."ticket_messages" to "authenticated";

grant select on table "public"."ticket_messages" to "authenticated";

grant trigger on table "public"."ticket_messages" to "authenticated";

grant truncate on table "public"."ticket_messages" to "authenticated";

grant update on table "public"."ticket_messages" to "authenticated";

grant delete on table "public"."ticket_messages" to "service_role";

grant insert on table "public"."ticket_messages" to "service_role";

grant references on table "public"."ticket_messages" to "service_role";

grant select on table "public"."ticket_messages" to "service_role";

grant trigger on table "public"."ticket_messages" to "service_role";

grant truncate on table "public"."ticket_messages" to "service_role";

grant update on table "public"."ticket_messages" to "service_role";

grant delete on table "public"."ticket_status_history" to "anon";

grant insert on table "public"."ticket_status_history" to "anon";

grant references on table "public"."ticket_status_history" to "anon";

grant select on table "public"."ticket_status_history" to "anon";

grant trigger on table "public"."ticket_status_history" to "anon";

grant truncate on table "public"."ticket_status_history" to "anon";

grant update on table "public"."ticket_status_history" to "anon";

grant delete on table "public"."ticket_status_history" to "authenticated";

grant insert on table "public"."ticket_status_history" to "authenticated";

grant references on table "public"."ticket_status_history" to "authenticated";

grant select on table "public"."ticket_status_history" to "authenticated";

grant trigger on table "public"."ticket_status_history" to "authenticated";

grant truncate on table "public"."ticket_status_history" to "authenticated";

grant update on table "public"."ticket_status_history" to "authenticated";

grant delete on table "public"."ticket_status_history" to "service_role";

grant insert on table "public"."ticket_status_history" to "service_role";

grant references on table "public"."ticket_status_history" to "service_role";

grant select on table "public"."ticket_status_history" to "service_role";

grant trigger on table "public"."ticket_status_history" to "service_role";

grant truncate on table "public"."ticket_status_history" to "service_role";

grant update on table "public"."ticket_status_history" to "service_role";

grant delete on table "public"."tickets" to "anon";

grant insert on table "public"."tickets" to "anon";

grant references on table "public"."tickets" to "anon";

grant select on table "public"."tickets" to "anon";

grant trigger on table "public"."tickets" to "anon";

grant truncate on table "public"."tickets" to "anon";

grant update on table "public"."tickets" to "anon";

grant delete on table "public"."tickets" to "authenticated";

grant insert on table "public"."tickets" to "authenticated";

grant references on table "public"."tickets" to "authenticated";

grant select on table "public"."tickets" to "authenticated";

grant trigger on table "public"."tickets" to "authenticated";

grant truncate on table "public"."tickets" to "authenticated";

grant update on table "public"."tickets" to "authenticated";

grant delete on table "public"."tickets" to "service_role";

grant insert on table "public"."tickets" to "service_role";

grant references on table "public"."tickets" to "service_role";

grant select on table "public"."tickets" to "service_role";

grant trigger on table "public"."tickets" to "service_role";

grant truncate on table "public"."tickets" to "service_role";

grant update on table "public"."tickets" to "service_role";

grant delete on table "public"."tmp_live_status" to "anon";

grant insert on table "public"."tmp_live_status" to "anon";

grant references on table "public"."tmp_live_status" to "anon";

grant select on table "public"."tmp_live_status" to "anon";

grant trigger on table "public"."tmp_live_status" to "anon";

grant truncate on table "public"."tmp_live_status" to "anon";

grant update on table "public"."tmp_live_status" to "anon";

grant delete on table "public"."tmp_live_status" to "authenticated";

grant insert on table "public"."tmp_live_status" to "authenticated";

grant references on table "public"."tmp_live_status" to "authenticated";

grant select on table "public"."tmp_live_status" to "authenticated";

grant trigger on table "public"."tmp_live_status" to "authenticated";

grant truncate on table "public"."tmp_live_status" to "authenticated";

grant update on table "public"."tmp_live_status" to "authenticated";

grant delete on table "public"."tmp_live_status" to "service_role";

grant insert on table "public"."tmp_live_status" to "service_role";

grant references on table "public"."tmp_live_status" to "service_role";

grant select on table "public"."tmp_live_status" to "service_role";

grant trigger on table "public"."tmp_live_status" to "service_role";

grant truncate on table "public"."tmp_live_status" to "service_role";

grant update on table "public"."tmp_live_status" to "service_role";

grant delete on table "public"."weeks" to "anon";

grant insert on table "public"."weeks" to "anon";

grant references on table "public"."weeks" to "anon";

grant select on table "public"."weeks" to "anon";

grant trigger on table "public"."weeks" to "anon";

grant truncate on table "public"."weeks" to "anon";

grant update on table "public"."weeks" to "anon";

grant delete on table "public"."weeks" to "authenticated";

grant insert on table "public"."weeks" to "authenticated";

grant references on table "public"."weeks" to "authenticated";

grant select on table "public"."weeks" to "authenticated";

grant trigger on table "public"."weeks" to "authenticated";

grant truncate on table "public"."weeks" to "authenticated";

grant update on table "public"."weeks" to "authenticated";

grant delete on table "public"."weeks" to "service_role";

grant insert on table "public"."weeks" to "service_role";

grant references on table "public"."weeks" to "service_role";

grant select on table "public"."weeks" to "service_role";

grant trigger on table "public"."weeks" to "service_role";

grant truncate on table "public"."weeks" to "service_role";

grant update on table "public"."weeks" to "service_role";

grant delete on table "public"."weweb_events" to "anon";

grant insert on table "public"."weweb_events" to "anon";

grant references on table "public"."weweb_events" to "anon";

grant select on table "public"."weweb_events" to "anon";

grant trigger on table "public"."weweb_events" to "anon";

grant truncate on table "public"."weweb_events" to "anon";

grant update on table "public"."weweb_events" to "anon";

grant delete on table "public"."weweb_events" to "authenticated";

grant insert on table "public"."weweb_events" to "authenticated";

grant references on table "public"."weweb_events" to "authenticated";

grant select on table "public"."weweb_events" to "authenticated";

grant trigger on table "public"."weweb_events" to "authenticated";

grant truncate on table "public"."weweb_events" to "authenticated";

grant update on table "public"."weweb_events" to "authenticated";

grant delete on table "public"."weweb_events" to "service_role";

grant insert on table "public"."weweb_events" to "service_role";

grant references on table "public"."weweb_events" to "service_role";

grant select on table "public"."weweb_events" to "service_role";

grant trigger on table "public"."weweb_events" to "service_role";

grant truncate on table "public"."weweb_events" to "service_role";

grant update on table "public"."weweb_events" to "service_role";

grant delete on table "public"."weweb_students" to "anon";

grant insert on table "public"."weweb_students" to "anon";

grant references on table "public"."weweb_students" to "anon";

grant select on table "public"."weweb_students" to "anon";

grant trigger on table "public"."weweb_students" to "anon";

grant truncate on table "public"."weweb_students" to "anon";

grant update on table "public"."weweb_students" to "anon";

grant delete on table "public"."weweb_students" to "authenticated";

grant insert on table "public"."weweb_students" to "authenticated";

grant references on table "public"."weweb_students" to "authenticated";

grant select on table "public"."weweb_students" to "authenticated";

grant trigger on table "public"."weweb_students" to "authenticated";

grant truncate on table "public"."weweb_students" to "authenticated";

grant update on table "public"."weweb_students" to "authenticated";

grant delete on table "public"."weweb_students" to "service_role";

grant insert on table "public"."weweb_students" to "service_role";

grant references on table "public"."weweb_students" to "service_role";

grant select on table "public"."weweb_students" to "service_role";

grant trigger on table "public"."weweb_students" to "service_role";

grant truncate on table "public"."weweb_students" to "service_role";

grant update on table "public"."weweb_students" to "service_role";

grant delete on table "public"."weweb_year_groups" to "anon";

grant insert on table "public"."weweb_year_groups" to "anon";

grant references on table "public"."weweb_year_groups" to "anon";

grant select on table "public"."weweb_year_groups" to "anon";

grant trigger on table "public"."weweb_year_groups" to "anon";

grant truncate on table "public"."weweb_year_groups" to "anon";

grant update on table "public"."weweb_year_groups" to "anon";

grant delete on table "public"."weweb_year_groups" to "authenticated";

grant insert on table "public"."weweb_year_groups" to "authenticated";

grant references on table "public"."weweb_year_groups" to "authenticated";

grant select on table "public"."weweb_year_groups" to "authenticated";

grant trigger on table "public"."weweb_year_groups" to "authenticated";

grant truncate on table "public"."weweb_year_groups" to "authenticated";

grant update on table "public"."weweb_year_groups" to "authenticated";

grant delete on table "public"."weweb_year_groups" to "service_role";

grant insert on table "public"."weweb_year_groups" to "service_role";

grant references on table "public"."weweb_year_groups" to "service_role";

grant select on table "public"."weweb_year_groups" to "service_role";

grant trigger on table "public"."weweb_year_groups" to "service_role";

grant truncate on table "public"."weweb_year_groups" to "service_role";

grant update on table "public"."weweb_year_groups" to "service_role";

grant delete on table "public"."workflows" to "anon";

grant insert on table "public"."workflows" to "anon";

grant references on table "public"."workflows" to "anon";

grant select on table "public"."workflows" to "anon";

grant trigger on table "public"."workflows" to "anon";

grant truncate on table "public"."workflows" to "anon";

grant update on table "public"."workflows" to "anon";

grant delete on table "public"."workflows" to "authenticated";

grant insert on table "public"."workflows" to "authenticated";

grant references on table "public"."workflows" to "authenticated";

grant select on table "public"."workflows" to "authenticated";

grant trigger on table "public"."workflows" to "authenticated";

grant truncate on table "public"."workflows" to "authenticated";

grant update on table "public"."workflows" to "authenticated";

grant delete on table "public"."workflows" to "service_role";

grant insert on table "public"."workflows" to "service_role";

grant references on table "public"."workflows" to "service_role";

grant select on table "public"."workflows" to "service_role";

grant trigger on table "public"."workflows" to "service_role";

grant truncate on table "public"."workflows" to "service_role";

grant update on table "public"."workflows" to "service_role";

create policy "Enable read access for all users"
on "public"."referral_header"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."weeks"
as permissive
for select
to public
using (true);


CREATE TRIGGER ensure_lower_name_trg BEFORE INSERT OR UPDATE ON public.accounts FOR EACH ROW EXECUTE FUNCTION make_lower_case();

CREATE TRIGGER my_webhook AFTER INSERT ON public.test_mr FOR EACH ROW EXECUTE FUNCTION http_request('https://maxrobertson.app.n8n.cloud/webhook/13ba20bf-ee43-42f0-908c-858669e17959', 'POST', '{"Content-Type":"application/json"}', '{}', '1000');


