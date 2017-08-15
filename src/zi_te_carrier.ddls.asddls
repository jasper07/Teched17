@AbapCatalog.sqlViewName: 'Zvi_Te_Carrier'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Carrier'
@Search.searchable: true
define view Zi_Te_Carrier as select from scarr {
   key carrid as CarrierId, 
   @Search.defaultSearchElement: true
   --carrname as Name, 
   concat_with_Space( carrid, concat_with_Space( '-', substring(carrname, 1, 19), 1), 1) as Name,
   currcode as currencyCode, 
   url,
   replace('https://www.airport-la.com/img/airline_img/XX.gif', 'XX', carrid ) as logo  
}