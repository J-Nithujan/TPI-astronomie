Split-Path $script:MyInvocation.MyCommand.Path | cd
cd .\downthemall

Get-ChildItem -Filter *140px-*.jpg | Sort CreationTime | ForEach-Object {$i=1} { 
        Rename-Item $_ -NewName M$i.jpg -WhatIf
        $i++
    } 