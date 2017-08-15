class ZCL_TE_FLIGHT_MPC_EXT definition
  public
  inheriting from ZCL_TE_FLIGHT_MPC
  create public .

public section.
  methods DEFINE
    redefinition.
protected section.
private section.
  methods CREATE_ANNOTATION
    importing
      value(IV_ENTITY_TYPE) type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      value(IV_PROPERTY) type /IWBEP/MED_EXTERNAL_NAME
    returning
      value(RO_ANNOTATION) type ref to /IWBEP/IF_MGW_ODATA_ANNOTATION .
  methods ADD_TEXT_PROPERTY
    importing
      !IV_ENTITY_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_PROPERTY type /IWBEP/MED_EXTERNAL_NAME
      !IV_TEXT_PROPERTY type /IWBEP/MED_EXTERNAL_NAME .
  methods ADD_MULTI_VALUE_FILTER
    importing
      !IV_ENTITY_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_PROPERTY type /IWBEP/MED_EXTERNAL_NAME .
  methods ADD_INTERVAL_FILTER
    importing
      !IV_ENTITY_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_PROPERTY type /IWBEP/MED_EXTERNAL_NAME .
  methods ADD_DATE_DISPLAY_FORMAT
    importing
      !IV_ENTITY_TYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME
      !IV_PROPERTY type /IWBEP/MED_EXTERNAL_NAME .
ENDCLASS.



CLASS ZCL_TE_FLIGHT_MPC_EXT IMPLEMENTATION.


    METHOD add_date_display_format.
    create_annotation( iv_entity_type = iv_entity_type iv_property = iv_property )->add(
    iv_key   = /iwbep/if_ana_odata_types=>gcs_ana_odata_annotation_key-display_format
    iv_value = /iwbep/if_ana_odata_types=>gcs_ana_odata_annotation_value-common-date
  ).
  ENDMETHOD.


  METHOD add_interval_filter.
    create_annotation( iv_entity_type = iv_entity_type iv_property = iv_property )->add( iv_key   = /iwbep/if_ana_odata_types=>gcs_ana_odata_annotation_key-filter_restriction
                                                                                         iv_value = /iwbep/if_ana_odata_types=>gcs_ana_odata_annotation_value-filter-interval ).
  ENDMETHOD.


  METHOD add_multi_value_filter.
    create_annotation( iv_entity_type = iv_entity_type iv_property = iv_property )->add( iv_key   = /iwbep/if_ana_odata_types=>gcs_ana_odata_annotation_key-filter_restriction
                                                                                         iv_value = /iwbep/if_ana_odata_types=>gcs_ana_odata_annotation_value-filter-multi_value ).
  ENDMETHOD.


  METHOD add_text_property.
    create_annotation( iv_entity_type = iv_entity_type iv_property = iv_property )->add(
          iv_key   = 'text'                                 "#EC NOTEXT
          iv_value = |{ iv_text_property }| ).
  ENDMETHOD.


  METHOD create_annotation.
    ro_annotation = model->get_entity_type( |{ iv_entity_type }| )->get_property( |{ iv_property }| )->/iwbep/if_mgw_odata_annotatabl~create_annotation(
      iv_annotation_namespace = /iwbep/if_mgw_med_odata_types=>gc_sap_namespace ).
  ENDMETHOD.


  method DEFINE.
    super->define( ).

    "set flight date as an interval
    add_interval_filter( EXPORTING iv_entity_type = gc_zc_te_flighttype iv_property = 'FlightDate' ).

    "set carrier as a multi select static value list
    add_multi_value_filter( EXPORTING iv_entity_type = gc_zc_te_flighttype iv_property  = 'CarrierId' ).
    model->get_entity_type( gc_zc_te_flighttype )->get_property( 'CarrierId' )->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    add_text_property( EXPORTING iv_entity_type = gc_zc_te_flighttype iv_property = 'CarrierId'  iv_text_property = 'to_Carrier/Name' ).

    add_text_property( EXPORTING iv_entity_type = gc_zi_te_carriertype iv_property = 'CarrierId'  iv_text_property = 'Name' ).

    add_multi_value_filter( EXPORTING iv_entity_type = gc_zc_te_flighttype iv_property  = 'AirportFrom' ).
    model->get_entity_type( gc_zc_te_flighttype )->get_property( 'AirportFrom' )->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    add_text_property( EXPORTING iv_entity_type = gc_zc_te_flighttype iv_property = 'AirportFrom'  iv_text_property = 'to_Airports/AirportName' ).

    add_multi_value_filter( EXPORTING iv_entity_type = gc_zc_te_flighttype iv_property  = 'AirportTo' ).
    model->get_entity_type( gc_zc_te_flighttype )->get_property( 'AirportTo' )->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    add_text_property( EXPORTING iv_entity_type = gc_zc_te_flighttype iv_property = 'AirportTo'  iv_text_property = 'to_Airports/AirportName' ).

    add_text_property( EXPORTING iv_entity_type = gc_zi_te_airporttype iv_property = 'Airport'  iv_text_property = 'AirportName' ).
  endmethod.
ENDCLASS.
