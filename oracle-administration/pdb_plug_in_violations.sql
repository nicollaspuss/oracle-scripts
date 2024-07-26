col time format a35
col name format a50
col status format a20
col cause format a30
col message format a150
select time,name,cause,status,message from PDB_PLUG_IN_VIOLATIONS order by name;