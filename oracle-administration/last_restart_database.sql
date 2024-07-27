set pages 4000
set lines 4000
col host_name format a35
select to_char(startup_time, 'dd/mm/yyyy hh24:mi:ss') as "Startup time", 
instance_name, host_name, status from gv$instance;