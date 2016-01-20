********************************************************;
********* 			IN SITU					************;
********************************************************;
proc phreg data = melan_use multipass;
	class shebl_type (ref='1. Neither NSAID use')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_ins(0)=shebl_type 
				SEX
				yob
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
				utilizer_w 
	/ entry = entry_age RL; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_type_ins;
run;
data adj_type_ins; set adj_type_ins;
	if Parameter='shebl_type';
	variable="shebl_type_ins              ";
run;
proc phreg data = melan_use multipass;
	class shebl_asp_f (ref='1. Non User')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_ins(0)=shebl_asp_f 
				SEX
				yob
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_asp_ins;
run;
data adj_asp_ins; set adj_asp_ins;
	if Parameter='shebl_asp_f';
	variable="shebl_asp_f_ins              ";
run;
proc phreg data = melan_use multipass;
	title'rf physic';
	class shebl_non_f (ref='1. Non User')
				SEX
				agecat
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
				utilizer_w
				rf_physic_c;
	model exit_age*melanoma_ins(0)=shebl_non_f 
				SEX
				yob
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
				utilizer_w 
				rf_physic_c
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_non_ins;
run;
data adj_non_ins; set adj_non_ins;
	if Parameter='shebl_non_f';
	variable="shebl_non_f_ins              ";
run;

***********************************************;
********* 	   Malignant melanoma	***********;
***********************************************;

*** model: exit_age*melanoma_mal(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05;

proc phreg data = melan_use multipass;
	class shebl_type (ref='1. Neither NSAID use')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_mal(0)=shebl_type 
				SEX
				yob
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_type_mal;
run;
data adj_type_mal; set adj_type_mal;
	if Parameter='shebl_type';
	variable="shebl_type_mal              ";
run;
proc phreg data = melan_use multipass;
	class shebl_asp_f (ref='1. Non User')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_mal(0)=shebl_asp_f 
				SEX
				yob
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_asp_mal;
run;
data adj_asp_mal; set adj_asp_mal;
	if Parameter='shebl_asp_f';
	variable="shebl_asp_f_mal              ";
run;
proc phreg data = melan_use multipass;
	class shebl_non_f (ref='1. Non User')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_mal(0)=shebl_non_f 
				SEX
				yob
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_non_mal;
run;
data adj_non_mal; set adj_non_mal;
	if Parameter='shebl_non_f';
	variable="shebl_non_f_mal              ";
run;

data apriori_model; 
	set 
		adj_type_ins
		adj_asp_ins
		adj_non_ins
		adj_type_mal
		adj_asp_mal
		adj_non_mal
; run;
data apriori_model; 
title2'with yob, physic_1518_c, and no birth_cohort';
set apriori_model
(Keep= variable HazardRatio HRLowerCL HRUpperCL Label ClassVal0); run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\Main_effects\apriori\apriori_model_yob.xls' style=minimal;
proc print data= apriori_model; run; 
ods html close; ods html;

********************************************************;
********* 			IN SITU					************;
********************************************************;
proc phreg data = melan_use multipass;
	class shebl_type (ref='1. Neither NSAID use')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_ins(0)=shebl_type 
				SEX
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
				utilizer_w 
	/ entry = entry_age RL; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_type_ins;
run;
data adj_type_ins; set adj_type_ins;
	if Parameter='shebl_type';
	variable="shebl_type_ins              ";
run;
proc phreg data = melan_use multipass;
	class shebl_asp_f (ref='1. Non User')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_ins(0)=shebl_asp_f 
				SEX
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_asp_ins;
run;
data adj_asp_ins; set adj_asp_ins;
	if Parameter='shebl_asp_f';
	variable="shebl_asp_f_ins              ";
run;
proc phreg data = melan_use multipass;
	class shebl_non_f (ref='1. Non User')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_ins(0)=shebl_non_f 
				SEX
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_non_ins;
run;
data adj_non_ins; set adj_non_ins;
	if Parameter='shebl_non_f';
	variable="shebl_non_f_ins              ";
run;

***********************************************;
********* 	   Malignant melanoma	***********;
***********************************************;

*** model: exit_age*melanoma_mal(0)=rf_abnet_aspirin SEX birth_cohort utilizer_m utilizer_w exposure_jul_78_05;

proc phreg data = melan_use multipass;
	class shebl_type (ref='1. Neither NSAID use')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_mal(0)=shebl_type 
				SEX
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_type_mal;
run;
data adj_type_mal; set adj_type_mal;
	if Parameter='shebl_type';
	variable="shebl_type_mal              ";
run;
proc phreg data = melan_use multipass;
	class shebl_asp_f (ref='1. Non User')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_mal(0)=shebl_asp_f 
				SEX
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_asp_mal;
run;
data adj_asp_mal; set adj_asp_mal;
	if Parameter='shebl_asp_f';
	variable="shebl_asp_f_mal              ";
run;
proc phreg data = melan_use multipass;
	class shebl_non_f (ref='1. Non User')
				SEX
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
				utilizer_w;
	model exit_age*melanoma_mal(0)=shebl_non_f 
				SEX
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
				utilizer_w 
	/ entry = entry_age RL ; *** The RL option requests risk limits ***;
	ods output ParameterEstimates=adj_non_mal;
run;
data adj_non_mal; set adj_non_mal;
	if Parameter='shebl_non_f';
	variable="shebl_non_f_mal              ";
run;

data apriori_model; 
	set 
		adj_type_ins
		adj_asp_ins
		adj_non_ins
		adj_type_mal
		adj_asp_mal
		adj_non_mal
; run;
data apriori_model; 
title2'with no yob, physic_1518_c, and no birth_cohort';
set apriori_model
(Keep= variable HazardRatio HRLowerCL HRUpperCL Label ClassVal0); run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\Main_effects\apriori\apriori_model_noYob.xls' style=minimal;
proc print data= apriori_model; run; 
ods html close; ods html;

proc univariate data=melan_use;
	class shebl_type;
	var rf_personyrs;
run;
proc means data=melan_use;
	*class shebl_type;
	var rf_entry_age;
run;
proc freq data=melan_use;
	table (bmi_c agecat rf_physic_c)*shebl_type /missing norow ;
run;
