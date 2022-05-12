####################################
# Project: TPI
# Title: get-pictures-csv
# Author: Nithujan Jegatheeswaran
# Version: 12.05.22
####################################

Push-Location $PSScriptRoot

# Get wanted content
cd .\downthemall
Get-ChildItem .\ | sort CreationTime | where { $_.Name -inotmatch '\S[0-9]+x[0-9]+\S' -and $_ -match '\S[0-9]+\S' } | Set-Variable 'list'

# Copy file from /data to the directory used by the website
$destination = 'C:\TPI\astronomy_app\app\static\assets\'
foreach($item in $list) { Copy-Item $item -Destination $destination -Force}

# CSV file creation
New-Item "C:\TPI\data\csv\pictures.csv" -Force
$outfile = "C:\TPI\data\csv\pictures.csv"

# write data in CSV 
'M,PICTURE' | Out-File $outfile -Encoding utf8
$i = 1
foreach($item in $list) { 
    'M'+$i+',assets/'+$item.Name | Out-File $outfile -Encoding utf8 -Append
    $i++
}

Pop-Location