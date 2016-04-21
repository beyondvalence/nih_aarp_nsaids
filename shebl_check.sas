/***************************************/
/** NSAIDs test file *******************/
/** contains various checks ************/
/** now only SHEBL type NSAID coding ***/
/** updated: 20151221 WTL **************/
/***************************************/

ods html close; ods html;
title1 'NSAID test freqs';
title2 'Shebl checks';
title3 'file: shebl_check.sas';
/* check abnet nsaids freq code for aspirin and non-aspirin;
proc freq data=melan_use;
	title2 'Abnet code checks';
	table rf_Q10_1 rf_Q10_2*RF_ABNET_CAT_ASPIRIN rf_Q11_1 rf_Q11_2*RF_ABNET_CAT_IBUPROFEN 
	/missing nocol norow nopercent;
run;*/

**************************;
*check shebl freq, aspirin;
proc freq data=melan_use;
	title2 'shebl aspirin freq';
	table rf_Q10_1*shebl_asp_f*rf_Q10_2
	/missing nocol norow nopercent;
run;
*check shebl freq, non-aspirin;
proc freq data=melan_use;
	title2 'shebl nonaspirin freq';
	table rf_Q11_1*shebl_non_f*rf_Q11_2
	/missing nocol norow nopercent;
run;
*check shebl type, aspirin, non-aspirin;
proc freq data=melan_use;
	title2 'shebl nsaid type';
	table shebl_type*rf_Q10_1*rf_Q11_1 
	/missing nocol norow nopercent;
run;

*ods html close; *ods html;
proc freq data=melan_use;
	title2 'shebl cross checks';
	table 
		(shebl_asp_f
		shebl_non_f
		shebl_type)*melanoma_c
	/missing nocol norow nopercent;
run;

proc freq data=melan_use;
	title2 'variables by shebl type';
	table
				(SEX 
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
				utilizer_w)*shebl_type
	/missing;
run;
title;
ods html;
