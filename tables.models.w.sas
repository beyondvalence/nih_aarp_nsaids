/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# creates table 1 and table 2 
# model building analysis
#
# with SAS output to MS Excel
# uses melan_use dataset
# 
# Created: July 30, 2015
# Updated: 20151201TUE wtl
#
*******************************************************************/

%include 'C:\REB\NSAIDS melanoma AARP\Analysis\format.risk.w.sas';

***************************************;
**** Combine variables for Table 1 ****;
***************************************;

data melan_use;
	set melan_use;

	educm_comb=.;
	if			EDUCM in (1,2)					then educm_comb=1; *<=11 yrs*;
	else if		EDUCM=3							then educm_comb=2; *high school graduate*;
	else if		EDUCM=4							then educm_comb=3; *some college*;
	else if		EDUCM=5							then educm_comb=4; *college graduate*;
	else if		EDUCM=9							then educm_comb=9; *unknown*;

	marriage_comb=.;
	if			MARRIAGE=1						then marriage_comb=1; *married or living as married *;
	else if		MARRIAGE=2						then marriage_comb=2; *widowed*;
	else if		MARRIAGE in (3,4)				then marriage_comb=3; *divorced or separated*;
	else if		MARRIAGE=5						then marriage_comb=4; *never married*;
	else if		MARRIAGE=9						then marriage_comb=9; *unknown*;

	alcohol_comb=.;
	if 		mped_a_bev=0						then alcohol_comb=0; /* none */
	else if 0<mped_a_bev<=1						then alcohol_comb=1; /* <=1 */
	else if 1<mped_a_bev<=2 					then alcohol_comb=2; /* >1-<=2 drinks*/
	else if 2< mped_a_bev						then alcohol_comb=3; /* 2< drinks */
	else if	alcohol=9							then alcohol_comb=3; /* missing */

	TV_comb=.;
	if			RF_PHYS_TV in (0,1)				then TV_comb=1; *none/<1 hr/day *;
	else if		RF_PHYS_TV=2					then TV_comb=2; *1-2 hours/day *;
	else if		RF_PHYS_TV=3					then TV_comb=3; *3-4 hours/day *;
	else if		RF_PHYS_TV in (4,5,6)			then TV_comb=4; *>=5 hours/day *;
	else if		RF_PHYS_TV=9					then TV_comb=9; *unknown*;

	nap_comb=.;
	if			RF_PHYS_NAP=0					then nap_comb=0; *never naps *;
	else if		RF_PHYS_NAP=1					then nap_comb=1; *<1 hour/day *;
	else if		RF_PHYS_NAP in (2,3,4)			then nap_comb=2; *naps >=1 hour/day *;
	else if		RF_PHYS_NAP=9					then nap_comb=9; *unknown/missing*;

	nsaid_bi=.;
	if				rf_abnet_aspirin=0 and rf_abnet_ibuprofen=0				then nsaid_bi=0; *nsaid non-user*;	
	else if			rf_abnet_aspirin=1| rf_abnet_ibuprofen=1				then nsaid_bi=1; *nsaid user*;

	nsaid=.;
	if			rf_abnet_cat_aspirin=0 and rf_abnet_cat_ibuprofen=0			then nsaid=0; *nsaid non-user*;

	else if		rf_abnet_cat_aspirin=1 and rf_abnet_cat_ibuprofen=0			then nsaid=1; *nsaid monthly user*;
	else if		rf_abnet_cat_aspirin=0 and rf_abnet_cat_ibuprofen=1			then nsaid=1; *nsaid monthly user*;
	else if		rf_abnet_cat_aspirin=1 and rf_abnet_cat_ibuprofen=1			then nsaid=1; *nsaid monthly user*;

	else if		rf_abnet_cat_aspirin=2 and rf_abnet_cat_ibuprofen=0			then nsaid=2; *nsaid weekly user*;
	else if		rf_abnet_cat_aspirin=2 and rf_abnet_cat_ibuprofen=1			then nsaid=2; *nsaid weekly user*;
	else if		rf_abnet_cat_aspirin=0 and rf_abnet_cat_ibuprofen=2			then nsaid=2; *nsaid weekly user*;
	else if		rf_abnet_cat_aspirin=1 and rf_abnet_cat_ibuprofen=2			then nsaid=2; *nsaid weekly user*;
	else if		rf_abnet_cat_aspirin=2 and rf_abnet_cat_ibuprofen=2			then nsaid=2; *nsaid weekly user*;

	else if		rf_abnet_cat_aspirin=3 and rf_abnet_cat_ibuprofen=0			then nsaid=3; *nsaid daily user*;
	else if		rf_abnet_cat_aspirin=3 and rf_abnet_cat_ibuprofen=1			then nsaid=3; *nsaid daily user*;
	else if		rf_abnet_cat_aspirin=3 and rf_abnet_cat_ibuprofen=2			then nsaid=3; *nsaid daily user*;
	else if		rf_abnet_cat_aspirin=0 and rf_abnet_cat_ibuprofen=3			then nsaid=3; *nsaid daily user*;
	else if		rf_abnet_cat_aspirin=1 and rf_abnet_cat_ibuprofen=3			then nsaid=3; *nsaid daily user*;
	else if		rf_abnet_cat_aspirin=2 and rf_abnet_cat_ibuprofen=3			then nsaid=3; *nsaid daily user*;
	else if		rf_abnet_cat_aspirin=3 and rf_abnet_cat_ibuprofen=3			then nsaid=3; *nsaid daily user*;

	utilizer=.; *combine utilizer_m (colonoscopy) and utilizer_w (mammogram) into single variable;
	if			utilizer_m=1 and utilizer_w=1		then utilizer=1; *both yes;
	if			utilizer_m=1 and utilizer_w=0		then utilizer=1; *colonoscopy yes, mammogram no = utilizer yes;
	if			utilizer_m=0 and utilizer_w=1		then utilizer=1; *colonoscopy no, mammogram yes = utilizer yes;
	if			utilizer_m=0 and utilizer_w=0		then utilizer=0; *both no = utilizer no;

	coffee=.;
	if			QP12B=0								then coffee=0; *none*;
	if			QP12B=1								then coffee=1; *1 cup/d*;
	if			QP12B>=2 and QP12B<=3				then coffee=2; *2-3 cup/d*;
	if			QP12B>=4 							then coffee=3; *>=4 cup/d*;

