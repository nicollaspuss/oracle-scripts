SET LONG 3000
DEFINE nomeuser = '&username'
undef owner
select 'create user '||username||' identified by <SENHA> default tablespace '||default_tablespace||' temporary tablespace '||temporary_tablespace||';' AS "RECRIANDO USUARIO OU ROLE"
from dba_users
where username = upper('&nomeuser');
prompt DBA_SYS_PRIVS
select 'grant '||privilege||' to '||upper('&nomeuser')||';' AS "DBA_SYS_PRIVS" from dba_sys_privs where grantee = upper('&nomeuser');
prompt
prompt DBA_TAB_PRIVS
select 'grant '||privilege||' on '||owner||'.'||table_name||' to '||upper('&nomeuser')||';' AS "DBA_TAB_PRIVS" from dba_tab_privs where grantee = upper('&nomeuser') order by owner,table_name;
prompt
prompt DBA_ROLE_PRIVS
select 'grant '||granted_role||' to '||upper('&nomeuser')||';' AS "NA DBA_ROLE_PRIVS" from dba_role_privs where grantee = upper('&nomeuser');
prompt
prompt DBA_TS_QUOTAS
select 'alter user ' || USERNAME || ' quota unlimited on ' || TABLESPACE_NAME || ';' AS "QUOTAS EM TABLESPACES"
from DBA_TS_QUOTAS where USERNAME = upper('&nomeuser');
prompt