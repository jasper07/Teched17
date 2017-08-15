CLASS zcl_te_flightovp_mpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_te_flightovp_mpc
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS define
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS create_annotation
      IMPORTING
        VALUE(iv_entity_type) TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
        VALUE(iv_property)    TYPE /iwbep/med_external_name
      RETURNING
        VALUE(ro_annotation)  TYPE REF TO /iwbep/if_mgw_odata_annotation .
    METHODS add_text_property
      IMPORTING
        !iv_entity_type   TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
        !iv_property      TYPE /iwbep/med_external_name
        !iv_text_property TYPE /iwbep/med_external_name .
    METHODS add_multi_value_filter
      IMPORTING
        !iv_entity_type TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
        !iv_property    TYPE /iwbep/med_external_name .
    METHODS add_interval_filter
      IMPORTING
        !iv_entity_type TYPE /iwbep/if_mgw_med_odata_types=>ty_e_med_entity_name
        !iv_property    TYPE /iwbep/med_external_name .

ENDCLASS.



CLASS ZCL_TE_FLIGHTOVP_MPC_EXT IMPLEMENTATION.


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


  METHOD define.


    super->define( ).

    add_interval_filter( EXPORTING iv_entity_type = gc_zc_te_flight_filtertype iv_property = 'FlightDate' ).
    add_multi_value_filter( EXPORTING iv_entity_type = gc_zc_te_flight_filtertype iv_property  = 'CarrierId' ).
    model->get_entity_type( gc_zc_te_flight_filtertype )->get_property( 'CarrierId' )->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    " add_text_property( EXPORTING iv_entity_type = gc_zc_te_flight_filtertype iv_property = 'CarrierId'  iv_text_property = 'to_Carrier/Name' ).

    add_text_property( EXPORTING iv_entity_type = gc_zi_te_carriertype iv_property = 'CarrierId'  iv_text_property = 'Name' ).


    add_multi_value_filter( EXPORTING iv_entity_type = gc_zc_te_flight_filtertype iv_property  = 'AirportFrom' ).
    model->get_entity_type( gc_zc_te_flight_filtertype )->get_property( 'AirportFrom' )->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    add_text_property( EXPORTING iv_entity_type = gc_zc_te_flight_filtertype iv_property = 'AirportFrom'  iv_text_property = 'to_Airports/AirportName' ).

    add_multi_value_filter( EXPORTING iv_entity_type = gc_zc_te_flight_filtertype iv_property  = 'AirportTo' ).
    model->get_entity_type( gc_zc_te_flight_filtertype )->get_property( 'AirportTo' )->set_value_list( /iwbep/if_mgw_odata_property=>gcs_value_list_type_property-fixed_values ).
    add_text_property( EXPORTING iv_entity_type = gc_zc_te_flight_filtertype iv_property = 'AirportTo'  iv_text_property = 'to_Airports/AirportName' ).



    add_text_property( EXPORTING iv_entity_type = gc_zi_te_airporttype iv_property = 'Airport'  iv_text_property = 'AirportName' ).


  ENDMETHOD.
ENDCLASS.
