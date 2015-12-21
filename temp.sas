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
*check shebl indicator, aspirin, non-aspirin;
proc freq data=melan_use;
	title 'shebl aspirin, nonasp indicator';
	table shebl_asp_u*rf_Q10_1 shebl_non_u*rf_Q11_1 
	/missing nocol norow nopercent;
run;
*check shebl type, aspirin, non-aspirin;
proc freq data=melan_use;
	title 'shebl nsaid type';
	table shebl_type*rf_Q10_1*rf_Q11_1 
	/missing nocol norow nopercent;
run;

****************;
* check liu type;
proc freq data=melan_use;
	title 'Asp, non, both, liu_combo';
	table liu_combo*shebl_type 
	/missing nocol norow nopercent;
run;

* check liu aspirin only;
proc freq data=melan_use;
	title 'Aspirin only freq, liu_asp_only';
	table liu_asp_only*(rf_Q10_1 rf_Q11_1 rf_Q10_2)
	/missing nocol norow nopercent;
run;

* check liu nonaspirin only;
proc freq data=melan_use;
	title 'Nonaspirin only freq, liu_non_only';
	table liu_non_only*(rf_Q10_1 rf_Q11_1 rf_Q11_2)
	/missing nocol norow nopercent;
run;

* check liu both aspirin, nonaspirin ;
proc freq data=melan_use;
	title 'Both asp and non freq, liu_both';
	table liu_both*(rf_Q10_1 rf_Q11_1 liu_combo rf_Q10_2 rf_Q11_2)
	/missing nocol norow nopercent;
run;

title;
