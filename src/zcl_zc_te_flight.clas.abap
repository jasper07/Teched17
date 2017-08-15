class ZCL_ZC_TE_FLIGHT definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZC_TE_FLIGHT IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( `CDS~ZC_TE_FLIGHT` )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20170815231356.
  endmethod.
ENDCLASS.
