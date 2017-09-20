RESTORE DATABASE AdventureWorks2012  
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2012.bak'
WITH RECOVERY,  
MOVE 'AdventureWorks2012_Data' TO '/var/opt/mssql/data/AdventureWorks2012s_Data.mdf',   
MOVE 'AdventureWorks2012_Log' TO '/var/opt/mssql/log/AdventureWorks2012_Log.ldf'; 