/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# tests interactions
#
# with SAS output to MS Excel
# uses melan and melan_r datasets
# 
# Created: May 18, 2016
# Updated: v20160518WED WTL
# Under git version control
#
*******************************************************************/
libname conv 'C:\REB\NSAIDS melanoma AARP\Data\converted';
%include 'C:\REB\NSAIDS melanoma AARP\Analysis\format.risk.w.sas';

data use;
	set conv.melan_use;
run;

*******************************************************************************;
** Base: shebl_type Analysis by UVRQ                       ***********************;
*******************************************************************************;
** UVRQ = 1 ****************************;
** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=1;
	ods output ParameterEstimates=stype_uvrq1;
run;
data rin_stype_uvrq1; set stype_uvrq1;
	where Parameter='shebl_type_me';
	variable="bin_stype_uvrq1     ";
run;

** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=1;
	ods output ParameterEstimates=stype_uvrq1;
run;
data rma_stype_uvrq1; set stype_uvrq1;
	where Parameter='shebl_type_me';
	variable="bma_stype_uvrq1    ";
	uvr = 'UVRQ 1';
run;

** UVRQ = 2 ****************************;
** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=2;
	ods output ParameterEstimates=stype_uvrq2;
run;
data rin_stype_uvrq2; set stype_uvrq2;
	where Parameter='shebl_type_me';
	variable="bin_stype_uvrq2    ";
run;

** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=2;
	ods output ParameterEstimates=stype_uvrq2;
run;
data rma_stype_uvrq2; set stype_uvrq2;
	where Parameter='shebl_type_me';
	variable="bma_stype_uvrq2    ";
	uvr = 'UVRQ 2';
run;

** UVRQ = 3 ****************************;
** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=3;
	ods output ParameterEstimates=stype_uvrq3;
run;
data rin_stype_uvrq3; set stype_uvrq3;
	where Parameter='shebl_type_me';
	variable="bin_stype_uvrq3    ";
run;

** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=3;
	ods output ParameterEstimates=stype_uvrq3;
run;
data rma_stype_uvrq3; set stype_uvrq3;
	where Parameter='shebl_type_me';
	variable="rma_stype_uvrq3    ";
	uvr = 'UVRQ 3';
run;

** UVRQ = 4 ****************************;
** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=4;
	ods output ParameterEstimates=stype_uvrq4;
run;
data rin_stype_uvrq4; set stype_uvrq4;
	where Parameter='shebl_type_me';
	variable="rin_stype_uvrq4    ";
run;

** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=4;
	ods output ParameterEstimates=stype_uvrq4;
run;
data rma_stype_uvrq4; set stype_uvrq4;
	where Parameter='shebl_type_me';
	variable="rma_stype_uvrq4    ";
	uvr = 'UVRQ 4';
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_stype_uvrq (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_stype_uvrq1  
		rma_stype_uvrq1
		rin_stype_uvrq2
		rma_stype_uvrq2
		rin_stype_uvrq3
		rma_stype_uvrq3
		rin_stype_uvrq4
		rma_stype_uvrq4
	; 
run;
** use this one, without in situ;
/*data base_fmenstr_uvrq_mal (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set bma_fmenstr_uvrq1
		bma_fmenstr_uvrq2
		bma_fmenstr_uvrq3
		bma_fmenstr_uvrq4
	; 
run;*/
data base_stype_uvrqt (keep=Parameter ClassVal0 A_HR A_LL A_UL uvr); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for NSAID use type';
	title3 'By UVQR quartile';
	title4 '20160518WED WTL';
	set base_stype_uvrq; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.shebltype.uvrq.v1.xls' style=minimal;
proc print data= base_stype_uvrqt; run;
ods _all_ close; ods html;
