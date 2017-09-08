# Teched17

Work in progress

![alt text](img/abapgit.png "ABAP Git")

To install the code onto your ABAP system you will need to use the [abapGit](https://github.com/larshp/abapGit) project by [@larshp](https://github.com/larshp).

1. Import CDS Objects

![alt text](img/clone_repo.png "Clone Repository")


![alt text](img/create_package.png "Create Package")

![alt text](img/transport.png "Assign Transport")

![alt text](img/activate_objects.png "Activate Objects")

Result

![alt text](img/package_contents.png "Package contents")

2. Maintain OData services

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

