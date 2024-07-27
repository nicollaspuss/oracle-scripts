set pages 4000
set lines 4000
col LOGON_TIME format a20
break on report 
compute sum of "QUANT_SESSOES" on report
select distinct(USERNAME), COUNT(*)
 QUANT_SESSOES,INST_ID,STATUS, MACHINE, LOGON_TIME
from gv$session
where username like upper('%&username%')
GROUP BY USERNAME,INST_ID,STATUS, MACHINE, LOGON_TIME
order by 2;