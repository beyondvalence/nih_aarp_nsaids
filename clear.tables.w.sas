/******************************/
/** NSAIDS clearance tables ***/
** 20151221MON WTL ************;
/******************************/
ods html close; ods html;
title1 'RFQ clearance tables';
title2 'nsaid exposures';
proc freq data=melan_use;
	tables
		nsaid_bi*rf_abnet_aspirin*rf_abnet_ibuprofen
		nsaid*rf_abnet_cat_aspirin*rf_abnet_cat_ibuprofen
	/missing nocol norow nopercent list;
run;
proc freq data=melan_use;
	tables
		nsaid_bi*melanoma_c
		nsaid_bi*sex
		nsaid*melanoma_c
		nsaid*sex
		nsaid_bi_me*nsaid_bi
		nsaid_bi_me*melanoma_c
		nsaid_bi_me*sex
		nsaid_me*nsaid
		nsaid_me*melanoma_c
		nsaid_me*sex
		/missing nocol norow nopercent;
run;

title2 'confounders';
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
title2 'additional variables';
proc means data=melan_use missing;
	class birth_cohort;
	var F_DOB;
run;
proc freq data=melan_use;
	tables
		birth_cohort*melanoma_c
		birth_cohort*sex
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
		rf_physic_c*rf_phys_modvig_curr
		rf_physic_c*melanoma_c
		rf_physic_c*sex
		aspirin_collapse*RF_ABNET_CAT_ASPIRIN
		aspirin_collapse*melanoma_c
		aspirin_coolapse*sex
		ibu_collapse*RF_ABNET_CAT_IBUPROFEN
		ibu_collapse*melanoma_c
		ibu_collapse*sex
	/missing nocol norow nopercent;
title;
