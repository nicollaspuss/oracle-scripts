select s1.inst_id, s1.sid, s1.serial#, s1.status, s1.username, s1.machine, s1.SCHEMANAME, proc.sistema||':'||proc.nro_rotina||'-'||proc.rotina, s1.module, s1.action, s1.PROGRAM, s1.status, 
s1.sql_id, s1.sql_child_number, s1.logon_time, s1.last_call_et, sysdate-s1.last_call_et/60/60/24, s1.final_blocking_instance, 
s1.final_blocking_session, s1.blocking_session, s1.event, s1.p1text, s1.P1, s1.P2, s1.P3TEXT, s1.P3, df.FILE_NAME, s1.SERVICE_NAME
from gv$session s1, sys_dba.vw_sessoes_proc proc, dba_data_files df
where s1.sid like ('%&sid%') and s1.inst_id like ('%&inst_id%')
and s1.SID = proc.SID (+)
and s1.INST_ID = proc.INST_ID (+)
and s1.p1 = df.FILE_ID (+)
order by s1.sid;