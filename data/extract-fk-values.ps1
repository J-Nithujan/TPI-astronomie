####################################
# Project: TPI
# Title: extract-fk-values
# Author: Nithujan Jegatheeswaran
# Version: 12.05.22
####################################

Push-Location $PSScriptRoot 

$properties= $("CONS", "TYPE", "Meilleur saison", "difficulté d'observation")
foreach($key in $properties){
        #$key = $key.Normalize("FormD") -replace '\p{M}', ''
        Import-Csv -Path .\csv\LeCatalogueMessier.csv | Select-Object -Property $key -Unique | Export-Csv -path .\csv\$key.csv -Force -NoTypeInformation -Encoding UTF8
    }

Pop-Location