run;

***************************************;
*** mean age at entry and exit (SD) ***;
***************************************;

proc tabulate data=melan_use;
	class race_c;
	var exit_age entry_age;
	table (exit_age entry_age),
	(race_c)* (mean='Mean' stddev='SD');
run; 

****************************;
** Confounder -> outcome  **;
****************************;

**************************; 
** Supplemental Table 1 **;
**************************;

**** Categorical ****;
ods html body= 'C:\REB\NSAIDS melanoma AARP\Results\Table_1\Supp_Table1_a.xls' style=minimal;
proc tabulate data=melan_use missing;
	
	class 	melanoma_c  
			SEX 
			UVRQ
		  	RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
			alcohol_comb
			SMOKE_FORMER 
			physic_c 
			RF_PHYS_MODVIG_CURR
			TV_comb 
			nap_comb 
			marriage_comb
			educm_comb
			HEART
			utilizer_m 
			utilizer_w
			;

	table   
			SEX 
			UVRQ
		  	RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
			alcohol_comb
			SMOKE_FORMER 
			physic_c 
			RF_PHYS_MODVIG_CURR
			TV_comb 
			nap_comb 
			marriage_comb
			educm_comb
			HEART
			utilizer_m 
			utilizer_w ,

			(melanoma_c)* (N colpctn='Percent') /nocellmerge; 
run; 

*categorical chi-squared and trend for in situ;

ods output ChiSq=Table1Chi      (keep=Table Statistic Prob rename=(prob=Chi2Pvalue)    where=(Statistic='Chi-Square'));
ods output TrendTest=Table1Trd  (keep=Table Name1 cValue1 rename=(cValue1=TrendPvalue) where=(Name1='P2_TREND'));

proc freq data=melan_use;
tables melanoma_ins* (
			SEX 
			UVRQ
	  		RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
			alcohol_comb
			SMOKE_FORMER 
			physic_c 
			RF_PHYS_MODVIG_CURR
			TV_comb 
			nap_comb 
			marriage_comb
			educm_comb
			HEART
			utilizer_m 
			utilizer_w
			)
	 		/chisq trend nocol nopercent scores=table;
run;
data Table1Chi; 
	set Table1Chi (keep=Table Chi2Pvalue); run;
data Table1Trd; 
	set Table1Trd (keep=Table TrendPvalue); run;
proc sort data=Table1Chi; 
	by Table; run;
proc sort data=Table1Trd; 
	by Table; run;
data Table1ap; 
	set Table1Chi Table1Trd ; by Table; run;
ods html file='E:\NCI REB\AARP\Results\Table_1\Supp_Table1_ap_ins.xls' style=minimal;
proc print data= Table1ap;
	title 'print chi2 and trend for melanoma_ins';
run; 
ods html close;

*******************************************************************************************************************;

**Continuous;
ods html body='E:\NCI REB\AARP\Results\Table_1\Supp_Table1b_ins.xls' style=minimal;
proc tabulate data=melan_use;
title 'tab continuous melanoma_ins';
class melanoma_ins;
var exit_age entry_age bmi_cur exposure_jul_78_05 ;
table (exit_age entry_age bmi_cur exposure_jul_78_05),
(melanoma_ins)* (mean='Mean' stddev='SD');
run; ods html close;

ods output Ttests=Table1T ; ods html;
proc ttest data=melan_use;
title 'ttest melanoma_ins'
class melanoma_ins;
var exit_age entry_age bmi_cur exposure_jul_78_05 ;
run;
ods html file='E:\NCI REB\AARP\Results\Table_1\Supp_Table1bp_ins.xls' style=minimal;
proc print data= Table1T; run;
ods html close;

*categorical chi-squared and trend for malignant;

