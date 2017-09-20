#Requires -RunAsAdministrator
Import-Module WebAdministration

# Shutdown the Database
docker-compose -p CloudShop kill
docker-compose -p CloudShop rm -f

# Destroy the WebSite


$PSScriptRoot = "C:\Users\degno\source\cloudshop"
$SiteName = "CloudShop"
$HostName = "localhost"
$SiteFolder = Join-Path -Path $PSScriptRoot -ChildPath "web"

Remove-WebApplication -Name $SiteName -Site 'Default Web Site'
