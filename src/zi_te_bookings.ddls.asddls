@AbapCatalog.sqlViewName: 'ZVi_Te_Bookings'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bookings'
define view Zi_Te_Bookings as select from sbook {
 key carrid  as CarrierId, 
 key connid  as ConnectionId, 
 key fldate  as FlightDate, 
 key bookid  as BookId, 
  customid   as CustomerId, 
  custtype   as CustomerType, 
  smoker     as Smoker, 
  luggweight as LuggageWeight, 
  wunit      as WeightUnit, 
  invoice    as InvoiceId, 
  class      as Class, 
  
  @Semantics.amount.currencyCode: 'ForeignCurrencyCode'
  forcuram   as ForeignCurrencyAmount, 
  forcurkey  as ForeignCurrencyCode , 
  @Semantics.amount.currencyCode: 'LocalCurrencyCode'
  loccuram   as LocalCurrencyAmount, 
  loccurkey  as LocalCurrencyCode ,
  order_date as OrderDate, 
  counter    as Counter, 
  agencynum  as AgencyNumber, 
  cancelled  as Cancelled, 
  reserved   as Reserved, 
  passname, 
  passform, 
  passbirth
}