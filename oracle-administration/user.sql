prompt Verifying user:
set pages 4000
set lines 4000
set long 10000
col username format a30
col account_status format a20
col profile format a35
col expiry_date format a25
col last_login format a25
col lock_date format a25
col password format a40
col password format a40
col password_versions format a17
SELECT a.username, a.account_status, a.profile, 
to_char(a.created, 'DD/MM/YYYY - HH24:MI:SS') CREATED, 
to_char(a.expiry_date, 'DD/MM/YYYY - HH24:MI:SS') EXPIRY_DATE, 
nvl (to_char(a.lock_date), 'SEM REGISTROS') lock_date, 
a.password_versions, a.default_tablespace, a.temporary_tablespace, a.user_id
from dba_users a
where a.username like upper('%&username%') order by 1;