$thumbprint = Get-ChildItem "Cert:\LocalMachine\My" | %{ $_.Thumbprint }
$cert_setting_path = Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices
$result = Set-WmiInstance -Path $cert_setting_path -argument @{SSLCertificateSHA1Hash="$thumbprint"}
if ($result -ne $null) {
  Write-Host("Updated your RDP cert~")
}

cmd /c 'pause'
