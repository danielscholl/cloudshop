#Requires -RunAsAdministrator
Import-Module WebAdministration
$dbsource = "https://cloudcodeit.blob.core.windows.net/public/AdventureWorks2012.bak"
$dbdestination = "$PSScriptRoot\db\AdventureWorks2012.bak"


if (!(Test-Path $dbdestination)) { 
    Invoke-WebRequest $dbsource -OutFile $dbdestination
}

# Startup the Database
docker-compose -p CloudShop up --build -d

#Create and link the website
$SiteName = "CloudShop"
$HostName = "localhost"
$SiteFolder = Join-Path -Path $PSScriptRoot -ChildPath "web"

New-WebApplication -Name $SiteName -Site 'Default Web Site' -PhysicalPath $PSScriptRoot\web\ -ApplicationPool DefaultAppPool -Force

#Setup Proper Permissions for the Website
ICACLS $PSScriptRoot "/grant" "IIS AppPool\DefaultAppPool:M" "/t"

# Restore the Database
Start-Sleep -s 3  # Pause just to make sure the DB is online
docker exec -it cloudshop_db_1 /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P PasswordAzure@123 -i /var/opt/mssql/backup/restore.sql


Write-Host "http://localhost/cloudshop"