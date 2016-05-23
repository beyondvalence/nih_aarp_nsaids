/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# tests interactions for shebl_asp and UVR
#
# with SAS output to MS Excel
# uses melan and melan_r datasets
# 
# Created: May 18, 2016
# Updated: v20160523MON WTL
#
*******************************************************************/
libname conv 'C:\REB\NSAIDS melanoma AARP\Data\converted';
%include 'C:\REB\NSAIDS melanoma AARP\Analysis\format.risk.w.sas';

data use;
	set conv.melan_use;
run;

proc freq data = use;
	tables shebl_asp_me*melanoma_c;
run;
*******************************************************************************;
** Base: shebl_asp Analysis by UVRQ                    ***********************;
*******************************************************************************;
** UVRQ = 1 ****************************;
** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=1;
	ods output ParameterEstimates=sasp_uvrq1;
run;
data rin_sasp_uvrq1; set sasp_uvrq1;
	where Parameter='shebl_asp_me';
	variable="bin_sasp_uvrq1     ";
	melanoma = 'in_situ';
run;

** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=1;
	ods output ParameterEstimates=sasp_uvrq1;
run;
data rma_sasp_uvrq1; set sasp_uvrq1;
	where Parameter='shebl_asp_me';
	variable="bma_sasp_uvrq1    ";
	melanoma = 'malignant';
run;

** UVRQ = 2 ****************************;
** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=2;
	ods output ParameterEstimates=sasp_uvrq2;
run;
data rin_sasp_uvrq2; set sasp_uvrq2;
	where Parameter='shebl_asp_me';
	variable="bin_sasp_uvrq2    ";
	melanoma = 'in_situ';
run;

** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=2;
	ods output ParameterEstimates=sasp_uvrq2;
run;
data rma_sasp_uvrq2; set sasp_uvrq2;
	where Parameter='shebl_asp_me';
	variable="bma_sasp_uvrq2    ";
	melanoma = 'malignant';
run;

** UVRQ = 3 ****************************;
** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=3;
	ods output ParameterEstimates=sasp_uvrq3;
run;
data rin_sasp_uvrq3; set sasp_uvrq3;
	where Parameter='shebl_asp_me';
	variable="bin_sasp_uvrq3    ";
	melanoma = 'in_situ';
run;

** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=3;
	ods output ParameterEstimates=sasp_uvrq3;
run;
data rma_sasp_uvrq3; set sasp_uvrq3;
	where Parameter='shebl_asp_me';
	variable="rma_sasp_uvrq3    ";
	melanoma = 'malignant';
run;

** UVRQ = 4 ****************************;
** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=4;
	ods output ParameterEstimates=sasp_uvrq4;
run;
data rin_sasp_uvrq4; set sasp_uvrq4;
	where Parameter='shebl_asp_me';
	variable="rin_sasp_uvrq4    ";
	melanoma = 'in_situ';
run;

** uvrq_c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq=4;
	ods output ParameterEstimates=sasp_uvrq4;
run;
data rma_sasp_uvrq4; set sasp_uvrq4;
	where Parameter='shebl_asp_me';
	variable="rma_sasp_uvrq4    ";
	melanoma = 'in_situ';
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_sasp_uvrq (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_sasp_uvrq1  
		rma_sasp_uvrq1
		rin_sasp_uvrq2
		rma_sasp_uvrq2
		rin_sasp_uvrq3
		rma_sasp_uvrq3
		rin_sasp_uvrq4
		rma_sasp_uvrq4
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
data base_sasp_uvrqt (keep=Parameter ClassVal0 A_HR A_LL A_UL variable); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for NSAID use type';
	title3 'By UVQR quartile';
	title4 '20160523MON WTL';
	set base_sasp_uvrq; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.sheblasp.uvrq.v1.xls' style=minimal;
proc print data= base_sasp_uvrqt; run;
ods _all_ close; ods html;



*******************************************************************************;
** Base: shebl_type interaction by uvrq_5c              ***********************;
*******************************************************************************;
** UVRQ = 1 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=1;
	ods output ParameterEstimates=sasp_uvrq1;
run;
data rin_sasp_uvrq1; set sasp_uvrq1;
	where Parameter='shebl_asp_me';
	variable="bin_sasp_uvrq1     ";
	melanoma = 'in_situ';
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=1;
	ods output ParameterEstimates=sasp_uvrq1;
run;
data rma_sasp_uvrq1; set sasp_uvrq1;
	where Parameter='shebl_asp_me';
	variable="bma_sasp_uvrq1    ";
	melanoma = 'malignant';
run;

** UVRQ = 2 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=2;
	ods output ParameterEstimates=sasp_uvrq2;
run;
data rin_sasp_uvrq2; set sasp_uvrq2;
	where Parameter='shebl_asp_me';
	variable="bin_sasp_uvrq2    ";
	melanoma = 'in_situ';
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=2;
	ods output ParameterEstimates=sasp_uvrq2;
run;
data rma_sasp_uvrq2; set sasp_uvrq2;
	where Parameter='shebl_asp_me';
	variable="bma_sasp_uvrq2    ";
	melanoma = 'malignant';
run;

** UVRQ = 3 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=3;
	ods output ParameterEstimates=sasp_uvrq3;
run;
data rin_sasp_uvrq3; set sasp_uvrq3;
	where Parameter='shebl_asp_me';
	variable="bin_sasp_uvrq3    ";
	melanoma = 'in_situ';
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=3;
	ods output ParameterEstimates=sasp_uvrq3;
run;
data rma_sasp_uvrq3; set sasp_uvrq3;
	where Parameter='shebl_asp_me';
	variable="rma_sasp_uvrq3    ";
	melanoma = 'malignant';
run;

** UVRQ = 4 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=4;
	ods output ParameterEstimates=sasp_uvrq4;
run;
data rin_sasp_uvrq4; set sasp_uvrq4;
	where Parameter='shebl_asp_me';
	variable="rin_sasp_uvrq4    ";
	melanoma = 'in_situ';
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=4;
	ods output ParameterEstimates=sasp_uvrq4;
run;
data rma_sasp_uvrq4; set sasp_uvrq4;
	where Parameter='shebl_asp_me';
	variable="rma_sasp_uvrq4    ";
	melanoma = 'malignant';
run;

** UVRQ = 5 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=5;
	ods output ParameterEstimates=sasp_uvrq5;
run;
data rin_sasp_uvrq5; set sasp_uvrq5;
	where Parameter='shebl_asp_me';
	variable="rin_sasp_uvrq5    ";
	melanoma = 'in_situ';
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_asp_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=5;
	ods output ParameterEstimates=sasp_uvrq5;
run;
data rma_sasp_uvrq5; set sasp_uvrq5;
	where Parameter='shebl_asp_me';
	variable="rma_sasp_uvrq5    ";
	melanoma = 'malignant';
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_sasp_uvrq5 (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_sasp_uvrq1  
		rma_sasp_uvrq1
		rin_sasp_uvrq2
		rma_sasp_uvrq2
		rin_sasp_uvrq3
		rma_sasp_uvrq3
		rin_sasp_uvrq4
		rma_sasp_uvrq4
		rin_sasp_uvrq5
		rma_sasp_uvrq5
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
data base_sasp_uvrq5t (keep=Parameter ClassVal0 A_HR A_LL A_UL uvr); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for NSAID use type';
	title3 'By uvrq_5c quintile';
	title4 '20160523 WTL';
	set base_sasp_uvrq5; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.shebltype.uvrq5.v1.xls' style=minimal;
proc print data= base_sasp_uvrq5t; run;
ods _all_ close; ods html;
