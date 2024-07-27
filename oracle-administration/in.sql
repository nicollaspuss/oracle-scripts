COLUMN seg_inmem_size FORMAT 99,999,990.9 HEADING 'In-Memory|SIZE_MB'
COLUMN seg_orig_size_megs FORMAT 99,999,990.9 HEADING  'ORIGINAL|SIZE_MB'
COLUMN seg_megs_not_populated FORMAT 99,999,990.9 HEADING 'NOT  POPULATE|SIZE_MB'
COLUMN TOTAL_USADO FORMAT 99,999,990.9 HEADING 'In-Memory|SIZE_MB'
COLUMN DISPONIVEL  FORMAT 99,999,990.9 HEADING 'Available|SIZE_MB'
COLUMN populate_status HEADING 'POPULATE|STATUS'

      SELECT v.owner
         ,v.segment_name
         ,v.populate_status
          ,v.inmemory_size/1024/1024  seg_inmem_size
         ,v.bytes/(1024*1024)  seg_orig_size_megs
          ,v.bytes_not_populated/(1024*1024)  seg_megs_not_populated
         ,v.inmemory_priority
        ,v.inmemory_compression
  FROM v$im_segments v ;
  
select sum(v.inmemory_size) /1024/1024 as TOTAL_USADO, 
       (max((select value from v$parameter where name = 'inmemory_size')) - sum(v.inmemory_size) ) /1024/1024 as DISPONIVEL
	FROM v$im_segments v ;

select * from v$inmemory_area;


prompt dicas
prompt http://www.oracle.com/technetwork/pt/articles/database-performance/oracle-database-in-memory-part2-2595874-ptb.html
prompt 1965343.1 nota sobre o inmemory advisor
