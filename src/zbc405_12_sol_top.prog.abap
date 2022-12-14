*&---------------------------------------------------------------------*
*&  Include           ZBC405_12_SOL_TOP
*&---------------------------------------------------------------------*

DATA gs_flights TYPE dv_flights.
SELECTION-SCREEN BEGIN OF SCREEN 1100 AS SUBSCREEN.
SELECTION-SCREEN BEGIN OF BLOCK b1.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT (60) gv_text.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN SKIP 1.
SELECT-OPTIONS so_car FOR gs_flights-carrid MEMORY ID car.
SELECT-OPTIONS so_con FOR gs_flights-connid.
SELECTION-SCREEN PUSHBUTTON /30(20) gv_butt USER-COMMAND fc_button.
SELECT-OPTIONS so_citfr FOR gs_flights-cityfrom  MODIF ID aus.
SELECT-OPTIONS so_citto FOR gs_flights-cityto MODIF ID aus.
SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN END OF SCREEN 1100.

SELECTION-SCREEN BEGIN OF SCREEN 1200 AS SUBSCREEN.
SELECT-OPTIONS so_fld FOR gs_flights-fldate NO-EXTENSION.
SELECTION-SCREEN END OF SCREEN 1200.

SELECTION-SCREEN BEGIN OF SCREEN 1300 AS SUBSCREEN.
SELECTION-SCREEN BEGIN OF BLOCK radio WITH FRAME.
PARAMETERS: pa_all RADIOBUTTON GROUP grp,
            pa_aus RADIOBUTTON GROUP grp,
            pa_inl RADIOBUTTON GROUP grp.
SELECTION-SCREEN SKIP 1.
PARAMETERS pa_land TYPE dv_flights-countryfr.
SELECTION-SCREEN END OF BLOCK radio.
SELECTION-SCREEN END OF SCREEN 1300.

SELECTION-SCREEN BEGIN OF SCREEN 1400 AS SUBSCREEN.
SELECTION-SCREEN BEGIN OF BLOCK ausgabe WITH FRAME.
PARAMETERS: pa_write RADIOBUTTON GROUP gr2,
            pa_alv   RADIOBUTTON GROUP gr2.
PARAMETERS  pa_liste AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK ausgabe.
SELECTION-SCREEN END OF SCREEN 1400.


DATA gv_where_klausel TYPE string.
DATA gv_count TYPE i.

DATA go_alv TYPE REF TO cl_salv_table.
DATA go_func TYPE REF TO cl_salv_functions.
DATA gt_flights TYPE TABLE OF dv_flights.


SELECTION-SCREEN BEGIN OF TABBED BLOCK tabstrip FOR 10 LINES.
SELECTION-SCREEN TAB (20) tab1 USER-COMMAND fc_tab1 DEFAULT SCREEN 1100.
SELECTION-SCREEN TAB (20) tab2 USER-COMMAND fc_tab2 DEFAULT SCREEN 1200.
SELECTION-SCREEN TAB (20) tab3 USER-COMMAND fc_tab3 DEFAULT SCREEN 1300.
SELECTION-SCREEN TAB (20) tab4 USER-COMMAND fc_tab4 DEFAULT SCREEN 1400.
SELECTION-SCREEN END OF BLOCK tabstrip.
