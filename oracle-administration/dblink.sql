col "owner" format a30
col "db_link" format a50
col "username" format a30
col "host" format a170
select substr(owner,1,15) owner, substr(db_link,1,40) db_link ,substr(username,1,80) username ,substr(host,1,60) host from dba_db_links order by owner;
select owner, db_link, username, host from dba_db_links order by owner, db_link;