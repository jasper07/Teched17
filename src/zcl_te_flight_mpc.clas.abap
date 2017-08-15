class ZCL_TE_FLIGHT_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
   TS_ZC_TE_BOOKINGSTYPE type ZVC_TE_BOOKINGS .
  types:
   TT_ZC_TE_BOOKINGSTYPE type standard table of TS_ZC_TE_BOOKINGSTYPE .
  types:
   TS_ZI_TE_CARRIERTYPE type ZVI_TE_CARRIER .
  types:
   TT_ZI_TE_CARRIERTYPE type standard table of TS_ZI_TE_CARRIERTYPE .
  types:
   TS_ZI_TE_CONNECTIONTYPE type ZVI_TE_CONNECT .
  types:
   TT_ZI_TE_CONNECTIONTYPE type standard table of TS_ZI_TE_CONNECTIONTYPE .
  types:
   TS_ZC_TE_FLIGHTTYPE type ZVC_TE_FLIGHT .
  types:
   TT_ZC_TE_FLIGHTTYPE type standard table of TS_ZC_TE_FLIGHTTYPE .
  types:
   TS_ZI_TE_AIRPORTTYPE type ZVI_TE_AIRPORT .
  types:
   TT_ZI_TE_AIRPORTTYPE type standard table of TS_ZI_TE_AIRPORTTYPE .

  constants GC_ZC_TE_BOOKINGSTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zc_Te_BookingsType' ##NO_TEXT.
  constants GC_ZC_TE_FLIGHTTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zc_Te_FlightType' ##NO_TEXT.
  constants GC_ZI_TE_AIRPORTTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zi_Te_AirportType' ##NO_TEXT.
  constants GC_ZI_TE_CARRIERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zi_Te_CarrierType' ##NO_TEXT.
  constants GC_ZI_TE_CONNECTIONTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zi_Te_ConnectionType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  constants GC_INCL_NAME type STRING value 'ZCL_TE_FLIGHT_MPC=============CP' ##NO_TEXT.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_TE_FLIGHT_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZTE_FLIGHT_SRV_01' ).

define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20170815175940'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20170815185940'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="ZC_TE_BOOKINGS" binding="ZC_TE_BOOKINGS" />|  &
               | <sadl:dataSource type="CDS" name="ZI_TE_CARRIER" binding="ZI_TE_CARRIER" />|  &
               | <sadl:dataSource type="CDS" name="ZI_TE_CONNECTION" binding="ZI_TE_CONNECTION" />|  &
               | <sadl:dataSource type="CDS" name="ZC_TE_FLIGHT" binding="ZC_TE_FLIGHT" />|  &
               | <sadl:dataSource type="CDS" name="ZI_TE_AIRPORT" binding="ZI_TE_AIRPORT" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="Zc_Te_Bookings" dataSource="ZC_TE_BOOKINGS" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY" >|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="Zi_Te_Carrier" dataSource="ZI_TE_CARRIER" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY" >|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="Zi_Te_Connection" dataSource="ZI_TE_CONNECTION" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY" >|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="Zc_Te_Flight" dataSource="ZC_TE_FLIGHT" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY" >|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_AIRPORTS" binding="_AIRPORTS" target="Zi_Te_Airport" cardinality="many" />|  &
               | <sadl:association name="TO_BOOKINGS" binding="_BOOKINGS" target="Zc_Te_Bookings" cardinality="many" />|  &
               | <sadl:association name="TO_CARRIER" binding="_CARRIER" target="Zi_Te_Carrier" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_CONNECTION" binding="_CONNECTION" target="Zi_Te_Connection" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="Zi_Te_Airport" dataSource="ZI_TE_AIRPORT" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY" >|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

    ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZTE_FLIGHT' )
                                                                     iv_timestamp = '20170815185940'
                                                                     iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
