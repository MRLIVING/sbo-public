# sap-b1

## Troubleshooting 
### Enable Windows firewall has RDP Connections
```
netsh advfirewall firewall set rule group="遠端桌面" new enable=Yes
```
```
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes
```

* check Windows firewall RDP status
```
netsh advfirewall firewall show rule name="Remote Desktop - User Mode (TCP-In)
```
