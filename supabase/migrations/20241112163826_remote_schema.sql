set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.select_merge_test2()
 RETURNS record
 LANGUAGE plpgsql
AS $function$BEGIN
  update merge_test set full_name = full_name;
END;$function$
;


