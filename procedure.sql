CREATE
OR REPLACE PROCEDURE create_temporary_table_for_tests(tablename varchar, suffix varchar)
LANGUAGE 'plpgsql'
AS $$
BEGIN
EXECUTE 'CREATE TABLE ' || quote_ident(tablename) || quote_ident(suffix) || ' as (select * from ' || quote_ident(tablename) || ');';
END;
$$;