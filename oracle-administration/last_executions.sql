col begin_interval_time format a35
col AVG_EXEC_TIME format a40
col AVG_BGETS format a25
SELECT ss.snap_id,
ss.instance_number node,
to_timestamp(to_char(begin_interval_time,'DD/MM/YYYY HH24:MI:SS'),'DD/MM/YYYY
HH24:MI:SS') begin_interval_time, sql_id,
plan_hash_value, nvl(executions_delta, 0)
execs,
to_char(round(( elapsed_time_delta / decode(nvl(executions_delta, 0), 0, 1,
executions_delta) ) / 1000000,4),'9999999999.9999') avg_exec_time,
to_char(round(( buffer_gets_delta / decode(nvl(buffer_gets_delta, 0), 0, 1,
executions_delta) ),4),'9999999999.9999') avg_bgets
FROM
dba_hist_sqlstat s,
dba_hist_snapshot ss
WHERE ss.snap_id = s.snap_id
AND ss.instance_number = s.instance_number
AND executions_delta > 0
AND sql_id like ('%&sql_id%') ORDER BY 3 DESC;
