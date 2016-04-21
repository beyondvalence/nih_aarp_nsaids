/******************************/
/** NSAIDS clearance tables ***/
** created: 20151223WED WTL ***;
** updated: 20160421THU WTL ***;
/******************************/
ods html close; ods html;
title1 'RFQ clearance tables 20160421THU';
title2 'from special UVR dataset';
title3 'file: clear.tables.w.sas';
proc means data=melan_use missing;
	class UVRQ;
	var exposure_jul_78_05;
run;
proc freq data=melan_use;
	tables
		UVRQ*melanoma_c
		UVRQ*sex
		UVRQ*shebl_type
	/missing  norow ;
run;
title2 'from baseline dataset';
proc freq data=melan_use;
	tables
		educm_comb*EDUCM
		educm_comb*melanoma_c
		educm_comb*sex
		educm_comb*shebl_type
		SMOKE_FORMER*shebl_type
	/missing  norow ;
run;
proc means data=melan_use missing;
	class alcohol_comb;
	var mped_a_bev;
run;
proc freq data=melan_use;
	tables
		alcohol_comb*melanoma_c
		alcohol_comb*sex
		alcohol_comb*shebl_type
	/missing  norow ;
run;
proc means data=melan_use missing;
	class bmi_c;
	var bmi_cur;
run;
proc freq data=melan_use;
	tables
		bmi_c*melanoma_c
		bmi_c*sex
		bmi_c*shebl_type
	/missing  norow ;

proc freq data=melan_use;
	tables
		physic_c*physic
		physic_c*melanoma_c
		physic_c*sex
		physic_c*shebl_type
		physic_1518_c*physic_1518
		physic_1518_c*melanoma_c
		physic_1518_c*sex
		physic_1518_c*shebl_type
		HEART*shebl_type
		rf_1d_cancer*shebl_type
		coffee_c*qp12b
		coffee_c*melanoma_c
		coffee_c*sex
		coffee_c*shebl_type
		marriage_comb*MARRIAGE
		marriage_comb*melanoma_c
		marriage_comb*sex
		marriage_comb*shebl_type
	/missing  norow ;
run;
title2 'from RF dataset';
proc freq data=melan_use;
	title3'nsaid exposures';
	tables
		shebl_type*rf_Q10_1*rf_Q11_1 
		shebl_asp_f*rf_Q10_1*rf_Q10_2
		shebl_non_f*rf_Q11_1*rf_Q11_2
	/missing nocol norow nopercent list;
run;
proc freq data=melan_use;
	tables
		shebl_type*melanoma_c
		shebl_type*sex
		shebl_asp_f*melanoma_c
		shebl_asp_f*sex
		shebl_non_f*melanoma_c
		shebl_non_f*sex
		TV_comb*RF_PHYS_TV
		TV_comb*melanoma_c
		TV_comb*sex
		TV_comb*shebl_type
		nap_comb*RF_PHYS_NAP
		nap_comb*melanoma_c
		nap_comb*sex
		nap_comb*shebl_type
		htension*rf_Q47_1
		htension*melanoma_c
		htension*sex
		htension*shebl_type
	/missing ;
run; title3;
proc freq data=melan_use;
	title2 'Had any procedure on colon or rectum in past 3 years?';
	tables
		utilizer_m*rf_Q15A*rf_Q15B*rf_Q15C*rf_Q15D*rf_Q15E
	/missing nocol norow nopercent list;
run;
proc freq data=melan_use;
	title2;
	tables
		utilizer_m*melanoma_c
		utilizer_m*sex
		utilizer_m*shebl_type
		utilizer_w*rf_Q44
		utilizer_w*melanoma_c
		utilizer_w*sex
		utilizer_w*shebl_type
	/missing  norow ;
run; 

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
title;
