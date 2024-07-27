set pages 4000
set lines 4000
col name format a50
col password format a50
select name, password from sys.user$ where name like upper('%&name%') order by 1;