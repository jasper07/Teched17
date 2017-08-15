@AbapCatalog.sqlViewName: 'ZVI_Te_Airport'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Airport City'
define view Zi_Te_Airport as select from sairport  {
@UI.lineItem: {position:10}
  @UI.selectionField.exclude: true 
  key id as Airport,
  -- name as AirportName,
  @UI.selectionField.exclude: true    
  concat_with_Space( id, concat_with_Space( '-', substring(name, 1, 19), 1), 1) as AirportName
}