$properties= $("CONS", "TYPE", "Meilleur saison", "difficulté d'observation")
foreach($key in $properties){
    Import-Csv -Path .\LeCatalogueMessier.csv | $Data = Select-Object -Property $key -Unique 
    $key = $key.Normalize("FormD") -replace '\p{M}', ''
    Export-Csv $data -path .\$key.csv -NoTypeInformation -Encoding UTF8 -Force
}