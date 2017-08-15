@AbapCatalog.sqlViewName: 'ZVc_Te_FFilter'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@Search.searchable : true
@EndUserText.label: 'Filter for OVP'
define view Zc_Te_Flight_Filter as select from Zi_Te_Flight  
association [0..*] to Zi_Te_Airport as _Airports on ( $projection.AirportFrom = _Airports.Airport or $projection.AirportTo = _Airports.Airport ) 
{
    @Search.defaultSearchElement: true
    @UI.selectionField.position: 10
    @UI.lineItem: [{ position:10},{position:10,qualifier:'Tab1'}]
    @Consumption.valueHelp: '_Carrier'
    key CarrierId, 
    @Search.defaultSearchElement: true
    @UI.selectionField.position: 20
    @UI.lineItem: [{ position:10},{position:10,qualifier:'Tab1'}]
    key ConnectionId,
    @Search.defaultSearchElement: true
    @UI.selectionField.position: 30
    @UI.lineItem: [{ position:10},{position:10,qualifier:'Tab1'}]
    key FlightDate,
    @Search.defaultSearchElement: true
    @UI.selectionField.position: 40
    @UI.lineItem: [{ position:10},{position:10,qualifier:'Tab1'}]
    @Consumption.valueHelp: '_Airports'
    _Connection.AirportFrom as AirportFrom,
    @Search.defaultSearchElement: true
    @UI.selectionField.position: 50
    @UI.lineItem: [{ position:10},{position:10,qualifier:'Tab1'}]
    @Consumption.valueHelp: '_Airports'
    _Connection.AirportTo as AirportTo,
    _Carrier,
    _Airports
      
}