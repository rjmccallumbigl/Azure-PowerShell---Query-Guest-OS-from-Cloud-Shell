# Get the current Windows build from the guest OS
"(Get-WmiObject Win32_OperatingSystem).Caption" >> getBuild.ps1

$result = invoke-azvmruncommand -resourcegroupname 2019vmRG -name 2019vm -CommandId 'RunPowerShellScript' -ScriptPath 'getBuild.ps1'

$result.Value[0].Message # Returns 'Microsoft Windows Server 2019 Datacenter' for my VM

Get-WMIObject Win32_ComputerSystem| Select-Object -ExpandProperty Domain

# Get the current domain from the guest OS
"Get-WMIObject Win32_ComputerSystem| Select-Object -ExpandProperty Domain" >> getDomain.ps1

$result2 = Invoke-AzVMRunCommand -ResourceGroupName 2019vmRG -name 2019vm -CommandId 'RunPowerShellScript' -ScriptPath 'getDomain.ps1'

$result2.Value[0].Message # Returns 'WORKGROUP' for my VM as I'm not joined to a domain
