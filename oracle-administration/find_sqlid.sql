set long 50000
SELECT SQL_ID,SQL_FULLTEXT FROM V$SQLAREA WHERE PLAN_HASH_VALUE='&plan_hash_value';