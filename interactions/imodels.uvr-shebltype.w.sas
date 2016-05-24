/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# tests interactions for UVR~shebl_type
#
# with SAS output to MS Excel
# uses melan and melan_r datasets
# 
# Created: May 18, 2016
# Updated: v20160524TUE WTL
#
*******************************************************************/
libname conv 'C:\REB\NSAIDS melanoma AARP\Data\converted';
%include 'C:\REB\NSAIDS melanoma AARP\Analysis\format.risk.w.sas';

data use;
	set conv.melan_use;
run;

*******************************************************************************;
** Base: UVRQ Analysis by shebl_type                    ***********************;
*******************************************************************************;
** shebl_type = 1 ****************************;
** uvrq_c ~ shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_type_me=1;
	ods output ParameterEstimates=uvrq_stype1;
run;
data rin_uvrq_stype1; set uvrq_stype1;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype1    ";
run;

** uvrq_c ~ shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_type_me=1;
	ods output ParameterEstimates=uvrq_stype1;
run;
data rma_uvrq_stype1; set uvrq_stype1;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype1    ";
run;

** shebl_type = 2 ****************************;
** uvrq_c ~ shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_type_me=2;
	ods output ParameterEstimates=uvrq_stype2;
run;
data rin_uvrq_stype2; set uvrq_stype2;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype2    ";
	
run;

** uvrq_c ~ shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_type_me=2;
	ods output ParameterEstimates=uvrq_stype2;
run;
data rma_uvrq_stype2; set uvrq_stype2;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype2    ";
run;

** shebl_type = 3 ****************************;
** uvrq_c ~ shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_type_me=3;
	ods output ParameterEstimates=uvrq_stype3;
run;
data rin_uvrq_stype3; set uvrq_stype3;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype3    ";
run;

** uvrq_c ~ shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_type_me=3;
	ods output ParameterEstimates=uvrq_stype3;
run;
data rma_uvrq_stype3; set uvrq_stype3;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype3    ";
run;

** shebl_type = 4 ****************************;
** uvrq_c ~ shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_type_me=4;
	ods output ParameterEstimates=uvrq_stype4;
run;
data rin_uvrq_stype4; set uvrq_stype4;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype4     ";
run;

** uvrq_c ~ shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_type_me=4;
	ods output ParameterEstimates=uvrq_stype4;
run;
data rma_uvrq_stype4; set uvrq_stype4;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype4    ";
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_uvrq_stype (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_uvrq_stype1  
		rma_uvrq_stype1
		rin_uvrq_stype2
		rma_uvrq_stype2
		rin_uvrq_stype3
		rma_uvrq_stype3
		rin_uvrq_stype4
		rma_uvrq_stype4
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
data base_uvrq_stypet (keep=Parameter classVal0 A_HR A_LL A_UL variable); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for UVQR quartile';
	title3 'By NSAID use type';
	title4 '20160524TUE WTL';
	set base_uvrq_stype; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.uvrq-shebltype.v1.xls' style=minimal;
proc print data= base_uvrq_stypet; run;
ods _all_ close; ods html;

** Pint for shebl_type;
proc phreg data = use multipass;
	class  shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq shebl_type_me shebl_type_me*uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	ods output ParameterEstimates=uvrq_stype_pint_ins;
run;
proc phreg data = use multipass;
	class  shebl_type_me (ref='1. Neither NSAID use')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq shebl_type_me shebl_type_me*uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	ods output ParameterEstimates=uvrq_stype_pint_mal;
run;


*******************************************************************************;
** Base: shebl_type interaction by uvrq_5c              ***********************;
*******************************************************************************;
** shebl_type = 1 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=1;
	ods output ParameterEstimates=uvrq_stype1;
run;
data rin_uvrq_stype1; set uvrq_stype1;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype1     ";
	
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=1;
	ods output ParameterEstimates=uvrq_stype1;
run;
data rma_uvrq_stype1; set uvrq_stype1;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype1    ";
	
run;

** shebl_type = 2 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=2;
	ods output ParameterEstimates=uvrq_stype2;
run;
data rin_uvrq_stype2; set uvrq_stype2;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype2    ";
	
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=2;
	ods output ParameterEstimates=uvrq_stype2;
run;
data rma_uvrq_stype2; set uvrq_stype2;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype2    ";
	
run;

** shebl_type = 3 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=3;
	ods output ParameterEstimates=uvrq_stype3;
run;
data rin_uvrq_stype3; set uvrq_stype3;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype3    ";
	
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=3;
	ods output ParameterEstimates=uvrq_stype3;
run;
data rma_uvrq_stype3; set uvrq_stype3;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype3    ";
	
run;

** shebl_type = 4 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=4;
	ods output ParameterEstimates=uvrq_stype4;
run;
data rin_uvrq_stype4; set uvrq_stype4;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype4    ";
	
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=4;
	ods output ParameterEstimates=uvrq_stype4;
run;
data rma_uvrq_stype4; set uvrq_stype4;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype4    ";
	
run;

** shebl_type = 5 ****************************;
** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=5;
	ods output ParameterEstimates=uvrq_stype5;
run;
data rin_uvrq_stype5; set uvrq_stype5;
	where Parameter='UVRQ';
	variable="rin_uvrq_stype5    ";
	
run;

** uvrq_5c * shebl_type;
proc phreg data = use multipass;
	class uvrq (ref='1. >176 and <=186.255') 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			shebl_type_me
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where uvrq_5c=5;
	ods output ParameterEstimates=uvrq_stype5;
run;
data rma_uvrq_stype5; set uvrq_stype5;
	where Parameter='UVRQ';
	variable="rma_uvrq_stype5    ";
	
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_uvrq_stype5 (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_uvrq_stype1  
		rma_uvrq_stype1
		rin_uvrq_stype2
		rma_uvrq_stype2
		rin_uvrq_stype3
		rma_uvrq_stype3
		rin_uvrq_stype4
		rma_uvrq_stype4
		rin_uvrq_stype5
		rma_uvrq_stype5
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
data base_uvrq_stype5t (keep=Parameter class uvrq (ref='1. >176 and <=186.255')Val0 A_HR A_LL A_UL uvr); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for NSAID use type';
	title3 'By uvrq_5c quintile';
	title4 '20160523 WTL';
	set base_uvrq_stype5; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.shebltype.uvrq5.v1.xls' style=minimal;
proc print data= base_uvrq_stype5t; run;
ods _all_ close; ods html;
