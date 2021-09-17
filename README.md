## TOC
* [Setup SAP B1 Client](#setup-sap-b1-client)
  * [Install Microsoft ODBC Driver 13 for SQL Server](#install-microsoft-odbc-driver-13-for-sql-server)
  * [Install Install SAP B1 Client](#install-sap-b1-client)
  * [Launch sap b1 client appliction](#launch-sap-b1-client-appliction)
* [Setup SAP B1 Data Transfer Workbench](#setup-sap-b1-data-transfer-workbench)
* [Setup SAP B1 Server and MSSQL Server on GCE](#setup-sap-b1-server-and-mssql-server-on-gce)
* [Troubleshooting](#troubleshooting)


## Setup SAP B1 Client 
### Install Microsoft ODBC Driver 13 for SQL Server 
1. download [msodbcsql.msi](https://drive.google.com/file/d/1aaKjcsxlMgPjUMTmNnhMCvczeuN3sTZA/view?usp=sharing) from the cloud drive.

2. double-click the file `msodbcsql.msi` to launch the installation program.

3. follows the program instructions to complete the installation.

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow1.png" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow2.png" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow3.png" width="100" />

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow4.png" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/odoc_driver_setup_flow5.png" width="100" />


### Install SAP B1 Client 
1. download [B1_SHR.zip](https://drive.google.com/file/d/1AVRcRGTCOk-jzGeX_dU57dYC0th_rrnL/view?usp=sharing) from cloud drive. (the process would take some minutes) 

2. **connect to the private cloud `vpc-erp` through VPN**.  
   please check [HERE](https://github.com/MRLIVING/vpn) to setup a VPN if you have not done it before.  

3. right-click the file `B1_SHR.zip` and unzip it. (the process would take some minutes)
<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_unzip_package.png" width="100" />

4. looking for a file under `B1_SHR\B1_SHR\Client.x64\setup.exe` from the extracted package,   
   right-click `setup.exe` and select `Run as administrator`
<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_runasadmin.png" width="100" />

5. based on each step instructions to complete the installation.

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_flow1.png" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_flow2.png" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_flow3.PNG" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_flow4.PNG" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_flow5.PNG" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_flow6.PNG" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_setup_flow7.PNG" width="100" />


### Launch sap b1 client appliction  
1. double-click the client progrma icon
2. input the User ID and Password (ask info)
3. greate, you are ready to fly with SAP B1 Client

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_doubleclick.PNG" width="70" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_input_id_pw.PNG" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_welcome.PNG" width="100" />

* Unfortunately, if you get a warning message `"Fail to Connect System Landscape Directory"` before get into the client program.  
please check [Here](https://github.com/MRLIVING/sap-b1/issues/4) to solve this problem.

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_client_.FailtoConnectSLDPNG.PNG" width="100" />

## Setup SAP B1 Data Transfer Workbench
### Install Data Transfer Workbench
1. [Install Microsoft ODBC Driver 13 for SQL Server](#install-microsoft-odbc-driver-13-for-sql-server)

2. download [Data Transfer Workbench](https://drive.google.com/file/d/1Y8cPIpAEjGXDu4MYSX-6KLjlsjshIfQG/view?usp=sharing) from cloud drive.

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_dtw_setup_flow1.PNG" width="100" />

3. follows the program instructions to complete the installation.

<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_dtw_setup_flow2.PNG" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_dtw_setup_flow3.PNG" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_dtw_setup_flow4.PNG" width="100" /> <img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sapb1_dtw_setup_flow5.PNG" width="100" />

## Setup MSSQL Server on GCE
### Machine & OS
* Image selection - Operating system version
  * `Windows Server Datacenter 2019` (*Server with Desktop Experience, x64 built on 20200908, supports Shielded VM features*)  
* CPU/Memory
  * `2vCPU with 13GB memory` (e2-medium), at least.
* Disks
  * drive `C:` with `200 GB` capacity.
  * drive `D:` with `300 GB` capacity.

### Windows firewall configuration 
* [Ports Used By the Database Engine](https://docs.microsoft.com/en-us/sql/sql-server/install/configure-the-windows-firewall-to-allow-sql-server-access?view=sql-server-2016#BKMK_ssde)

## Setup SAP B1 Server on GCE
### Machine & OS
* Image selection - Operating system version
  * `Windows Server Datacenter 2019` (*Server with Desktop Experience, x64 built on 20200908, supports Shielded VM features*)
* CPU/Memory
  * `2vCPU with 13GB memory` (e2-medium), at least.  
* Disks
  * a single drive`C:` drive with `200 GB` capacity.
* Change Computer Name and Reboot
  * `sap-b1`

### GCE Name & Device Name
* **IMPORTANT**  
  The **instance GCE name** must be identical to the **OS Device name**; otherwise, it will fail to connect with the License Server.
  
  <img src="https://github.com/MRLIVING/sbo/blob/master/doc/img/sbo_setup_machineName.PNG" width="100" />

### Setup wizard
* SBO Components selection
  * Repository
  * Service Layer
  * Web Client
  * SLD, License Manager
  * Data Interface Server
  * Job Service
  * Data Interface API
  * SAP Business One Client
  * Browser Access Service
  * Solution Packager
  * Data Transfer WorkBench
  * Integration Solution Components

### [Cloud DNS](https://console.cloud.google.com/net-services/dns)
* we shoud use Domain name to specify server during installation steps.

### Windows firewall configuration 
* SAP-B1 server ports  
  see p.174, [Appendix 1: List of Default Ports for Different Server Components](https://drive.google.com/file/d/1CjoukIl53q7EyCqi2HxNedJ1ZQqScwxr/view?usp=sharing)

## SBO Service Layer
### Compoent Installation 
<img src="https://github.com/MRLIVING/sap-b1/blob/master/doc/img/sbo_service_layer_setup_wizard.PNG" width="100"/>

### Grant permission to Indirect Access user
* Administrator > System Initialization > Authorizations > General Authorizations

<img src="https://github.com/MRLIVING/sbo/blob/master/doc/img/sbo_auth_iau.PNG" width="100" />

### 
* Install [Monolog](https://github.com/Seldaek/monolog)  
  `composer require monolog/monolog`


## Troubleshooting 
* [Fail to Connect System Landscape Directory(SLD). Contact your system administrator](https://github.com/MRLIVING/sap-b1/issues/4)

* [Unable use RDP to connect the Windows system](https://github.com/MRLIVING/sbo/issues/21)

## Reference
* [GCE Troubleshooting RDP](https://cloud.google.com/compute/docs/troubleshooting/troubleshooting-rdp)
* [SAP Business One 10.0 CHT](https://help.sap.com/viewer/68a2e87fb29941b5bf959a184d9c6727/10.0/zh-TW)
* [Learn SAP Business One - Installing the Client on RDS/Workstation](https://www.youtube.com/watch?v=uRwZEFS74G8)
* [How to fix Network Discovery in Windows Server 2019](https://www.youtube.com/watch?v=TCU__saEr0w)
* [How to Create User-Defined Fields and Tables](https://help.sap.com/doc/e8d8abefb22343a586d744db9cba0bcb/9.3/en-US/How_to_Create_User_Defined_Fields_and_Tables.pdf)
* [UDF and UDT](https://help.sap.com/doc/saphelpiis_hc_b1_image_repository_consultant_training_basic_b1_90_tb1200_03_02_pdf/9.0/en-US/B1_90_TB1200_03_02.pdf)
* [List of object types](https://blogs.sap.com/2017/04/27/list-of-object-types/)

### Service Layer
* [Working with SAP Business One Service Layer, v1.19](https://drive.google.com/file/d/1zJrT66eANJBmXofoTzi0CidAAVDEDjMu/view?usp=sharing)
* [Service Layer 1/6: API](https://www.youtube.com/watch?v=zaF_i7x9-s0&list=PLMdHXbewhZ2QsgYSICRQuoL8lkoEHjNzS)                           
* [PHP Service Layer Example Part 1](https://www.syedhussim.com/sap-b1/php-service-layer-example-part-1.html)
* [SAP Business One Service Layer implementation using JavaScript](https://www.youtube.com/watch?app=desktop&v=ilDH8nhnp4o)
* [SAP Business One Service Layer – SQL Query](https://blogs.sap.com/2021/01/08/new-sap-business-one-service-layer-sql-query/)

### B1if
* [Part 1-Creating Web Services with B1if](https://www.youtube.com/watch?v=N9hLVwJDEz4)
* [Part 2-Creating Web Services with B1if](https://www.youtube.com/watch?v=UwNvElqVc6c)
* [Open SAP courses](https://open.sap.com/courses?q=Integration%20Framework)

### B1UP
* [B1 Usability Package](https://help.boyum-it.com/B1UP/index.html?b1usabilitypackage.html)
* [B1UP Tips and Tricks](https://boyum-it.com/b1up100/)
