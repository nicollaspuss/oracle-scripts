set pages 4000
set lines 4000
DEFINE table_name = '&table_name'
select table_name, last_analyzed, num_rows 
from dba_tables where table_name = upper('&table_name')
union all
select index_name, last_analyzed, num_rows 
from dba_indexes where table_name = upper('&table_name');