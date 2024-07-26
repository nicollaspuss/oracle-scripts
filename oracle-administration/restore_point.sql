-- Validate restore points:
select * from v$restore_point;

-- Removing restore points:
-- drop restore point NAME_RESTOREPOINT;

-- Creating a new restore point:
-- create restore point NAME_RESTOREPOINT guarantee flashback database;