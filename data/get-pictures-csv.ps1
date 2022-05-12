####################################
# Project: TPI
# Title: get-pictures-csv
# Author: Nithujan Jegatheeswaran
# Version: 12.05.22
####################################

# Get wanted content
cd C:\TPI\data\downthemall
Get-ChildItem .\ | sort CreationTime | where { $_ -inotmatch '\S[0-9]*x[0-9]*\S' -and $_ -match '\S[0-9]+\S' } | Set-Variable 'list'

# Copy file from /data to the directory used by the website
$destination = 'C:\TPI\astronomy_app\app\static\assets\'
foreach($item in $list) { Copy-Item $item -Destination $destination -Force}

# CSV file creation
New-Item "C:\TPI\data\pictures.csv" -Force
$outfile = "C:\TPI\data\pictures.csv"

# write data in CSV 
"PICTURE" >> $outfile
foreach($item in $list) { echo 'assets/'$item.Name >> $outfile }