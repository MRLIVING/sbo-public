# sap-b1

## GCE


## MSSQL
### Windows firewall configuration
* [Ports Used By the Database Engine](https://docs.microsoft.com/en-us/sql/sql-server/install/configure-the-windows-firewall-to-allow-sql-server-access?view=sql-server-2016#BKMK_ssde)

## Troubleshooting 
### [Check/Enable RDP connections through windows firewall](https://cloud.google.com/compute/docs/troubleshooting/troubleshooting-rdp#os_configuration)

* check windows firewall RDP status
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

## Reference
* [GCE Troubleshooting RDP](https://cloud.google.com/compute/docs/troubleshooting/troubleshooting-rdp)
