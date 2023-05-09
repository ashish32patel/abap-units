CLASS zakp_cut_unit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_test,
             fld1 TYPE char10,
             fld2 TYPE char20,
           END OF ty_test.

    METHODS isEven
      IMPORTING i        TYPE i
      RETURNING VALUE(r) TYPE abap_boolean.

    METHODS returnInput
      IMPORTING s        TYPE ty_test
      RETURNING VALUE(r) TYPE ty_test.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zakp_cut_unit IMPLEMENTATION.


  METHOD iseven.
    IF i MOD 2 = 0.
      r = abap_true.
    ELSE.
      r = abap_false.
    ENDIF.

  ENDMETHOD.
  METHOD returninput.
    r = s.
  ENDMETHOD.

ENDCLASS.
