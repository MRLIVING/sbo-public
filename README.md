# sap-b1

## Troubleshooting 
### Check/Enable windows firewall has RDP Connections

* check Windows firewall RDP status
```
netsh advfirewall firewall show rule name="Remote Desktop - User Mode (TCP-In)
```

* chinese version
```
netsh advfirewall firewall set rule group="遠端桌面" new enable=Yes
```

* english version
```
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes
```
