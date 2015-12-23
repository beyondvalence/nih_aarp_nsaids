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
# Updated: 20151223WED WTL
#
*******************************************************************/
libname conv 'C:\REB\NSAIDS melanoma AARP\Data\converted';
%include 'C:\REB\NSAIDS melanoma AARP\Analysis\format.risk.w.sas';

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
