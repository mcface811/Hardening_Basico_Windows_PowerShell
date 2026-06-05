Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
Set-NetFirewallProfile -Profile Domain,Public,Private -DefaultInboundAction Block
Set-NetFirewallProfile -Profile Domain,Public,Private -DefaultOutboundAction Allow
New-NetFirewallRule -DisplayName "Bloqueo SMB" -Direction Inbound -Protocol TCP -LocalPort 445 -Action Block
New-NetFirewallRule -DisplayName "Bloquear Ping" -Protocol ICMPv4 -IcmpType 8 -Direction Inbound -Action Block
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Enabled False
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled False
netsh wlan delete profile name="WiFi_Publico"
Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false
Set-NetFirewallProfile -Profile Domain,Public,Private -LogAllowed True -LogBlocked True -LogFileName 'C:\firewall.log'
Set-NetFirewallProfile -Profile Domain,Public,Private -LogMaxSizeKilobytes 4096
Get-NetFirewallRule
Get-NetTCPConnection
Get-NetTCPConnection -State Listen
ping google.com
netsh advfirewall export "C:\firewall_config.wfw"