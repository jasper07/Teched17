
# :airplane: Demo Code

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

Go into ZABAPGIT and clone this repo
![alt text](img/clone_repo.png "Clone Repository")

Create a package for the code

![alt text](img/create_package.png "Create Package")

Assign a transport

![alt text](img/transport.png "Assign Transport")

Activate the ABAP Objects
![alt text](img/activate_objects.png "Activate Objects")

At the end of importing your package should look like
![alt text](img/package_contents.png "Package contents")

Create OData services and models
=========

Once all objects are activated you will need to maintain the MPC, DPC and Annotation locations. The below screenshot shows where to find this in the IMG.

![alt text](img/img_gw.png "IMG settings")

 

Create Model ZTE_FLIGHT_MDL
![alt text](img/create_model1.png "Create Model")

Create the corresponding Service  ZTE_FLIGHT_SRV and Assign the above Model to Service
![alt text](img/create_service1.png "Create Service")

Create the Annotation Model ZTE_FLIGHTOVP_ANNO_MDL
![alt text](img/create_anno1.png "Create Annotation Model")

And assign the Annotation Model  ZTE_FLIGHTOVP_ANNO_MDL to the ZTE_FLIGHT_SRV service

![alt text](img/assign_anno_service1.PNG "Assign Annotation Model to service")

Repeat the same steps above for the OVP Service

Create Model ZTE_FLIGHTOVP_MDL

![alt text](img/create_model2.png "Create Model")

Create the corresponding Service ZTE_FLIGHTOVP_SRV and Assign the above Model ZTE_FLIGHTOVP_MDL to Service

![alt text](img/create_service2.png "Create Service")


Create the Annotation Model ZTE_FLIGHTOVP_ANNO_MDL and assign to the service ZTE_FLIGHTOVP_SRV

![alt text](img/assign_anno_service2.PNG "Assign Annotation Model to service")

Activate Services
=========

Find the "Activate and Maintain Services" entry in the IMG

![alt text](img/activate_service_img.jpg "locate Activate Service in IMG")

Select the "Add Selected Services" button, locate the 2 "ZTE_FLIGHT*" Services and press "Add Selected Services"

![alt text](img/add_selected_services.png "Add Selected Services")

Should see Service Creation in the log
![alt text](img/add_selected_services2.png "Service Creation Log")

Confirm by finding Services in list "Service Catalog" list
![alt text](img/add_selected_services3.png "Confirm in list of Active Services")

Import SAPUI5 applications
=========

Download and extract the SAPUI5  zipfile [ZFLIGHTLIST](https://github.com/jasper07/Teched17/blob/master/ZFLIGHTLIST.zip?raw=true) to a tmp directory

call report /UI5/UI5_REPOSITORY_LOAD in SE38 and upload from tmp directory
![alt text](img/zflightlist_upload.PNG "Create new SAPUI5 app")

Confirm and Upload
![alt text](img/zflightlist_upload2.PNG "Confirm and Upload")

repeat for the [ZFLIGHTOVP](https://github.com/jasper07/Teched17/blob/master/ZFLIGHTOVP.zip?raw=true)
application
![alt text](img/zflightovp_upload.PNG "Create new SAPUI5 app") 

Confirm and Upload
![alt text](img/zflightovp_upload2.PNG "Confirm and upload")

now locate and run the ZFLIGHOVP app, should be somewhere like
http://server:port/sap/bc/ui5_ui5/sap/zflightovp/webapp/index.html?sap-client=001

![alt text](img/run_ovp_app.PNG "Confirm and upload")

## Enjoy :smiley: :airplane: