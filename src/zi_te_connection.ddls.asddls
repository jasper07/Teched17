@AbapCatalog.sqlViewName: 'Zvi_Te_Connect'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Connections'
define view Zi_Te_Connection as select from spfli {
  key carrid as CarrierId, 
  key connid as ConnectionId, 
  
  countryfr as CountryFrom, 
  cityfrom  as CityFrom, 
  airpfrom as AirportFrom, 
  
  countryto as CountryTo, 
  cityto    as CityTo, 
  airpto    as AirportTo,  
  deptime   as DepartureTime, 
  arrtime   as ArrivalTime, 
  distid    as DistanceUnitId, 
  fltype    as FlightType, 
  period    as ArrivalsDays  
}