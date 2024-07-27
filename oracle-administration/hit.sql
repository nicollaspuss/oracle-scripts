SELECT cur.inst_id, 
        ROUND((1-(phy.value / (cur.value + con.value)))*100,4) "Cache Hit Ratio"
      FROM gv$sysstat cur inner join gv$sysstat con on cur.inst_id=con.inst_id
         inner join gv$sysstat phy on phy.inst_id = cur.inst_id
     WHERE cur.name = 'db block gets'
       AND con.name = 'consistent gets'
       AND phy.name = 'physical reads';