CLASS zcl_sma_first_programm_on_clou DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sma_first_programm_on_clou IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.

    response->set_text( |SAP SILA!!!!!| ).

  ENDMETHOD.
ENDCLASS.
