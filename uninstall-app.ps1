#uninstall - generate computernames.txt with domain-server-list.ps1

Invoke-Command -Credential domain\user -ComputerName (Get-Content .\computernames.txt) -ScriptBlock {Get-CimInstance -ClassName Win32_Product -Filter "name like '%UrBackup%'" | Invoke-CimMethod -MethodName Uninstall}

