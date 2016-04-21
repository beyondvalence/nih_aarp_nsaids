/***************************************/
/** NSAIDs test file *******************/
/** contains various checks ************/
/** now only SHEBL type NSAID coding ***/
/** updated: 20151221 WTL **************/
/***************************************/

ods html close; ods html;
title1 'NSAID table1 checks';
title2 '';
title3 'file: shebl_check.sas';

proc means data=melan_use missing;
	title2 'RF entry age age category';
	class agecat;
	var rf_entry_age;
run;
proc freq data=melan_use;
	tables
		agecat*melanoma_c
		agecat*sex
		agecat*shebl_type
	/missing  norow nopercent;
run;

proc means data=melan_use;
	title2 'RF age at entry mean (SD)';
	var rf_entry_age;
run;
proc means data=melan_use;
	class shebl_type;
	var rf_entry_age;
run;
proc univariate data=melan_use;
	title2 'RF follow up median (IQR)';
	var rf_personyrs;
run;
proc univariate data=melan_use;
	class shebl_type;
	var rf_personyrs;
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
				physic_1518_c
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