ods output ChiSq=Table1Chi      (keep=Table Statistic Prob rename=(prob=Chi2Pvalue)    where=(Statistic='Chi-Square'));
ods output TrendTest=Table1Trd  (keep=Table Name1 cValue1 rename=(cValue1=TrendPvalue) where=(Name1='P2_TREND'));

proc freq data=melan_use;
tables melanoma_mal* (
			SEX 
			UVRQ
	  		RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
			alcohol_comb
			SMOKE_FORMER 
			physic_c 
			RF_PHYS_MODVIG_CURR
			TV_comb 
			nap_comb 
			marriage_comb
			educm_comb
			HEART
			utilizer_m 
			utilizer_w
			)
	 		/chisq trend nocol nopercent scores=table;
run;
data Table1Chi; 
	set Table1Chi (keep=Table Chi2Pvalue); run;
data Table1Trd; 
	set Table1Trd (keep=Table TrendPvalue); run;
proc sort data=Table1Chi; 
	by Table; run;
proc sort data=Table1Trd; 
	by Table; run;
data Table1ap; 
	set Table1Chi Table1Trd ; by Table; run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\Table_1\Supp_Table1ap_mal.xls' style=minimal;
proc print data= Table1ap;
	title 'print chi2 and trend for melanoma_mal';
run; 
ods html close;

*******************************************************************************************************************;

**Continuous;
ods html body='E:\NCI REB\AARP\Results\Table_1\Supp_Table1b_mal.xls' style=minimal;
proc tabulate data=melan_use;
title 'tab continuous melanoma_mal';
class melanoma_mal;
var exit_age entry_age bmi_cur exposure_jul_78_05 ;
table (exit_age entry_age bmi_cur exposure_jul_78_05 ),
(melanoma_mal)* (mean='Mean' stddev='SD');
run; ods html close;
ods output Ttests=Table1T ; ods html;

proc ttest data=melan_use;
title 'ttest melanoma_mal';
class melanoma_mal;
var exit_age entry_age bmi_cur exposure_jul_78_05 ;
run;

ods html file='E:\NCI REB\AARP\Results\Table_1\Supp_Table1bp_mal.xls' style=minimal;
proc print data= Table1T; 
run;
ods html close;


****************************;
** Confounder -> exposure **;
****************************;

****************************;
** NSAID user vs non-user **;
****************************;
*using as Table 1 in paper i.e. not presenting cohort characteristics by melanoma case/non-case;


** Categorical;
ods html body= 'E:\NCI REB\AARP\Results\Table_2\Table2_nsaid.xls' style=minimal;
proc tabulate data=melan_use missing;
class 	nsaid_bi  
			SEX 
			UVRQ
	  		RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
			alcohol_comb
			SMOKE_FORMER 
			physic_c 
			TV_comb 
			nap_comb 
			marriage_comb
			educm_comb
			HEART
			utilizer_m 
			utilizer_w;

table   
			SEX 
			UVRQ
	  		RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
			alcohol_comb
			SMOKE_FORMER 
			physic_c 
			TV_comb 
			nap_comb 
			marriage_comb
			educm_comb
			HEART
			utilizer_m 
			utilizer_w		,

		(nsaid_bi)* (N colpctn='Percent') /nocellmerge; 
run; 

ods output ChiSq=Table1Chi      (keep=Table Statistic Prob rename=(prob=Chi2Pvalue)    where=(Statistic='Chi-Square'));
ods output TrendTest=Table1Trd  (keep=Table Name1 cValue1 rename=(cValue1=TrendPvalue) where=(Name1='P2_TREND'));

proc freq data=melan_use;
tables nsaid_bi* (
			SEX 
			UVRQ
	  		RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
			alcohol_comb
			SMOKE_FORMER 
			physic_c 
			TV_comb 
			nap_comb 
			marriage_comb
			educm_comb
			HEART
			utilizer_m 
			utilizer_w			
			)
	 		/chisq trend nocol nopercent scores=table;
run;
data Table1Chi; 
	set Table1Chi (keep=Table Chi2Pvalue); run;
data Table1Trd; 
	set Table1Trd (keep=Table TrendPvalue); run;
proc sort data=Table1Chi; 
	by Table; run;
proc sort data=Table1Trd; 
	by Table; run;
data Table2ap; 
	set Table1Chi Table1Trd ; by Table; run;
ods html file='E:\NCI REB\AARP\Results\Table_2\Table2ap_nsaid.xls' style=minimal;
proc print data= Table2ap;
	title 'print chi2 and trend for nsaid_bi';
run; 
ods html close;

*******************************************************************************************************************;


** Continuous;

ods html body='E:\NCI REB\AARP\Results\Table_2\Table2b_nsaid.xls' style=minimal;
proc tabulate data=melan_use;
title 'tab continuous melanoma_mal';
class nsaid_bi;
var exit_age entry_age bmi_cur exposure_jul_78_05 ;
table (exit_age entry_age bmi_cur exposure_jul_78_05 ),
(nsaid_bi)* (mean='Mean' stddev='SD');
run; ods html close;

