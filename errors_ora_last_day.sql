-- Errors ORA-% - Last day:
select to_char (ORIGINATING_TIMESTAMP, 'DD-MM-YYYY HH24:MI') data, 
 message_text
 from x$dbgalertext
 where ORIGINATING_TIMESTAMP > (SYSDATE -1)
 and message_text like '%ORA-%';
