/* clearance tables */
** 20151215TUE WTL;
ods html close; ods html;
title1 'RFQ clearance tables';

proc freq data=melan_use;
	tables
		SEX 
	/missing nocol norow nopercent;
run;
proc means data=melan_use missing;
	class UVRQ;
	var exposure_jul_78_05;
run;
proc means data=melan_use missing;
	class alcohol_comb;
	var mped_a_bev;
run;
proc freq data=melan_use;
	tables
		physic_c*physic
		TV_comb*RF_PHYS_TV
		nap_comb*RF_PHYS_NAP
		marriage_comb*MARRIAGE
		educm_comb*EDUCM
		utilizer_w*rf_Q44
	/missing nocol norow nopercent;
run;
proc freq data=melan_use;
	title2 'Had any procedure on colon or rectum in past 3 years?';
	tables
		utilizer_m*rf_Q15A*rf_Q15B*rf_Q15C*rf_Q15D*rf_Q15E
	/missing nocol norow nopercent list;
run;
title;
