@AbapCatalog.sqlViewName: 'ZVI_Te_Flight'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flights'
define view Zi_Te_Flight as select from sflight
    association [1]    to Zi_Te_Carrier       as _Carrier on $projection.CarrierId =  _Carrier.CarrierId                                                    
    association [1]    to Zi_Te_Connection    as _Connection on $projection.CarrierId =  _Connection.CarrierId 
                                                         and $projection.ConnectionId = _Connection.ConnectionId                                                                                                        
{
 key carrid as CarrierId, 
 key connid as ConnectionId, 
 key fldate as FlightDate, 
 
  price, 
  currency as currencyCode,  
  planetype, 
  seatsmax, 
  seatsocc, 
  paymentsum, 
  seatsmax_b, 
  seatsocc_b, 
  seatsmax_f, 
  seatsocc_f,
  _Carrier,
  _Connection
}