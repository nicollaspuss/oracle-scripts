SET LONG 90000
SET PAGESIZE 4000
SET LINESIZE 1000
COL recommendations FOR A10000
var sql_id varchar2(30);
exec :sql_id := '&sql_id'
--accept SQLID 		char  prompt 'SQL_ID: '
DECLARE
  l_sql_tune_task_id  VARCHAR2(100);
BEGIN
  l_sql_tune_task_id := DBMS_SQLTUNE.create_tuning_task (
                          sql_id      => :sql_id,
                          scope       => DBMS_SQLTUNE.scope_comprehensive,
                          time_limit  => 1800,
                          task_name   => 'task_' || :sql_id,
                          description => 'Tuning task for statement ' || :sql_id);
  DBMS_OUTPUT.put_line('l_sql_tune_task_id: ' || l_sql_tune_task_id);
END;
/
begin
  DBMS_SQLTUNE.execute_tuning_task(task_name => 'task_' || :sql_id);
end;
/
SELECT DBMS_SQLTUNE.report_tuning_task('task_'||:sql_id) AS recommendations FROM dual
/