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
proc means data=melan_use missing;
	class UVRQ;
	var exposure_jul_78_05;
run;
proc freq data=melan_use;
	tables
		UVRQ*nsaid_bi
	/missing nocol norow nopercent;
run;
proc means data=melan_use missing;
	class alcohol_comb;
	var mped_a_bev;
run;
proc freq data=melan_use;
	tables
		alcohol_comb*nsaid_bi
	/missing nocol norow nopercent;
run;
proc freq data=melan_use;
	tables
		physic_c*physic
		physic_c*nsaid_bi
		coffee_c*qp12b
		coffee_c*nsaid_bi
		TV_comb*RF_PHYS_TV
		TV_comb*nsaid_bi
		nap_comb*RF_PHYS_NAP
		nap_comb*nsaid_bi
		marriage_comb*MARRIAGE
		marriage_comb*nsaid_bi
		educm_comb*EDUCM
		educm_comb*nsaid_bi
		utilizer_w*rf_Q44
		utilizer_w*nsaid_bi
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
		utilizer_m*nsaid_bi
	/missing nocol norow nopercent;
run;
title;
