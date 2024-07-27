SELECT name, position, datatype_string,
value_string
FROM gv$sql_bind_capture 
WHERE sql_id like upper('%&sql_id%') order by 2;