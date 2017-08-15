@AbapCatalog.sqlViewName: 'ZVc_Te_ABookings'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@Search.searchable : true
@EndUserText.label: 'Analytics on Booking'

@UI.chart: [{
        qualifier: 'Donut',
        title: '',
        description: '',
        chartType: #DONUT,
        dimensions:  [ 'CarrierName' ] ,
        measures:  [ 'NumberOfItems' ] 
},
{
        qualifier: 'Area',
        title: '',
        description: '',
        chartType: #AREA_STACKED,
        dimensions:  [ 'CarrierName' ] ,
        measures:  [ 'Amount' ] 
}]
    

define view Zc_Te_Abooking as select from Zi_Te_Bookings as book
 association [1] to Zc_Te_Agency as _Agency on $projection.AgencyNumber = _Agency.AgencyNumber 
 association [1] to Zi_Te_Carrier as _Carrier on $projection.CarrierId =  _Carrier.CarrierId   
 association [1] to Zi_Te_Connection as _Connection on $projection.CarrierId =  _Connection.CarrierId 
                                                   and $projection.ConnectionId = _Connection.ConnectionId 
{
    @Search.defaultSearchElement: true
    book.CarrierId,
    book.ConnectionId,
    @UI.lineItem: [{position:10,qualifier:'Carrier', importance:#HIGH}]
    _Carrier.Name as CarrierName,   
     
    book.FlightDate, 
    book.BookId, 
    @Semantics.currencyCode: true
    cast( 'USD' as abap.cuky ) as Currency,
    @UI.lineItem: [{position:20,qualifier:'Carrier', importance:#HIGH, type: #AS_DATAPOINT }, {position:20,qualifier:'Agency', importance:#HIGH, type: #AS_DATAPOINT }]
    @DefaultAggregation: #SUM
    @Semantics.amount.currencyCode: 'Currency'
    @UI.dataPoint:{description: 'Amount', valueFormat:{scaleFactor:1000,numberOfFractionalDigits:1}}
    //      CURRENCY_CONVERSION(
//          amount             => book.LocalCurrencyAmount,
//          source_currency    => book.LocalCurrencyCode,
//          target_currency    => cast( 'USD' as abap.cuky ),
//          exchange_rate_date => cast( '20160101' as abap.dats ),
//          error_handling     => 'SET_TO_NULL' )          as Amount, 
    book.LocalCurrencyAmount as Amount,
    book.AgencyNumber,
    @UI.lineItem: [{position:10,qualifier:'Agency', importance:#HIGH}]
    coalesce( _Agency.AgencyName, 'Internet Booking' ) as AgencyName,
    @DefaultAggregation: #COUNT

        
    cast(0 as abap.int4) as NumberOfItems,
    _Connection.AirportFrom,
    _Connection.AirportTo, 
    _Connection,
    _Agency 
}