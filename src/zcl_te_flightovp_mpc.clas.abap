class ZCL_TE_FLIGHTOVP_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
    begin of TS_ZC_TE_ABOOKINGTYPE.
      include type ZVC_TE_ABOOKINGS.
  types:
      generated_id type string,
    end of TS_ZC_TE_ABOOKINGTYPE .
  types:
   TT_ZC_TE_ABOOKINGTYPE type standard table of TS_ZC_TE_ABOOKINGTYPE .
  types:
   TS_ZC_TE_AGENCYTYPE type ZVC_TE_AGENCY .
  types:
   TT_ZC_TE_AGENCYTYPE type standard table of TS_ZC_TE_AGENCYTYPE .
  types:
   TS_ZC_TE_FLIGHT_FILTERTYPE type ZVC_TE_FFILTER .
  types:
   TT_ZC_TE_FLIGHT_FILTERTYPE type standard table of TS_ZC_TE_FLIGHT_FILTERTYPE .
  types:
   TS_ZI_TE_AIRPORTTYPE type ZVI_TE_AIRPORT .
  types:
   TT_ZI_TE_AIRPORTTYPE type standard table of TS_ZI_TE_AIRPORTTYPE .
  types:
   TS_ZI_TE_CARRIERTYPE type ZVI_TE_CARRIER .
  types:
   TT_ZI_TE_CARRIERTYPE type standard table of TS_ZI_TE_CARRIERTYPE .
  types:
   TS_ZI_TE_CONNECTIONTYPE type ZVI_TE_CONNECT .
  types:
   TT_ZI_TE_CONNECTIONTYPE type standard table of TS_ZI_TE_CONNECTIONTYPE .

  constants GC_ZC_TE_ABOOKINGTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zc_Te_AbookingType' ##NO_TEXT.
  constants GC_ZC_TE_AGENCYTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zc_Te_AgencyType' ##NO_TEXT.
  constants GC_ZC_TE_FLIGHT_FILTERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zc_Te_Flight_FilterType' ##NO_TEXT.
  constants GC_ZI_TE_AIRPORTTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zi_Te_AirportType' ##NO_TEXT.
  constants GC_ZI_TE_CARRIERTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zi_Te_CarrierType' ##NO_TEXT.
  constants GC_ZI_TE_CONNECTIONTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'Zi_Te_ConnectionType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  constants GC_INCL_NAME type STRING value 'ZCL_TE_FLIGHTOVP_MPC==========CP' ##NO_TEXT.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_TE_FLIGHTOVP_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZTE_FLIGHTOVP_SRV' ).

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


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20170815133924'.                  "#EC NOTEXT
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
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20170815143925'.
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
               | <sadl:dataSource type="CDS" name="ZC_TE_ABOOKING" binding="ZC_TE_ABOOKING" />|  &
               | <sadl:dataSource type="CDS" name="ZC_TE_AGENCY" binding="ZC_TE_AGENCY" />|  &
               | <sadl:dataSource type="CDS" name="ZC_TE_FLIGHT_FILTER" binding="ZC_TE_FLIGHT_FILTER" />|  &
               | <sadl:dataSource type="CDS" name="ZI_TE_AIRPORT" binding="ZI_TE_AIRPORT" />|  &
               | <sadl:dataSource type="CDS" name="ZI_TE_CARRIER" binding="ZI_TE_CARRIER" />|  &
               | <sadl:dataSource type="CDS" name="ZI_TE_CONNECTION" binding="ZI_TE_CONNECTION" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="Zc_Te_Abooking" dataSource="ZC_TE_ABOOKING" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY" >|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_AGENCY" binding="_AGENCY" target="Zc_Te_Agency" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_CONNECTION" binding="_CONNECTION" target="Zi_Te_Connection" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="Zc_Te_Agency" dataSource="ZC_TE_AGENCY" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY" >|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="Zc_Te_Flight_Filter" dataSource="ZC_TE_FLIGHT_FILTER" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY" >|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_AIRPORTS" binding="_AIRPORTS" target="Zi_Te_Airport" cardinality="many" />|  &
               | <sadl:association name="TO_CARRIER" binding="_CARRIER" target="Zi_Te_Carrier" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="Zi_Te_Airport" dataSource="ZI_TE_AIRPORT" maxEditMode="RO" exposure="TRUE" >|  &
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
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

    ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZTE_FLIGHTOVP' )
                                                                     iv_timestamp = '20170815143925'
                                                                     iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
