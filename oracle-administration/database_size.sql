select to_char(sum(round(b.BYTES/1048576/1024, 2) - round(c.BYTES/1048576/1024 ,2))) as gb
  from dba_tablespaces a, (select tablespace_name,sum(bytes) as "BYTES" from dba_data_files
  group by tablespace_name ) b,
  (select tablespace_name,sum(bytes) as "BYTES" from dba_free_space
  group by tablespace_name) c
  where
  a.tablespace_name = b.tablespace_name(+)
  and b.tablespace_name = c.tablespace_name(+)
  and a.tablespace_name not in (select tablespace_name from V$TEMP_SPACE_HEADER);