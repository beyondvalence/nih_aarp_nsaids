/******************************/
/** NSAIDS clearance tables ***/
** 20151223WED WTL ************;
/******************************/
ods html close; ods html;
title1 'RFQ clearance tables';
title2 'nsaid exposures';
proc freq data=melan_use;
	title3'shebl variables with freq';
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
		shebl_asp_u*melanoma_c
		shebl_asp_u*sex
		shebl_non_u*melanoma_c
		shebl_non_u*sex
	/missing nocol norow nopercent;
run;
title2 'confounders'; title3;
proc means data=melan_use missing;
	class UVRQ;
	var exposure_jul_78_05;
run;
proc freq data=melan_use;
	tables
		UVRQ*melanoma_c
		UVRQ*sex
	/missing nocol norow nopercent;
run;
proc means data=melan_use missing;
	class bmi_c;
	var bmi_cur;
run;
proc freq data=melan_use;
	tables
		bmi_c*melanoma_c
		bmi_c*sex
	/missing nocol norow nopercent;
proc means data=melan_use missing;
	class alcohol_comb;
	var mped_a_bev;
run;
proc freq data=melan_use;
	tables
		alcohol_comb*melanoma_c
		alcohol_comb*sex
	/missing nocol norow nopercent;
run;
proc freq data=melan_use;
	tables
		physic_c*physic
		physic_c*melanoma_c
		physic_c*sex
		physic_1581_c*physic_1518
		physic_1518_c*melanoma_c
		physic_1518_c*sex
		coffee_c*qp12b
		coffee_c*melanoma_c
		coffee_c*sex
		TV_comb*RF_PHYS_TV
		TV_comb*melanoma_c
		TV_comb*sex
		nap_comb*RF_PHYS_NAP
		nap_comb*melanoma_c
		nap_comb*sex
		marriage_comb*MARRIAGE
		marriage_comb*melanoma_c
		marriage_comb*sex
		educm_comb*EDUCM
		educm_comb*melanoma_c
		educm_comb*sex
		utilizer_w*rf_Q44
		utilizer_w*melanoma_c
		utilizer_w*sex
	/missing nocol norow nopercent;
run;
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
	/missing nocol norow nopercent;
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
	/missing nocol norow nopercent;
proc means data=melan_use missing;
	title2 'year of birth';
	class yob;
	var F_DOB;
run;
proc freq data=melan_use;
	tables
		yob*melanoma_c
		yob*sex
	/missing nocol norow nopercent;
title;
