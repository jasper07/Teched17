

:airplane: #  Show me the code

![alt text](img/ovp2.gif "ABAP Git")

![alt text](img/abapgit.png "ABAP Git")

To install the code onto your ABAP system you will need to use the [abapGit](https://github.com/larshp/abapGit) project by [@larshp](https://github.com/larshp).

Steps to Install
=========

* [Import CDS Objects with abapGit](#import-cds-objects-with-abapgit)
* [Create OData services and models](#create-odata-services-and-models)
* [Activate Services](#activate-services)
* [Import SAPUI5 Applications](#import-sapui5-applications)

Import CDS Objects with abapGit
=========

![alt text](img/clone_repo.png "Clone Repository")


![alt text](img/create_package.png "Create Package")

![alt text](img/transport.png "Assign Transport")

![alt text](img/activate_objects.png "Activate Objects")

Result

![alt text](img/package_contents.png "Package contents")

Create OData services and models
=========

Once all objects are activated you will need to maintain the MPC, DPC and Annotation locations. The below screenshot shows where to find this in the IMG.

![alt text](img/img_gw.png "IMG settings")

2 services 

Create Model
![alt text](img/create_model1.png "Create Model")

Create the corresponding Service and Assign the above Model to Service
![alt text](img/create_service1.png "Create Service")


Create the Annotation Model 
![alt text](img/create_anno1.png "Create Annotation Model")

And assign the Annotation Model to the service
![alt text](img/assign_anno_service1.png "Assign Annotation Model to service")

repeat the steps above for the OVP Service

Create Model
![alt text](img/create_model2.png "Create Model")

Create the corresponding Service and Assign the above Model to Service
![alt text](img/create_service2.png "Create Service")


Create the Annotation Model 
![alt text](img/create_anno2.png "Create Annotation Model")

And assign the Annotation Model to the service
![alt text](img/assign_anno_service2.png "Assign Annotation Model to service")

Activate Services
=========

![alt text](img/activate_service_img.jpg "locate Activate Service in IMG")

Select the "Add Selected Services" button, locate the 2 Services and press "Add Selected Services"

![alt text](img/add_selected_services.png "Add Selected Services")

Should see Service Creation successul
![alt text](img/add_selected_services2.png "Service Creation Log")

Confirm by finding Services in list of Active services
![alt text](img/add_selected_services3.png "Confirm in list of Active Services")

Import SAPUI5 applications
=========

download and extract the two SAPUI5 [ZFLIGHTLIST](https://github.com/jasper07/Teched17/blob/master/ZFLIGHTLIST.zip?raw=true) application zip file

call report /UI5/UI5_REPOSITORY_LOAD and upload from temporary folder
![alt text](img/zflightlist_upload.png "Create new SAPUI5 app")

Confirm and Upload
![alt text](img/zflightlist_upload2.png "Confirm and Upload")

repeat for [ZFLIGHTOVP](https://github.com/jasper07/Teched17/blob/master/ZFLIGHTOVP.zip?raw=true)

![alt text](img/zflightovp_upload.png "Create new SAPUI5 app")

![alt text](img/zflightovp_upload2.png "Confirm and upload")

locate and run the ZFLIGHOVP app

[http://server:port/sap/bc/ui5_ui5/sap/zflightovp/webapp/index.html?sap-client=001#Shell-home](http://vhcalnplci:8000/sap/bc/ui5_ui5/sap/zflightovp/webapp/index.html?sap-client=001#Shell-home)


![alt text](img/run_ovp_app.png "Confirm and upload")

## Enjoy 