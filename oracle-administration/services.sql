col service format a30
col instances format a30
set linesize 4000
col STARTDOSERVICO format a100
select a.name,
       nvl(b.INSTANCES,'INATIVO') Instances,
       'exec dbms_service.start_service(''' || a.name || ''');' StartDoServico
     from dba_services a left join (
         select name service,service_id,LISTAGG(inst_id, ',') WITHIN GROUP (ORDER BY inst_id) instances
         from gv$active_services 
         group by name, service_id ) b
      on a.SERVICE_ID = b.SERVICE_ID
     where a.name not in ('SYS$BACKGROUND','SYS$USERS')
      --and nvl(b.INSTANCES,'INATIVO') = 'INATIVO'
   order by a.name; 