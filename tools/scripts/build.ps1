$dependenciesFile = "dependencies.txt"
$masmPath   = "dependencies/MASM32"
$irvinePath = "dependencies/Irvine"
$toolsPath  = "tools"
$outputPath = "build"
$inputPath  = "src"

# If main.exe is running, then stop the process
if (Get-Process -name main -ErrorAction SilentlyContinue) {
    Stop-Process -name main -Force
}

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

Write-Host "Build Successful!" -ForegroundColor Green

Start-Process wt -ArgumentList "--size 51,30 pwsh -Command chcp 437 && $outputPath\main.exe"