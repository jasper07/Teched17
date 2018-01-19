
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

Create Model **ZTE\_FLIGHT\_MDL** with Model Provider Class **ZCL\_TE\_FLIGHT\_MPC_EXT**
and Description **Model for Flight CDS**

![alt text](img/create_model1.png "Create Model")

Create the corresponding Service **ZTE\_FLIGHT\_SRV** with the Description **Service for Flight CDS** and Data Provider Class **ZCL\_TE\_FLIGHT\_DPC\_EXT**. Then assign the above Model to Service.

![alt text](img/create_service1.png "Create Service")

Create the Annotation Model **ZTE\_FLIGHT\_ANNO\_MDL** based on the Annotation Model Provider Class **CL\_SADL\_GW\_CDS\_EXPOSURE\_APC** with the description **Annotation for Flight CDS**

![alt text](img/create_anno1a.png "Create Annotation Model")

And assign the Annotation Model **ZTE\_FLIGHT\_ANNO\_MDL** to the **ZTE\_FLIGHT\_SRV** service

![alt text](img/assign_anno_service1.PNG "Assign Annotation Model to service")

Repeat the same steps above for the OVP Service

Create Model ZTE\_FLIGHTOVP\_MDL with Model Provider Class **ZCL\_TE\_FLIGHTOVP\_MPC\_EXT**
and Description **Model for Flight OVP Service**

![alt text](img/create_model2.png "Create Model")

Create the corresponding Service **ZTE\_FLIGHTOVP\_SRV** with the Description **Service for Flight OVP CDS** and Data Provider Class **ZCL\_TE\_FLIGHTOVP\_DPC\_EXT**. Then assign the above Model **ZTE\_FLIGHTOVP\_MDL** to Service.

![alt text](img/create_service2.png "Create Service")

Create the Annotation Model **ZTE\_FLIGHTOVP\_ANNO\_MDL**  based on the Annotation Model Provider Class **CL\_SADL\_GW\_CDS\_EXPOSURE\_APC** with the description **Annotation for Flight OVP** and assign to the service **ZTE\_FLIGHTOVP\_SRV**

![alt text](img/assign_anno_service2.PNG "Assign Annotation Model to service")

Activate Services
=========

Find the "Activate and Maintain Services" entry in the IMG

![alt text](img/activate_service_img.jpg "locate Activate Service in IMG")

Select the "Add Selected Services" button, locate the 2 "ZTE\_FLIGHT*" Services and press "Add Selected Services"

![alt text](img/add_selected_services.png "Add Selected Services")

Should see Service Creation in the log
![alt text](img/add_selected_services2.png "Service Creation Log")

Confirm by finding Services in list "Service Catalog" list
![alt text](img/add_selected_services3.png "Confirm in list of Active Services")

Import SAPUI5 applications
=========

The two SAPUI5 applications are zipped up and need to be imported manually
![alt text](img/zipfiles.png "Location of the SAPUI5 apps")

Download and extract the SAPUI5 zipfile [ZFLIGHTLIST](https://github.com/jasper07/Teched17/blob/master/ZFLIGHTLIST.zip?raw=true) to a tmp directory

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

Lastly you may need to create data for the Flight Data Model

Goto Transaction SE38 and run SAPBC_DATA_GENERATOR

## Enjoy :smiley: :airplane: