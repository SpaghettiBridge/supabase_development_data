create table "public"."merge_test" (
    "user_id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "first_name" character varying,
    "last_name" character varying,
    "full_name" character varying
);


alter table "public"."merge_test" enable row level security;

CREATE UNIQUE INDEX merge_test_pkey ON public.merge_test USING btree (user_id);

alter table "public"."merge_test" add constraint "merge_test_pkey" PRIMARY KEY using index "merge_test_pkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.merge_full_name()
 RETURNS void
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
begin
  UPDATE merge_test
  SET full_name = CONCAT(first_name, ' ', last_name);
end;
$function$
;

create or replace view "public"."view_merge_test" as  SELECT merge_test.user_id,
    merge_test.created_at,
    merge_test.first_name,
    merge_test.last_name,
    merge_test.full_name
   FROM merge_test;


create or replace view "public"."view_merge_test_services" as  SELECT services.id,
    services.service_name,
    services.location,
    services.status,
    services.created_at,
    services.initials
   FROM services;


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

grant delete on table "public"."merge_test" to "anon";

grant insert on table "public"."merge_test" to "anon";

grant references on table "public"."merge_test" to "anon";

grant select on table "public"."merge_test" to "anon";

grant trigger on table "public"."merge_test" to "anon";

grant truncate on table "public"."merge_test" to "anon";

grant update on table "public"."merge_test" to "anon";

grant delete on table "public"."merge_test" to "authenticated";

grant insert on table "public"."merge_test" to "authenticated";

grant references on table "public"."merge_test" to "authenticated";

grant select on table "public"."merge_test" to "authenticated";

grant trigger on table "public"."merge_test" to "authenticated";

grant truncate on table "public"."merge_test" to "authenticated";

grant update on table "public"."merge_test" to "authenticated";

grant delete on table "public"."merge_test" to "service_role";

grant insert on table "public"."merge_test" to "service_role";

grant references on table "public"."merge_test" to "service_role";

grant select on table "public"."merge_test" to "service_role";

grant trigger on table "public"."merge_test" to "service_role";

grant truncate on table "public"."merge_test" to "service_role";

grant update on table "public"."merge_test" to "service_role";

create policy "Enable delete for users based on user_id"
on "public"."merge_test"
as permissive
for delete
to public
using ((( SELECT auth.uid() AS uid) = user_id));



