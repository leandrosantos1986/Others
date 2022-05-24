$data = Get-Date -uformat “%Y%m%d-%H%M”    
$sisbei_bakfile = "E:\BKPSQL_AZURE\SISBEI_$($data).bak"  #SISBEI Database Backup File
$unear_bakfile = "E:\BKPSQL_AZURE\UNEARBEICONTACTS_$($data).bak"  #Unear Bei Contacts Database Backup File
$reportserver_bakfile = "E:\BKPSQL_AZURE\REPORTSERVER_$($data).bak"  #Report Server Database Backup File
$reportservertemp_bakfile = "E:\BKPSQL_AZURE\REPORTSERVER_TEMPDB_$($data).bak"  #Report Server Temp DB Database Backup File



sqlcmd -S DC1-BEI00-AS-01 -Q "BACKUP DATABASE SISBEI TO DISK = N'$sisbei_bakfile'"
sqlcmd -S DC1-BEI00-AS-01 -Q "BACKUP DATABASE UNEARBEICONTACTS TO DISK = N'$unear_bakfile'"
sqlcmd -S DC1-BEI00-AS-01 -Q "BACKUP DATABASE REPORTSERVER TO DISK = N'$reportserver_bakfile'"
sqlcmd -S DC1-BEI00-AS-01 -Q "BACKUP DATABASE REPORTSERVERTEMPDB TO DISK = N'$reportservertemp_bakfile'"