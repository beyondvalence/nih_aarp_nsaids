/******************************/
/** NSAIDs test file **********/
/** contains various checks ***/
/** updated: 20151221MON WTL **/
/******************************/

ods html close; ods html;

* check abnet nsaids freq code for aspirin and non-aspirin;
proc freq data=melan_use;
	title 'Abnet code checks';
	table rf_Q10_1 rf_Q10_2*RF_ABNET_CAT_ASPIRIN rf_Q11_1 rf_Q11_2*RF_ABNET_CAT_IBUPROFEN 
	/missing nocol norow nopercent;
run;

*******************************;
* check murphy code for aspirin;
proc freq data=melan_use;
	title 'murphy aspirin';
	table rf_Q10_1*murphy_asp*rf_Q10_2
	/missing nocol norow nopercent;
run;
* check murphy code for non-aspirin;
proc freq data=melan_use;
	title 'murphy nonaspirin';
	table rf_Q11_1*murphy_non*rf_Q11_2
	/missing nocol norow nopercent;
run;
* check murphy code for cross tab of aspirin and non-aspirin;
proc freq data=melan_use;
	title 'murphy asp*non crosstab';
	table murphy_non*murphy_asp
	/missing ;
run;

**************************;
*check shebl freq, aspirin;
proc freq data=melan_use;
	title 'shebl aspirin freq';
	table rf_Q10_1*shebl_asp_f*rf_Q10_2
	/missing nocol norow nopercent;
run;
*check shebl freq, non-aspirin;
proc freq data=melan_use;
	title 'shebl nonaspirin freq';
	table rf_Q11_1*shebl_non_f*rf_Q11_2
	/missing nocol norow nopercent;
run;
*check shebl type, aspirin, non-aspirin;
proc freq data=melan_use;
	title 'shebl nsaid type';
	table shebl_type*rf_Q10_1*rf_Q11_1 
	/missing nocol norow nopercent;
run;


ods html close; ods html;
proc freq data=melan_use;
	table 
		(RF_ABNET_CAT_ASPIRIN
		shebl_asp_f
		shebl_non_f
		shebl_type)*melanoma_c
	/missing nocol norow nopercent;
run;

proc freq data=melan_use;
	table
				shebl_type
				SEX 
				educm_comb
				SMOKE_FORMER
				alcohol_comb
				bmi_c
				physic_c
				UVRQ
				htension
				HEART 
				rel_1d_cancer
				coffee_c
				TV_comb 
				nap_comb 
				marriage_comb
				utilizer_m 
				utilizer_w
	/missing;
run;
title;
ods html;
