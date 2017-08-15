@AbapCatalog.sqlViewName: 'Zvi_Te_Agency'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Agency'
define view Zi_Te_Agency as select from stravelag {
    key agencynum as AgencyNumber,
    name as AgencyName,
    city as City,
    country as Country,
    region as State
}