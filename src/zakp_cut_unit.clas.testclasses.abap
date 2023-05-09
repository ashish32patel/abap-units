*"* use this source file for your ABAP unit test classes
CLASS ltc_abap_unit_test DEFINITION
FOR TESTING
RISK LEVEL HARMLESS
DURATION SHORT
FINAL.

  PRIVATE SECTION.
    DATA o_cut TYPE REF TO zakp_cut_unit.

    "!static method, called ONCE before the first SETUP of the test class
    CLASS-METHODS class_setup.

    "! instance method, called before each test method
    METHODS setup.

    "! instance method, called after each test method
    METHODS teardown.

    "! static method, called ONCE after the last TEARDOWN of the test class.
    CLASS-METHODS class_teardown.


    METHODS iseven_positive_1 FOR TESTING.
    METHODS iseven_negative_1 FOR TESTING.
    METHODS isinitial for testing.


ENDCLASS.

CLASS ltc_abap_unit_test IMPLEMENTATION.

  METHOD setup.
    o_cut = NEW zakp_cut_unit( ).
    cl_abap_unit_assert=>assert_bound( o_cut ).
  ENDMETHOD.

  METHOD iseven_positive_1.
    DATA(num) = 12.

    DATA(isEven) = o_cut->iseven( num ).

    cl_abap_unit_assert=>assert_equals(
      act = isEven
      exp = abap_true
    ).

  ENDMETHOD.


  METHOD iseven_negative_1.
    DATA(num) = 7.

    DATA(isEven) = o_cut->iseven( num ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = isEven
        exp = abap_false
    ).

  ENDMETHOD.
  METHOD isinitial.
    DATA(ls_test) = VALUE zakp_cut_unit=>ty_test(  ).

    data(ls_actual) = o_cut->returninput( ls_test ).

*    cl_abap_unit_assert=>assert_not_initial(
*      EXPORTING
*        act              = ls_actual
*        msg              = 'blank structure expected'
*
*    ).

    cl_abap_unit_assert=>assert_initial(
        act              = ls_actual
        msg              = 'blank structure expected'
    ).
  ENDMETHOD.

  METHOD teardown.

  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.


ENDCLASS.
