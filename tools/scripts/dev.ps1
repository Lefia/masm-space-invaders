$outputPath = "build"

& "$PSScriptRoot/build.ps1"
Start-Process wt -ArgumentList "--size 51,30 pwsh -Command chcp 437 && $outputPath\main.exe"