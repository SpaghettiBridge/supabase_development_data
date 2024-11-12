alter table "public"."services" add column "new_col" integer;

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.select_merge_test2()
 RETURNS record
 LANGUAGE plpgsql
AS $function$BEGIN
  select * from merge_test;
END;$function$
;


