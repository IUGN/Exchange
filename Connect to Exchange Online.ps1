$ExchOnlineCred = Get-Credential
$ExchOnlineSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $ExchOnlineCred -Authentication Basic –AllowRedirection
Import-PSSession $ExchOnlineSession