ods output Ttests=Table2T ; ods html;
proc ttest data=melan_use;
title 'ttest nsaid_bi';
class nsaid_bi;
var exit_age entry_age bmi_cur exposure_jul_78_05 ;
run;
ods html file='E:\NCI REB\AARP\Results\Table_2\Table2bp_nsaid.xls' style=minimal;
proc print data= Table2T; run;
ods html close;


*******************************************************;
** NSAID non-user vs max monthly, weekly, daily user **;
*******************************************************;
*using as Table 1 in paper i.e. not presenting cohort characteristics by melanoma case vs non-case;

**** Categorical ****;
ods html body= 'E:\NCI REB\AARP\Results\Table_2\Strat_Table2_a.xls' style=minimal;
proc tabulate data=melan_use missing;
class 	nsaid  
		SEX 
		UVRQ
	  	RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
		alcohol_comb
		SMOKE_FORMER 
		physic_c 
		RF_PHYS_MODVIG_CURR
		coffee
		TV_comb 
		nap_comb 
		marriage_comb
		educm_comb
		HEART
		utilizer_m 
		utilizer_w
		;

table   
		SEX 
		UVRQ
	  	RF_ABNET_ASPIRIN RF_ABNET_CAT_ASPIRIN RF_ABNET_CAT_IBUPROFEN RF_ABNET_IBUPROFEN  
		alcohol_comb
		SMOKE_FORMER 
		physic_c 
		RF_PHYS_MODVIG_CURR
		coffee
		TV_comb 
		nap_comb 
		marriage_comb
		educm_comb
		HEART
		utilizer_m 
		utilizer_w ,

		(nsaid)* (N colpctn='Percent') /nocellmerge; 
run; 

ods output ChiSq=Table1Chi      (keep=Table Statistic Prob rename=(prob=Chi2Pvalue)    where=(Statistic='Chi-Square'));
ods output TrendTest=Table1Trd  (keep=Table Name1 cValue1 rename=(cValue1=TrendPvalue) where=(Name1='P2_TREND'));


***********************************************;
*********		    abnet exposure	***********;
*********		    4 categories	***********;
***********************************************;
***************************************************;
********** 		Number of cases		***************;
********** 		4 categories		***************;
***************************************************;

proc freq data=melan_use;
tables rf_abnet_cat_aspirin*melanoma_ins;
run;
proc freq data=melan_use;
tables rf_abnet_cat_aspirin*melanoma_mal;
run;
proc freq data=melan_use;
tables rf_abnet_cat_ibuprofen*melanoma_ins;
run;
proc freq data=melan_use;
tables rf_abnet_cat_ibuprofen*melanoma_mal;
run;

***********************************************;
*********		MODEL BUILDING		***********;
***********************************************;

***********************************************;
*********		   Unadjusted		***********;
***********************************************;

***********************************************;
********* 			ASPIRIN			***********;
********* 			IN SITU			***********;
***********************************************;

proc phreg data = melan_use;
class rf_abnet_aspirin (ref='no') ;
model exit_age*melanoma_ins(0)=rf_abnet_aspirin  / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=unadj_ains;
run;
data unadj_ains; set unadj_ains;
if Parameter='RF_ABNET_ASPIRIN';
variable="unadj_ains";
run;
proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use');
model exit_age*melanoma_ins(0)=rf_abnet_cat_aspirin / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=unadj_ains_cat;
run;
data unadj_ains_cat; set unadj_ains_cat;
if Parameter='RF_ABNET_CAT_ASPIRIN';
variable="unadj_ains_cat";
run;


***********************************************;
********* 			ASPIRIN			***********;
********* 	   Malignant melanoma	***********;
***********************************************;


proc phreg data = melan_use;
class rf_abnet_aspirin (ref='no') ;
model exit_age*melanoma_mal(0)=rf_abnet_aspirin  / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=unadj_amal;
run;
data unadj_amal; set unadj_amal;
if Parameter='RF_ABNET_ASPIRIN';
variable="unadj_amal";
run;
proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use') ;
model exit_age*melanoma_mal(0)=rf_abnet_cat_aspirin / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=unadj_amal_cat;
run;
data unadj_amal_cat; set unadj_amal_cat;
if Parameter='RF_ABNET_CAT_ASPIRIN';
variable="unadj_amal_cat";
run;


***********************************************;
********* 			 IBU			***********;
********* 	   		IN SITU			***********;
***********************************************;

proc phreg data = melan_use;
class rf_abnet_ibuprofen (ref='no') ;
model exit_age*melanoma_ins(0)=rf_abnet_ibuprofen  / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=unadj_iins;
run;
data unadj_iins; set unadj_iins;
if Parameter='RF_ABNET_IBUPROFEN';
variable="unadj_iins";
run;
proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use');
model exit_age*melanoma_ins(0)=rf_abnet_cat_ibuprofen / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=unadj_iins_cat;
run;
data unadj_iins_cat; set unadj_iins_cat;
if Parameter='RF_ABNET_CAT_IBUPROF';
variable="unadj_iins_cat";
run;



