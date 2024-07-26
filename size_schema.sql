set pages 4000
set lines 4000
col TAMANHO format 999,999,999,999
break on report
compute sum of TAMANHO on report
select owner,sum(bytes/1024/1024)TAMANHO
from dba_extents
where owner like upper('%&owner%')
group by owner
order by TAMANHO, owner;