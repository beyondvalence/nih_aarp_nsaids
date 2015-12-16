/* clearance tables */
** 20151215TUE WTL;
ods html close; ods html;
title1 'RFQ clearance tables';

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
		/missing nocol norow nopercent;
run;
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
	tables
		utilizer_m*melanoma_c
		utilizer_m*sex
	/missing nocol norow nopercent;
run;
title;
