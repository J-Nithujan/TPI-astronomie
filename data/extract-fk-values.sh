$properties= $("CONS", "TYPE", "Meilleur saison", "difficulté d'observation")
foreach($key in $properties){
    Import-Csv -Path .\LeCatalogueMessier.csv | Select-Object -Property $key -Unique | Export-Csv -path .\$key.csv -NoTypeInformation -Encoding UTF8 -Force
}