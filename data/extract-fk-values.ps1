####################################
# Project: TPI
# Title: extract-fk-values
# Author: Nithujan Jegatheeswaran
# Version: 17.05.22
####################################

Push-Location $PSScriptRoot 

$properties= $("CONS", "TYPE", "Meilleur saison", "difficulté d'observation")
foreach($key in $properties){
        # Normalization is especially useful for accented character
        $normalized_key = $key.Normalize("FormD") -replace '\p{M}', ''
        Import-Csv -Path .\csv\LeCatalogueMessier.csv | Select-Object -Property $key -Unique | Export-Csv -path .\csv\$normalized_key.csv -Force -NoTypeInformation -Encoding UTF8
    }

Pop-Location