***********************************************;
********* 			 IBU			***********;
********* 	   	  Malignant			***********;
***********************************************;

*** model: exit_age*melanoma_mal(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05;
proc phreg data = melan_use;
class rf_abnet_ibuprofen (ref='no') ;
model exit_age*melanoma_mal(0)=rf_abnet_ibuprofen  / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=unadj_imal;
run;
data unadj_imal; set unadj_imal;
if Parameter='RF_ABNET_IBUPROFEN';
variable="unadj_imal";
run;
proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use') ;
model exit_age*melanoma_mal(0)=rf_abnet_cat_ibuprofen / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=unadj_imal_cat;
run;
data unadj_imal_cat; set unadj_imal_cat;
if Parameter='RF_ABNET_CAT_IBUPROF';
variable="unadj_iins_cat";
run;

data unadj_totalpop; 
set 
unadj_ains
unadj_ains_cat
unadj_amal
unadj_amal_cat
unadj_iins
unadj_iins_cat
unadj_imal
unadj_imal_cat
; run;
data unadj_totalpop; 
set unadj_totalpop
(Keep= variable HazardRatio HRLowerCL HRUpperCL Label ClassVal0); run;
ods html file='E:\NCI REB\AARP\Results\Main_effects\unadjusted_models\unadj_totalpop.xls' style=minimal;
proc print data= unadj_totalpop; run;


*******************************************************;
*********		    Apriori Adjusted 		***********;
*******************************************************;
********* 			ASPIRIN					***********;
********* 			IN SITU					***********;
*******************************************************;

*** model: exit_age*melanoma_ins(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05;

proc phreg data = melan_use multipass;
class rf_abnet_aspirin (ref='no')SEX birth_cohort utilizer_m utilizer_w ;
model exit_age*melanoma_ins(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=apriori;
run;
data apriori_aspirin_ins; set apriori;
if Parameter='RF_ABNET_ASPIRIN';
variable="ap_asp_insitu          ";
run;
proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use')SEX birth_cohort utilizer_m utilizer_w ;
model exit_age*melanoma_ins(0)=rf_abnet_cat_aspirin SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=apriori;
run;
data apriori_ains_cat; set apriori;
run;

***********************************************;
********* 			ASPIRIN			***********;
********* 	   Malignant melanoma	***********;
***********************************************;

*** model: exit_age*melanoma_mal(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05;

proc phreg data = melan_use multipass;
class rf_abnet_aspirin (ref='no')SEX birth_cohort utilizer_m utilizer_w ;
model exit_age*melanoma_mal(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=apriori;
run;
data apriori_aspirin_mal; set apriori;
if Parameter='RF_ABNET_ASPIRIN';
variable="ap_asp_mal          ";
run;
proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use')SEX birth_cohort utilizer_m utilizer_w ;
model exit_age*melanoma_mal(0)=rf_abnet_cat_aspirin SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=apriori;
run;
data apriori_amal_cat; set apriori;
run;

***********************************************;
********* 			 IBU			***********;
********* 	   		IN SITU			***********;
***********************************************;

*** model: exit_age*melanoma_ins(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05;

proc phreg data = melan_use multipass;
class rf_abnet_ibuprofen (ref='no')SEX birth_cohort utilizer_m utilizer_w ;
model exit_age*melanoma_ins(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=apriori;
run;
data apriori_ibu_ins; set apriori;
if Parameter='RF_ABNET_IBUPROFEN';
variable="ap_ibu_ins          ";
run;
proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use')SEX birth_cohort utilizer_m utilizer_w ;
model exit_age*melanoma_ins(0)=rf_abnet_cat_ibuprofen SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=apriori;
run;
data apriori_iins_cat; set apriori;
run;

***********************************************;
********* 			 IBU			***********;
********* 	   	  Malignant			***********;
***********************************************;

*** model: exit_age*melanoma_mal(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05;

proc phreg data = melan_use multipass;
class rf_abnet_ibuprofen (ref='no')SEX birth_cohort utilizer_m utilizer_w ;
model exit_age*melanoma_mal(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=apriori;
run;
data apriori_ibu_mal; set apriori;
if Parameter='RF_ABNET_IBUPROFEN';
variable="ap_ibu_mal          ";
run;
proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use')SEX birth_cohort utilizer_m utilizer_w ;
model exit_age*melanoma_mal(0)=rf_abnet_cat_ibuprofen SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=apriori;
run;
data apriori_imal_cat; set apriori;
run;


data apriori_model; 
set 
apriori_aspirin_ins
apriori_ains_cat
apriori_aspirin_mal
apriori_amal_cat
apriori_ibu_ins
apriori_iins_cat
apriori_ibu_mal
apriori_imal_cat
; run;
data apriori_model; 
set apriori_model
(Keep= variable HazardRatio HRLowerCL HRUpperCL Label ClassVal0); run;
ods html file='E:\NCI REB\AARP\Results\Main_effects\apriori\apriori_model.xls' style=minimal;
proc print data= apriori_model; run;


******************************************************************;
********* 		Excludes those with heart disease		**********;
******************************************************************;

***********************************************;
*********		   Unadjusted		***********;
***********************************************;
********* 			ASPIRIN			***********;
********* 			IN SITU			***********;
***********************************************;

proc phreg data = melan_use;
class rf_abnet_aspirin (ref='no') ;
model exit_age*melanoma_ins(0)=rf_abnet_aspirin  / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=unadj_ains_noH;
run;
data unadj_ains_noH; set unadj_ains_noH;
if Parameter='RF_ABNET_ASPIRIN';
variable="unadj_ains_noH";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use');
model exit_age*melanoma_ins(0)=rf_abnet_cat_aspirin / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=unadj_ains_cat_noH;
run;
data unadj_ains_cat_noH; set unadj_ains_cat_noH;
if Parameter='RF_ABNET_CAT_ASPIRIN';
variable="unadj_ains_cat_noH";
run;


***********************************************;
********* 			ASPIRIN			***********;
********* 	   Malignant melanoma	***********;
***********************************************;


proc phreg data = melan_use;
class rf_abnet_aspirin (ref='no') ;
model exit_age*melanoma_mal(0)=rf_abnet_aspirin  / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=unadj_amal_noH;
run;
data unadj_amal_noH; set unadj_amal_noH;
if Parameter='RF_ABNET_ASPIRIN';
variable="unadj_amal_noH";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use') ;
model exit_age*melanoma_mal(0)=rf_abnet_cat_aspirin / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=unadj_amal_cat_noH;
run;
data unadj_amal_cat_noH; set unadj_amal_cat_noH;
if Parameter='RF_ABNET_CAT_ASPIRIN';
variable="unadj_amal_cat_noH";
run;

***********************************************;
********* 			 IBU			***********;
********* 	   		IN SITU			***********;
***********************************************;

proc phreg data = melan_use;
class rf_abnet_ibuprofen (ref='no') ;
model exit_age*melanoma_ins(0)=rf_abnet_ibuprofen  / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=unadj_iins_noH;
run;
data unadj_iins_noH; set unadj_iins_noH;
if Parameter='RF_ABNET_IBUPROFEN';
variable="unadj_iins_noH";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use');
model exit_age*melanoma_ins(0)=rf_abnet_cat_ibuprofen / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=unadj_iins_cat_noH;
run;
data unadj_iins_cat_noH; set unadj_iins_cat_noH;
if Parameter='RF_ABNET_CAT_IBUPROF';
variable="unadj_iins_cat_noH";
run;

***********************************************;
********* 			 IBU			***********;
********* 	   	  Malignant			***********;
***********************************************;

*** model: exit_age*melanoma_mal(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05;
proc phreg data = melan_use;
class rf_abnet_ibuprofen (ref='no') ;
model exit_age*melanoma_mal(0)=rf_abnet_ibuprofen  / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=unadj_imal_noH;
run;
data unadj_imal_noH; set unadj_imal_noH;
if Parameter='RF_ABNET_IBUPROFEN';
variable="unadj_imal_noH";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use') ;
model exit_age*melanoma_mal(0)=rf_abnet_cat_ibuprofen / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=unadj_imal_cat_noH;
run;
data unadj_imal_cat_noH; set unadj_imal_cat_noH;
if Parameter='RF_ABNET_CAT_IBUPROF';
variable="unadj_imal_cat_noH";
run;


data unadj_main_effect_noH; 
set 
unadj_ains_noH
unadj_ains_cat_noH
unadj_amal_noH
unadj_amal_cat_noH
unadj_iins_noH
unadj_iins_cat_noH
unadj_imal_noH
unadj_imal_cat_noH
; run;
data unadj_main_effect_noH; 
set unadj_main_effect_noH
(Keep= variable HazardRatio HRLowerCL HRUpperCL Label ClassVal0); run;
ods html file='E:\NCI REB\AARP\Results\Main_effects\unadj_main_effect_noH.xls' style=minimal;
proc print data= unadj_main_effect_noH; run;


***********************************************************************;
***********************************************************************;
********  Exclude those with heart disease dx					*******;
********  napping, TV,educ, and phyical activity in model		*******;
***********************************************************************;
***********************************************************************;

***********************************************;
********* 			ASPIRIN			***********;
********* 			IN SITU			***********;
***********************************************;

proc phreg data = melan_use multipass;
class rf_abnet_aspirin (ref='no')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR;
model exit_age*melanoma_ins(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=heart_full_ains;
run;
data heart_full_ains; set heart_full_ains;
if Parameter='RF_ABNET_ASPIRIN';
variable="RF_ABNET_ASPIRIN          ";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use')SEX birth_cohort utilizer_m utilizer_w RF_PHYS_MODVIG_CURR;
model exit_age*melanoma_ins(0)=rf_abnet_cat_aspirin SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=heart_full_ains_cat;
run;
data heart_full_ains_cat; set heart_full_ains_cat;
if Parameter='RF_ABNET_CAT_ASPIRIN';
variable="RF_ABNET_CAT_ASPIRIN          ";
run;


***********************************************;
********* 			ASPIRIN			***********;
********* 	   Malignant melanoma	***********;
***********************************************;

proc phreg data = melan_use multipass;
class rf_abnet_aspirin (ref='no')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR;
model exit_age*melanoma_mal(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=heart_full_amal;
run;
data heart_full_amal; set heart_full_amal;
if Parameter='RF_ABNET_ASPIRIN';
variable="RF_ABNET_ASPIRIN          ";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR;
model exit_age*melanoma_mal(0)=rf_abnet_cat_aspirin SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=heart_full_amal_cat;
run;
data heart_full_amal_cat; set heart_full_amal_cat;
if Parameter='RF_ABNET_CAT_ASPIRIN';
variable="RF_ABNET_CAT_ASPIRIN          ";
run;

***********************************************;
********* 			 IBU			***********;
********* 	   		IN SITU			***********;
***********************************************;

proc phreg data = melan_use multipass;
class rf_abnet_ibuprofen (ref='no')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR;
model exit_age*melanoma_ins(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=heart_full_iins;
run;
data heart_full_iins; set heart_full_iins;
if Parameter='RF_ABNET_IBUPROFEN';
variable="RF_ABNET_IBUPROFEN          ";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR;
model exit_age*melanoma_ins(0)=rf_abnet_cat_ibuprofen SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=heart_full_iins_cat;
run;
data heart_full_iins_cat; set heart_full_iins_cat;
if Parameter='RF_ABNET_CAT_IBUPROF';
variable="RF_ABNET_CAT_IBUPROF          ";
run;


***********************************************;
********* 			 IBU			***********;
********* 	   	  Malignant			***********;
***********************************************;

proc phreg data = melan_use multipass;
class rf_abnet_ibuprofen (ref='no')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR;
model exit_age*melanoma_mal(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=heart_full_imal;
run;
data heart_full_imal; set heart_full_imal;
if Parameter='RF_ABNET_IBUPROFEN';
variable="RF_ABNET_IBUPROFEN          ";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR;
model exit_age*melanoma_mal(0)=rf_abnet_cat_ibuprofen SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
where HEART=0;
ods output ParameterEstimates=heart_full_imal_cat;
run;
data heart_full_imal_cat; set heart_full_imal_cat;
if Parameter='RF_ABNET_CAT_IBUPROF';
variable="RF_ABNET_CAT_IBUPROF          ";
run;


data heart_full_main_effect; 
set 

heart_full_ains
heart_full_amal
heart_full_iins
heart_full_imal

heart_full_ains_cat
heart_full_amal_cat
heart_full_iins_cat
heart_full_imal_cat

; run;
data heart_full_main_effect; 
set heart_full_main_effect
(Keep= ClassVal0 variable HazardRatio HRLowerCL HRUpperCL Label); run;
ods html file='E:\NCI REB\AARP\Results\Main_effects\heart_full_main_effect.xls' style=minimal;
proc print data=heart_full_main_effect; run;



***********************************************************************;
***********************************************************************;
********  Not excluding those with heart disease				*******;
********  adjusting for heart disease							*******;
********  napping, TV,educ, and phyical activity in model		*******;
***********************************************************************;
***********************************************************************;

***********************************************;
********* 			ASPIRIN			***********;
********* 			IN SITU			***********;
***********************************************;

proc phreg data = melan_use multipass;
class rf_abnet_aspirin (ref='no')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART;
model exit_age*melanoma_ins(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=full_ains;
run;
data full_ains; set full_ains;
if Parameter='RF_ABNET_ASPIRIN';
variable="RF_ABNET_ASPIRIN          ";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use')SEX birth_cohort utilizer_m utilizer_w RF_PHYS_MODVIG_CURR HEART;
model exit_age*melanoma_ins(0)=rf_abnet_cat_aspirin SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=full_ains_cat;
run;
data full_ains_cat; set full_ains_cat;
if Parameter='RF_ABNET_CAT_ASPIRIN';
variable="RF_ABNET_CAT_ASPIRIN          ";
run;


***********************************************;
********* 			ASPIRIN			***********;
********* 	   Malignant melanoma	***********;
***********************************************;

proc phreg data = melan_use multipass;
class rf_abnet_aspirin (ref='no')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART;
model exit_age*melanoma_mal(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=full_amal;
run;
data full_amal; set full_amal;
if Parameter='RF_ABNET_ASPIRIN';
variable="RF_ABNET_ASPIRIN          ";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_aspirin (ref='no use')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART;
model exit_age*melanoma_mal(0)=rf_abnet_cat_aspirin SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=full_amal_cat;
run;
data full_amal_cat; set full_amal_cat;
if Parameter='RF_ABNET_CAT_ASPIRIN';
variable="RF_ABNET_CAT_ASPIRIN          ";
run;

***********************************************;
********* 			 IBU			***********;
********* 	   		IN SITU			***********;
***********************************************;

proc phreg data = melan_use multipass;
class rf_abnet_ibuprofen (ref='no')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART;
model exit_age*melanoma_ins(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=full_iins;
run;
data full_iins; set full_iins;
if Parameter='RF_ABNET_IBUPROFEN';
variable="RF_ABNET_IBUPROFEN          ";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART;
model exit_age*melanoma_ins(0)=rf_abnet_cat_ibuprofen SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=full_iins_cat;
run;
data full_iins_cat; set full_iins_cat;
if Parameter='RF_ABNET_CAT_IBUPROF';
variable="RF_ABNET_CAT_IBUPROF          ";
run;


***********************************************;
********* 			 IBU			***********;
********* 	   	  Malignant			***********;
***********************************************;

proc phreg data = melan_use multipass;
class rf_abnet_ibuprofen (ref='no')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART;
model exit_age*melanoma_mal(0)=rf_abnet_ibuprofen SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=full_imal;
run;
data full_imal; set full_imal;
if Parameter='RF_ABNET_IBUPROFEN';
variable="RF_ABNET_IBUPROFEN          ";
run;

proc phreg data = melan_use multipass;
class rf_abnet_cat_ibuprofen (ref='no use')SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART;
model exit_age*melanoma_mal(0)=rf_abnet_cat_ibuprofen SEX birth_cohort utilizer_m utilizer_w nap_comb TV_comb educm_comb RF_PHYS_MODVIG_CURR HEART exposure_jul_78_05 / entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=full_imal_cat;
run;
data full_imal_cat; set full_imal_cat;
if Parameter='RF_ABNET_CAT_IBUPROF';
variable="RF_ABNET_CAT_IBUPROF          ";
run;


data full_main_effect; 
set 

full_ains
full_ains_cat
full_amal
full_amal_cat
full_iins
full_iins_cat
full_imal
full_imal_cat

; run;
data full_main_effect; 
set full_main_effect
(Keep= ClassVal0 variable HazardRatio HRLowerCL HRUpperCL Label); run;
ods html file='E:\NCI REB\AARP\Results\Main_effects\full_main_effect.xls' style=minimal;
proc print data=full_main_effect; run;


*******************************************************;
*******************************************************;
********		Control for IBU					*******;
********		Among Aspirin exposure			*******;
*******************************************************;
*******************************************************;
********		Control for Aspirin				*******;
********		Among IBU exposure				*******;
*******************************************************;
*******************************************************;

***********************************************;
********* 			ASPIRIN			***********;
********* 			IN SITU			***********;
***********************************************;

proc phreg data = melan_use multipass;
class aspirin_collapse (ref='0')SEX birth_cohort utilizer_m utilizer_w ibu_collapse;
model exit_age*melanoma_ins(0)=aspirin_collapse SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05 ibu_collapse/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=ibucont_ins;
run;
data ibucont_aspirin_ins; set ibucont_ins;
if Parameter='aspirin_collapse';
variable="ibucont_asp_insitu          ";
run;


***********************************************;
********* 			ASPIRIN			***********;
********* 	   Malignant melanoma	***********;
***********************************************;

proc phreg data = melan_use multipass;
class aspirin_collapse (ref='0')SEX birth_cohort utilizer_m utilizer_w ibu_collapse;
model exit_age*melanoma_mal(0)=aspirin_collapse SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05 ibu_collapse/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=ibucont_mal;
run;
data ibucont_aspirin_mal; set ibucont_mal;
if Parameter='aspirin_collapse';
variable="ibucont_asp_mal          ";
run;

***********************************************;
********* 			 IBU			***********;
********* 	   		IN SITU			***********;
***********************************************;

proc phreg data = melan_use multipass;
class ibu_collapse (ref='0')SEX birth_cohort utilizer_m utilizer_w aspirin_collapse;
model exit_age*melanoma_ins(0)=ibu_collapse SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05 aspirin_collapse/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=aspcont_ins;
run;
data aspcont_ibu_ins; set aspcont_ins;
if Parameter='ibu_collapse';
variable="aspcont_ibu_ins          ";
run;

***********************************************;
********* 			 IBU			***********;
********* 	   	  Malignant			***********;
***********************************************;

proc phreg data = melan_use multipass;
class ibu_collapse (ref='0')SEX birth_cohort utilizer_m utilizer_w aspirin_collapse;
model exit_age*melanoma_mal(0)=ibu_collapse SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05 aspirin_collapse/ entry = entry_age RL; *** The RL option requests risk limits ***;
ods output ParameterEstimates=aspcont_mal;
run;
data aspcont_ibu_mal; set aspcont_mal;
if Parameter='ibu_collapse';
variable="aspcont_ibu_mal          ";
run;

data ibuaspcont_main_effect; 
set 
ibucont_aspirin_ins
ibucont_aspirin_mal
aspcont_ibu_ins
aspcont_ibu_mal
; run;
data ibuaspcont_main_effect; 
set ibuaspcont_main_effect
(Keep= variable HazardRatio HRLowerCL HRUpperCL Label); run;
ods html file='E:\NCI REB\AARP\Results\Main_effects\ibuaspcont_main_effect.xls' style=minimal;
proc print data= ibuaspcont_main_effect; run;

proc freq data=melan_use;
tables rf_abnet_cat_aspirin;
run;




