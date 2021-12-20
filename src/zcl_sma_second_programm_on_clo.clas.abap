CLASS zcl_sma_second_programm_on_clo DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_sma_second_programm_on_clo IMPLEMENTATION.

  METHOD if_http_service_extension~handle_request.
    DATA(lt_para) = request->get_form_fields( ).
    READ TABLE lt_para REFERENCE INTO DATA(lr_para) WITH KEY name = 'input'.
    IF sy-subrc = 0.
      CASE lr_para->value.
        WHEN '1'.
          response->set_text( |Hello, Welcom to Cloud| ).
        WHEN 'consume'.
          response->set_text( NEW zap_cl_api_hub_main(  )->get_country_details(  ) ).
        WHEN 'hello'.
          response->set_text( | Executed by {
          cl_abap_context_info=>get_user_technical_name( ) } { cl_abap_context_info=>get_system_date( )
          DATE = ENVIRONMENT }| ).
        WHEN OTHERS.

          response->set_status( i_code = 400 i_reason = 'Wrong value passed' ).
      ENDCASE.
    ELSE.
      response->set_text( |error| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.

*
*CLASS zcl_sma_second_programm_on_clo IMPLEMENTATION.
*
*
*  METHOD if_http_service_extension~handle_request.
*
*    DATA(lt_para) = request->get_form_fields(  ).
*    READ TABLE lt_para REFERENCE INTO DATA(lr_para) WITH KEY name = 'i'.
*    IF sy-subrc = 0.
*
*      CASE lr_para->value.
*
*        WHEN 'SlavaUkraini'.
*          response->set_text( |Geroyam Slava| ).
*        WHEN 'Ukraina'.
*          response->set_text( |Ponad Use| ).
*        WHEN 'system'.
*          response->set_text( | Executed by {
*                                cl_abap_context_info=>get_user_technical_name( ) } | && | {
*                                cl_abap_context_info=>get_system_date(  ) DATE = ENVIRONMENT } | ).
*
*        WHEN 'consume'.
*        TRY.
*            response->set_text( NEW zcl_sma_api_hub_main( )->get_country_details( ) ).
*          CATCH cx_web_message_error.
*            "handle exception
*        ENDTRY.
*
*
*        WHEN OTHERS.
*          response->set_status( i_code = 400 i_reason = 'Wrong value passed' ).
*
*      ENDCASE.
*    ELSE.
*      response->set_status( i_code = 400 i_reason = 'INVALID PARAMETER' ).
*
*    ENDIF.
*
*  ENDMETHOD.
*ENDCLASS.
