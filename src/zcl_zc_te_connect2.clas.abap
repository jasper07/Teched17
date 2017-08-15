class ZCL_ZC_TE_CONNECT2 definition
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



CLASS ZCL_ZC_TE_CONNECT2 IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( `CDS~ZC_TE_CONNECT2` )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20170815223816.
  endmethod.
ENDCLASS.
