set pages 4000
set lines 4000
col username format a30
col service_name for a65
col machine for a70
col event for a50
col program for a20
col client_identifier format a20
col service_name for a30
col action format a30
col osuser format a20
col module format a65
col objeto format a35
col tabela format a35
col LOGON_TIME format a17
ACC User prompt 'User:'
select
last_call_et segs,
sid,serial#,inst_id
,username
--,osuser
--,program
--,resource_consumer_group
,service_name
,machine
-- ,( select max(object_name) || '-' || max(object_type) from dba_objects where object_id = ROW_WAIT_OBJ# ) Objeto,
-- ( select max(table_name) end from dba_indexes where index_name = ( select max(object_name) from dba_objects where object_id = ROW_WAIT_OBJ# )) Tabela
,module
,sql_id
,action
--,machine
,to_char (logon_time, 'DD/MM/YYYY HH24:MI') LOGON_TIME
,seq#
,event
,BLOCKING_SESSION_status
,BLOCKING_SESSION
,BLOCKING_INSTANCE
from gv$session
where username like upper('%&User%')
and status = 'ACTIVE'
and username not in ('SYS', 'SYS_DBA', 'DBSNMP', 'C##NICOLLAS_PUSS')
-- and machine = 'app1osbcrmb001p.sicredi.net'
-- and username = 'SYSBACKUP'
order by last_call_et, logon_time asc;
