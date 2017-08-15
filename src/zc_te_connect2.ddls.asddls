@AbapCatalog.sqlViewName: 'zvc_te_connect2'
@EndUserText.label: 'Connection'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@OData.publish: true

@UI.headerInfo:{ 
  typeName: 'Connection',
  typeNamePlural: 'Connections', 
  typeImageUrl: 'ImageUrl'
 -- title:  { type: #STANDARD, value: 'ConnectionID' },
 -- description: { type: #WITH_URL, value: 'CountryOfDeparture', url: 'https://sap.com/bilder/bildchen.img' }
}


@UI.chart: [
  { 
    title: 'ConnectionChart',
    description: 'Chart for Connections TEST',
    chartType: #COLUMN,
    dimensions:  [ '_FromAirport._City.MasterCity', '_ToAirport.AirportName' ] ,
    measures:  [ 'CountryOfDeparture', 'CityOfDeparture' ] 
  }, 
  {  
    qualifier: 'City',
    title: 'CityChart',
    description: 'Chart for Cities',
    chartType: #AREA,
    dimensions:  [ 'AIRLINE', 'ConnectionID' ] ,
    measures:  [ '_FromAirport._City.Airport', '_ToAirport._City.Airport' ] 
  }, 
  {  
    qualifier: 'InvalidChart',
    title: 'Should not be displayed',
    description: 'Should not be displayed',
    chartType: #AREA,
    dimensions:  [ 'AIRLINE', 'ConnectionID' ] ,
    measures:  [ '_FromAirport._City.Airport', '_InvalidAssoc.Property' ] 
  }
]

define view zc_te_connect2 as select from spfli
association [1..1] to SADL_V_ExpVoc_Airline as _Airline on $projection.Airline = _Airline.Code
association [1..1] to SADL_V_ExpVoc_Airport as _FromAirport on $projection.AirportOfDeparture = _FromAirport.Airport
association [1..1] to SADL_V_ExpVoc_Airport as _ToAirport on $projection.DestinationAirport = _ToAirport.Airport
association [0..*] to SADL_V_ExpVoc_Airport as _Airports on ( $projection.AirportOfDeparture = _Airports.Airport or $projection.DestinationAirport = _Airports.Airport ) 
{
  @UI.identification: { position: '10', exclude }
  @UI.statusInfo: { position: '10', exclude }
  @EndUserText.label: 'FallbackTest'
  @UI.lineItem: [{ position:10},{position:10,qualifier:'ValueList'}] // used in default line item as well as in value helps
  @UI.selectionField.position:10
  --@Semantics.name.givenName
  key carrid as Airline,
  
  @UI.identification: [{ label: 'Connection', importance: #HIGH, position: 20 }]
  @UI.statusInfo: [{ label: 'Connection', importance: #HIGH, position: 20 }]
  
  @UI.lineItem: [{position:20},{position:20,qualifier:'ValueList'}]
  @UI.selectionField.position:40
  @UI.multiLineText: true
  @UI.hidden: true
  --@Semantics.name.additionalName
  key connid as ConnectionID,
  
  @UI.identification: { label: 'Country Of Departure', position: '15.75', exclude: false }
  @UI.statusInfo: { label: 'Country Of Departure',  position: '15.75', exclude: false }
  @UI.lineItem: {position:30,importance:#LOW} // used only in default line item with low importance
  @UI.fieldGroup:[{qualifier:'from',groupLabel:'From',position:30}]
  @UI.selectionField.position:20
  @UI.hidden: true
  @UI.dataPoint:{description: 'Datapoint Test (Country)', 
                 valueFormat: {scaleFactor:1000,numberOfFractionalDigits:1}, 
                 criticalityCalculation: { toleranceRangeHighValueElement: 'ConnectionID', toleranceRangeLowValueElement: 'Airline'}
                }
  spfli.countryfr as CountryOfDeparture,
  
  @UI.lineItem.position:40 // used only in default line item
  @UI.fieldGroup:[{qualifier:'from',position:20}]
  @UI.selectionField.position:30
  @UI.dataPoint:{description: 'Datapoint Test', longDescription: 'Datapoint Test with a lot of additional Text', valueFormat:{scaleFactor:1000,numberOfFractionalDigits:1}}
  cityfrom   as CityOfDeparture,
  
  @UI.lineItem: [{position:50},{position:50,qualifier:'ValueList'}]
  @UI.fieldGroup:[{qualifier:'from',position:10}]
  @UI.masked: true
  --@Semantics.address.type: [#WORK, #PREF]
  --@Semantics.address.city: true
  airpfrom   as AirportOfDeparture,
  
  @UI.lineItem: {position:60,importance:#LOW}
  @UI.fieldGroup:[{qualifier:'to',groupLabel:'To', position:30}]
 -- @Semantics.telephone.type: [#CELL]
  spfli.countryto,  //  as DestinationCountry,
  
  @UI.lineItem: {position:40,qualifier:'ValueList'} // used only in value helps, between ConnectionID and AirportOfDeparture
  @UI.fieldGroup:[{qualifier:'to',position:20}]
 -- @Semantics.address.city: true
  --@Semantics.address.street: true
  --@Semantics.address.country: true
 -- @Semantics.telephone.type: [#FAX]
  cityto     as DestinationCity,
  
  @UI.lineItem: [{position:80},{position:80,qualifier:'ValueList'}]
  @UI.fieldGroup:[{qualifier:'to',position:10}]
  --@Semantics.telephone.type: [#WORK, #PREF]
  airpto     as DestinationAirport,
  
 // @UI.lineItem:[{value:'_Airline.CurrencyCode',importance:#LOW},{value:'_Airline.Name'}]
  @UI.identification: [{ position: '10', label: 'ToAirlines', value: '_Airline.CurrencyCode'}, { position: '20', label: 'AlsoToAirlines', value: '_Airline.Name' }]
  @UI.statusInfo: [{ position: '10', label: 'ToAirlines', value: '_Airline.CurrencyCode'}, { position: '20', label: 'AlsoToAirlines', value: '_Airline.Name' }] 
  @UI.selectionField:[{position:80, element:'.Name'},{position:70, element:'_Airline.Code'}]
  _Airline,
  
  //@UI.lineItem:[{value:'_FromAirport.AirportName',importance:#LOW},{value:'_FromAirport._City.MasterCity'}]
  // @UI.identification: [{ position: '100', label: 'FromAirport', value:'_FromAirport.AirportName' }, { position: '200', label: 'AlsoFromAirport', value:'_FromAirport._City.MasterCity' }]
 // @UI.statusInfo: [{ position: '100', label: 'FromAirport', value:'_FromAirport.AirportName' }, { position: '200', label: 'AlsoFromAirport', value:'_FromAirport._City.MasterCity' }]  
  _FromAirport,
 
  
  @UI.lineItem:[{value:'_ToAirport.AirportName',importance:#LOW},{value:'_ToAirport.AirportName', qualifier: 'ValueList'}]
  @UI.identification: [{ position: '100', label: 'ToAirport', value:'_ToAirport.AirportName' }] 
  @UI.statusInfo: [{ position: '100', label: 'ToAirport', value:'_ToAirport.AirportName' }] 
  _ToAirport,
  
  _Airports
}