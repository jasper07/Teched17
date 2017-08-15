@AbapCatalog.sqlViewName: 'ZVc_Te_Agency'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Agency Consumption view'
 
@UI.headerInfo: {
        typeName: 'Agency',
        typeNamePlural: 'Agencies',
        imageUrl: 'IconUrl',
        title: {
            type: #STANDARD,
            label: 'Agency',
            iconUrl: 'IconUrl',
            value: 'AgencyName'
        }
}
define view Zc_Te_Agency as select from Zi_Te_Agency as Agency{
    key  AgencyNumber, 
    @UI.lineItem.position: 10
    AgencyName, 
    @UI.fieldGroup: [{qualifier: 'Stack',position:10}] 
    @UI.lineItem.position: 20
    City, 
    @UI.fieldGroup: [{qualifier: 'Stack',position:20}] 
    @UI.lineItem.position: 30
    Country, 
    @UI.fieldGroup: [{qualifier: 'Stack',position:30}] 
    @UI.lineItem.position: 40
    State,
    @UI.lineItem.position: 50
    'sap-icon://add-contact' as IconUrl
}