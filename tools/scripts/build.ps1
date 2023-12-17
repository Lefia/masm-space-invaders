$dependenciesFile = "dependencies.txt"
$masmPath   = "dependencies/MASM32"
$irvinePath = "dependencies/Irvine"
$toolsPath  = "tools"
$outputPath = "build"
$inputPath  = "src"

# If the build folder does not exists, then create a new one
New-Item -ItemType Directory -Path $outputPath -Force | Out-Null

# Compile asm files in src
$errorFlag = $false
Get-ChildItem -Path $inputPath -Filter *.asm | ForEach-Object {
    $outputFile = Join-Path $outputPath ($_.BaseName + ".obj")
    & "$toolsPath\bin\ml.exe" /c /coff /nologo /I"$masmPath\include" /I"$irvinePath" /Fo $outputFile $_.FullName

    if ($LASTEXITCODE -ne 0) {
        $errorFlag = $true
    }
}

if ($errorFlag -eq $true) {
    Write-Host "Error: Some files failed to compile." -ForegroundColor Red
    exit 1
}

# Get dependencies from text file
$libPaths = @()
foreach ($dependency in Get-Content $dependenciesFile) {
    $libPaths += Join-Path $masmPath\lib "$dependency.lib"
    
}

# Link obj files
& "$toolsPath\bin\link.exe" `
    /SUBSYSTEM:CONSOLE `
    /NOLOGO `
    /OUT:"$outputPath\main.exe" `
    "$irvinePath\Irvine32.lib" `
    @($libPaths) `
    "$outputPath\*.obj"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Linking failed." -ForegroundColor Red
    exit 1
}

Get-ChildItem -Path $outputPath -Filter *.obj | ForEach-Object { 
    Remove-Item $_.FullName -Force 
}

Copy-Item -Path "$PSScriptRoot/run.bat" -Destination "$outputPath" -Force

Write-Host "Build Successful!" -ForegroundColor Green