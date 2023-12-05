$masmPath   = "C:\masm32"
$irvinePath = "C:\irvine"
$outputPath = "build"
$inputPath  = "src" 

New-Item -ItemType Directory -Path $outputPath -Force | Out-Null

$errorFlag = $false
Get-ChildItem -Path $inputPath -Filter *.asm | ForEach-Object {
    $outputFile = Join-Path $outputPath ($_.BaseName + ".obj")
    & "$masmPath\bin\ml.exe" /c /coff /nologo /Fo $outputFile $_.FullName

    if ($LASTEXITCODE -ne 0) {
        $errorFlag = $true
    }
}

if ($errorFlag -eq $true) {
    Write-Host "Error: Some files failed to compile." -ForegroundColor Red
    exit 1
}

& "$masmPath\bin\link.exe" `
    /SUBSYSTEM:CONSOLE `
    /OUT:"$outputPath\main.exe" `
    /NOLOGO `
    "$irvinePath\Irvine32.lib" `
    "$masmPath\lib\kernel32.lib" `
    "$masmPath\lib\user32.lib" `
    "$outputPath\*.obj"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Linking failed." -ForegroundColor Red
    exit 1
}

Write-Host "Success: Build completed" -ForegroundColor Green

Start-Process "$outputPath\main.exe"