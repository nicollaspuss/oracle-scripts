col atributo format a30
col value format a30
select a.name atributo, b.name, a.value, a.GROUP_NUMBER from v$asm_attribute a, v$asm_diskgroup_stat b
where a.name like '%disk_repair_time%'
and a.GROUP_NUMBER=b.group_number;