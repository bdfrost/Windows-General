import-module ActiveDirectory

$Computers = Get-ADComputer -Filter {OperatingSystem -Like "Windows Server*"} | Select-Object -ExpandProperty Name

Invoke-Command -ComputerName $Computers -ScriptBlock {

    $Packages = choco list -lo -r  | % {($_.split("|"))[0]}

    foreach ($Package in $Packages) {

        choco upgrade $Package -y | Out-File -FilePath "c:\Windows\Temp\choco-$Package.txt"

        if ($LASTEXITCODE -ne '0') {

           $Results = [PSCustomObject]@{

                ComputerName = $Env:COMPUTERNAME

                Package = $Package

            }

            $Results

        }

    }

}  | Select-Object ComputerName,Package | Sort-Object -Property ComputerName