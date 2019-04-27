#server list

import-module ActiveDirectory

Get-ADComputer -Filter {OperatingSystem -Like "Windows Server*"} | Select-Object -ExpandProperty Name