select * from (
select
ash.SQL_ID , ash.SQL_PLAN_HASH_VALUE , sql_opcode,
current_obj# objn,
sum(decode(ash.session_state,'ON CPU',1,0)) cpu,
sum(decode(ash.session_state,'WAITING',1,0)) -
sum(decode(ash.session_state,'WAITING', decode(wait_class, 'User I/O',1,0),0)) wait ,
sum(decode(ash.session_state,'WAITING', decode(wait_class, 'User I/O',1,0),0)) io ,
sum(decode(ash.session_state,'ON CPU',1,1)) total
from gv$active_session_history ash
where sample_time >= sysdate-60/(24*60)
and SQL_ID is not NULL
group by sql_id, SQL_PLAN_HASH_VALUE , sql_opcode, current_obj#
order by total desc)
where rownum <= 10
/