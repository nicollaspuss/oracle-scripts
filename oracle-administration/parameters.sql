select a.sid,c.username,a.name,a.value 
from gv$ses_optimizer_env a 
join gv$sys_optimizer_env b on a.id=b.id 
join gv$session c on a.sid=c.sid
where a.name = '&parametro';