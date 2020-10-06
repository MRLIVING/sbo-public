# sap-b1

## SAP B1 Client setup
### Install Microsoft ODBC Driver 13 for SQL Server 
1. download [msodbcsql.msi](https://drive.google.com/file/d/1aaKjcsxlMgPjUMTmNnhMCvczeuN3sTZA/view?usp=sharing) from the cloud drive.

2. double-click the file `msodbcsql.msi` to launch the installation program.

3. follows the program instructions to complete the installation.

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow1.png" width="200" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow2.png" width="200" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow3.png" width="200" />

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow4.png" width="200" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow5.png" width="200" />


### Install sap b1 client 
1. connect to the private cloud `vpc-erp` through VPN.  
   please check [HERE](https://github.com/MRLIVING/vpn) to setup a VPN if you did not do it before.  

2. download [B1_SHR.zip](https://drive.google.com/file/d/1AVRcRGTCOk-jzGeX_dU57dYC0th_rrnL/view?usp=sharing) from cloud drive. (the process would take some minutes) 

3. right-click the file `B1_SHR.zip` and unzip it. (the process would take some minutes)
<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_unzip_package.png" width="200" />

4. 
<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_runasadmin.png" width="200" />





## SAP B1 and related servers on GCE
### Image selection
* Operating system version
  * `Windows Server Datacenter 2019` (*Server with Desktop Experience, x64 built on 20200908, supports Shielded VM features*)

### CPU/Memory
* `2vCPU with 4GB memory` (e2-medium), at least.

### Disks
#### MSSQL
* drive `C:` with `200 GB` capacity.
* drive `D:` with `300 GB` capacity.

#### SAP-B1 server
* a single drive`C:` drive with `200 GB` capacity.

#### [Cloud DNS](https://console.cloud.google.com/net-services/dns)
* we shoud use Domain name to specify server during installation steps.

### Windows firewall configuration 
#### MSSQL
* [Ports Used By the Database Engine](https://docs.microsoft.com/en-us/sql/sql-server/install/configure-the-windows-firewall-to-allow-sql-server-access?view=sql-server-2016#BKMK_ssde)

#### SAP-B1 server

## Troubleshooting 
### []


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
