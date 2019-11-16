# update server time to be set by vmware tools

import-module ActiveDirectory

$Computers = Get-ADComputer -Filter {
    OperatingSystem -Like "Windows Server*" -and Name -NotLike "EDGE*"
} | Select-Object -ExpandProperty Name

Invoke-Command -ComputerName $Computers -ScriptBlock { "C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe timesync start"}