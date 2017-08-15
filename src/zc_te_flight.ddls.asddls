@AbapCatalog.sqlViewName: 'ZVc_Te_Flight'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight consumption view'
@OData.publish: true 
@Search.searchable : true

@UI.headerInfo: { 
  title: { value: 'CarrierName'  },
  typeName: 'Flight',
  typeNamePlural: 'Flights', 
  imageUrl: 'logo' 
 }  

define view Zc_Te_Flight as select from Zi_Te_Flight 
    association [0..*]  to Zc_Te_Bookings as _Bookings on $projection.CarrierId =  _Bookings.CarrierId 
                                                      and $projection.ConnectionId = _Bookings.ConnectionId    
                                                      and $projection.FlightDate = _Bookings.FlightDate 
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
    @UI.fieldGroup:[{qualifier:'DateTime',groupLabel:'Date',position:10}]
    key FlightDate,

    @Search.defaultSearchElement: true
    @UI.identification.position: 10
    @UI.selectionField.exclude: true
    _Carrier.Name as CarrierName, 
    @UI.lineItem: { label: 'Carrier', position: 10, importance: #HIGH }                                                                                                     
    _Carrier.logo as logo,
    @UI.fieldGroup:[{qualifier:'Additional',groupLabel:'Additional Info',position:10}]
    price,
    @UI.fieldGroup:[{qualifier:'Additional',groupLabel:'Additional Info',position:20}] 
    paymentsum, 
    currencyCode,   
    @UI.lineItem: { label: 'Aircraft', position: 70, importance: #HIGH }
    @UI.identification.position: 20
    planetype, 
    seatsmax,  
    @EndUserText.label: 'Seats'
    seatsocc, 
    seatsmax_b, 
    @EndUserText.label: 'Seats'
    seatsocc_b, 
    seatsmax_f, 
    @EndUserText.label: 'Seats'
    seatsocc_f,
    
    @Search.defaultSearchElement: true
    @UI.selectionField.position: 40
    @UI.lineItem: [{ position:10},{position:10,qualifier:'Tab1'}]
    @Consumption.valueHelp: '_Airports'
     @UI.dataPoint: { title: 'Airport From'}
    @UI.identification.position: 40
    _Connection.AirportFrom as AirportFrom,
    @Search.defaultSearchElement: true
    @UI.selectionField.position: 50
    @UI.lineItem: [{ position:10},{position:10,qualifier:'Tab1'}]
    @Consumption.valueHelp: '_Airports'
    @UI.dataPoint: { title: 'Airport To'}
    @UI.identification.position: 50 
    _Connection.AirportTo as AirportTo,
    
    _Connection.CityFrom as CityFrom,
    _Connection.CityTo as CityTo, 

    replace(concat(concat(_Connection.DepartureTime, 'XXX'), _Connection.ArrivalTime),  'XXX' ,'-') as TimeFromTo, 
    replace(concat(concat(_Connection.AirportFrom, 'XXX'), _Connection.AirportTo),  'XXX' ,'->')  as AirportFromTo,  
    
     @UI.lineItem:[{value:'_Bookings.CustomerId',importance:#LOW},{value:'_Bookings.CustomerType', qualifier: 'ValueList'}]
    _Bookings,
    _Carrier,
    @UI.fieldGroup:[{qualifier:'DateTime',groupLabel:'Date',position:20, value:'_Connection.DepartureTime'}, 
                   {qualifier:'DateTime',groupLabel:'Date',position:30, value:'_Connection.ArrivalTime'},
                   {qualifier:'Additional',groupLabel:'Additional Info',position:30, value:'_Connection.CityFrom' },
                   {qualifier:'Additional',groupLabel:'Additional Info',position:40, value:'_Connection.CityTo' }]
    _Connection,
    @UI.selectionField: [{ exclude: true, element: '_Airports.Airport'},{ exclude: true, element: '_Airports.AirportName'}]
    _Airports
}