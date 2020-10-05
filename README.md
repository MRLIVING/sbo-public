# sap-b1

## GCE
### Image selection
* Operating system
  * `Windows Server`
* Version 
  * `Windows Server Datacenter 2019` (*Server with Desktop Experience, x64 built on 20200908, supports Shielded VM features*)

### CPU/Memory

### Disks
#### MSSQL
* drive `C:` with `200 GB` capacity.
* drive `D:` with `300 GB` capacity.

#### SAP-B1
* a single drive`C:` drive with `200 GB` capacity.

#### [Cloud DNS](https://console.cloud.google.com/net-services/dns)
* we shoud use Domain name to specify server during installation steps.

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
* [SAP Business One 10.0 CHT](https://help.sap.com/viewer/68a2e87fb29941b5bf959a184d9c6727/10.0/zh-TW)
* [Learn SAP Business One - Installing the Client on RDS/Workstation](https://www.youtube.com/watch?v=uRwZEFS74G8)
* [How to fix Network Discovery in Windows Server 2019](https://www.youtube.com/watch?v=TCU__saEr0w)
