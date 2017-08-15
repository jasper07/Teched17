@AbapCatalog.sqlViewName: 'ZVc_Te_Bookings'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookings consumption view'

@UI.headerInfo: { 
  --title: { value: 'CarrierName' },
  typeName: 'Booking',
  typeNamePlural: 'Bookings'
 }

@UI.chart: [{
        description: 'My Chart',
        qualifier: 'CHART',
        title: 'Smart Chart',
        chartType: #COLUMN,
        dimensions:  ['OrderDate'] ,
        measures:  ['LocalCurrencyAmount'] 
}]
    

define view Zc_Te_Bookings as select from Zi_Te_Bookings as book
{
   key book.CarrierId, 
   key book.ConnectionId, 
   key book.FlightDate, 
   key book.BookId, 
    @UI.lineItem: { label: 'BookId', position: 10, importance: #HIGH }
    book.CustomerId, 
    book.CustomerType, 
    book.Smoker,
    @UI.lineItem: { label: 'Luggage Weight', position: 50, importance: #HIGH } 
    book.LuggageWeight, 
    book.WeightUnit, 
    book.InvoiceId, 
    book.Class, 
    book.ForeignCurrencyAmount, 
    book.ForeignCurrencyCode, 
    @UI.lineItem: { label: 'Amount', position: 50, importance: #HIGH } 
    book.LocalCurrencyAmount, 
    book.LocalCurrencyCode, 
    @UI.lineItem: { label: 'Order Date', position: 30, importance: #HIGH }
    book.OrderDate, 
    book.Counter, 
    book.AgencyNumber, 
    book.Cancelled, 
    book.Reserved,
    @UI.lineItem: { label: 'Passenger Name', position: 20, importance: #HIGH }  
    book.passname, 
    book.passform, 
    book.passbirth
}

