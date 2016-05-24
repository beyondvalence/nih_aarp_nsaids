/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# tests interactions for UVR by shebl_asp
#
# with SAS output to MS Excel
# uses melan and melan_r datasets
# 
# Created: May 23, 2016
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
** shebl_asp = 0 ****************************;
** uvrq * shebl_asp;
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
	where shebl_asp_me=0;
	ods output ParameterEstimates=uvrqc_Sasp0;
run;
data rin_uvrqc_Sasp0; set uvrqc_Sasp0;
	where Parameter='UVRQ';
	variable="rin_uvrqc_Sasp0    ";
run;

proc phreg data = use multipass;
	class
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=0;
	ods output ParameterEstimates=uvrq_Sasp0;
run;
data rin_uvrq_Sasp0; set uvrq_Sasp0;
	where Parameter='UVRQ';
	variable="rin_uvrq_Sasp0    ";
run;

** uvrq * shebl_asp;
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
	where shebl_asp_me=0;
	ods output ParameterEstimates=uvrqc_Sasp0;
run;
data rma_uvrqc_Sasp0; set uvrqc_Sasp0;
	where Parameter='UVRQ';
	variable="rma_uvrqc_Sasp0    ";
run;

** uvrq * shebl_asp;
proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=0;
	ods output ParameterEstimates=uvrq_Sasp0;
run;
data rma_uvrq_Sasp0; set uvrq_Sasp0;
	where Parameter='UVRQ';
	variable="rma_uvrq_Sasp0    ";
run;

** shebl_asp = 1 ****************************;
** uvrq * shebl_asp;
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
	where shebl_asp_me=1;
	ods output ParameterEstimates=uvrqc_Sasp1;
run;
data rin_uvrqc_Sasp1; set uvrqc_Sasp1;
	where Parameter='UVRQ';
	variable="rin_uvrqc_Sasp1     ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=1;
	ods output ParameterEstimates=uvrq_Sasp1;
run;
data rin_uvrq_Sasp1; set uvrq_Sasp1;
	where Parameter='UVRQ';
	variable="rin_uvrq_Sasp1     ";
run;

** uvrq * shebl_asp;
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
	where shebl_asp_me=1;
	ods output ParameterEstimates=uvrqc_Sasp1;
run;
data rma_uvrqc_Sasp1; set uvrqc_Sasp1;
	where Parameter='UVRQ';
	variable="rma_uvrqc_Sasp1    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=1;
	ods output ParameterEstimates=uvrq_Sasp1;
run;
data rma_uvrq_Sasp1; set uvrq_Sasp1;
	where Parameter='UVRQ';
	variable="rma_uvrq_Sasp1    ";
run;

** shebl_asp = 2 ****************************;
** uvrq * shebl_asp;
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
	where shebl_asp_me=2;
	ods output ParameterEstimates=uvrqc_Sasp2;
run;
data rin_uvrqc_Sasp2; set uvrqc_Sasp2;
	where Parameter='UVRQ';
	variable="rin_uvrqc_Sasp2    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=2;
	ods output ParameterEstimates=uvrq_Sasp2;
run;
data rin_uvrq_Sasp2; set uvrq_Sasp2;
	where Parameter='UVRQ';
	variable="rin_uvrq_Sasp2    ";
run;

** uvrq * shebl_asp;
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
	where shebl_asp_me=2;
	ods output ParameterEstimates=uvrqc_Sasp2;
run;
data rma_uvrqc_Sasp2; set uvrqc_Sasp2;
	where Parameter='UVRQ';
	variable="rma_uvrqc_Sasp2    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=2;
	ods output ParameterEstimates=uvrq_Sasp2;
run;
data rma_uvrq_Sasp2; set uvrq_Sasp2;
	where Parameter='UVRQ';
	variable="rma_uvrq_Sasp2    ";
run;

** shebl_asp = 3 ****************************;
** uvrq * shebl_asp;
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
	where shebl_asp_me=3;
	ods output ParameterEstimates=uvrqc_Sasp3;
run;
data rin_uvrqc_Sasp3; set uvrqc_Sasp3;
	where Parameter='UVRQ';
	variable="rin_uvrqc_Sasp3    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=3;
	ods output ParameterEstimates=uvrq_Sasp3;
run;
data rin_uvrq_Sasp3; set uvrq_Sasp3;
	where Parameter='UVRQ';
	variable="rin_uvrq_Sasp3    ";
run;

** uvrq * shebl_asp;
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
	where shebl_asp_me=3;
	ods output ParameterEstimates=uvrqc_Sasp3;
run;
data rma_uvrqc_Sasp3; set uvrqc_Sasp3;
	where Parameter='UVRQ';
	variable="rma_uvrqc_Sasp3    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=3;
	ods output ParameterEstimates=uvrq_Sasp3;
run;
data rma_uvrq_Sasp3; set uvrq_Sasp3;
	where Parameter='UVRQ';
	variable="rma_uvrq_Sasp3    ";
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_uvrqc_Sasp (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_uvrq_Sasp0
		rin_uvrqc_Sasp0
		rin_uvrq_Sasp1 
		rin_uvrqc_Sasp1 
		rin_uvrq_Sasp2
		rin_uvrqc_Sasp2
		rin_uvrq_Sasp3
		rin_uvrqc_Sasp3

		rma_uvrq_Sasp0
		rma_uvrqc_Sasp0
		rma_uvrq_Sasp1		
		rma_uvrqc_Sasp1
		rma_uvrq_Sasp2
		rma_uvrqc_Sasp2
		rma_uvrq_Sasp3
		rma_uvrqc_Sasp3
	; 
run;
** use this one, without in situ;
/*data base_fmenstr_uvrqc_mal (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set bma_fmenstr_uvrq1
		bma_fmenstr_uvrq2
		bma_fmenstr_uvrq3
		bma_fmenstr_uvrq4
	; 
run;*/
data base_uvrqc_Saspt (keep=Parameter ClassVal0 A_HR A_LL A_UL variable); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for NSAID aspirin duration';
	title3 'By UVQR quartile';
	title4 '20160523MON WTL';
	set base_uvrqc_Sasp; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.sheblasp.uvrq.v1.xls' style=minimal;
proc print data= base_uvrqc_Saspt; run;
ods _all_ close; ods html;

**Pinteraction**;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq shebl_asp_me shebl_asp_me*uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 

	ods output ParameterEstimates=uvrqc_Sasp_pint_ins;
run;
proc phreg data = use multipass;
	class shebl_asp_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq shebl_asp_me shebl_asp_me*uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 

	ods output ParameterEstimates=uvrqc_Sasp_pint_mal;
run;



*******************************************************************************;
** Base: uvrq_5 interaction by shebl_asp              ***********************;
*******************************************************************************;
** shebl_asp = 0 ****************************;
** uvrq_5 * shebl_asp;
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
	where shebl_asp_me=0;
	ods output ParameterEstimates=uvrq_5_Sasp0;
run;
data rin_uvrq_5_Sasp0; set uvrq_5_Sasp0;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Sasp0    ";
run;

proc phreg data = use multipass;
	class
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=0;
	ods output ParameterEstimates=uvrq_5_Sasp0;
run;
data rin_uvrq_5_Sasp0; set uvrq_5_Sasp0;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Sasp0    ";
run;

** uvrq_5 * shebl_asp;
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
	where shebl_asp_me=0;
	ods output ParameterEstimates=uvrq_5_Sasp0;
run;
data rma_uvrq_5_Sasp0; set uvrq_5_Sasp0;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Sasp0    ";
run;

** uvrq_5 * shebl_asp;
proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=0;
	ods output ParameterEstimates=uvrq_5_Sasp0;
run;
data rma_uvrq_5_Sasp0; set uvrq_5_Sasp0;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Sasp0    ";
run;

** shebl_asp = 1 ****************************;
** uvrq_5 * shebl_asp;
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
	where shebl_asp_me=1;
	ods output ParameterEstimates=uvrq_5c_Sasp1;
run;
data rin_uvrq_5c_Sasp1; set uvrq_5c_Sasp1;
	where Parameter='UVRQ';
	variable="rin_uvrq_5c_Sasp1     ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=1;
	ods output ParameterEstimates=uvrq_5_Sasp1;
run;
data rin_uvrq_5_Sasp1; set uvrq_5_Sasp1;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Sasp1     ";
run;

** uvrq_5 * shebl_asp;
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
	where shebl_asp_me=1;
	ods output ParameterEstimates=uvrq_5c_Sasp1;
run;
data rma_uvrq_5c_Sasp1; set uvrq_5c_Sasp1;
	where Parameter='UVRQ';
	variable="rma_uvrq_5c_Sasp1    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=1;
	ods output ParameterEstimates=uvrq_5_Sasp1;
run;
data rma_uvrq_5_Sasp1; set uvrq_5_Sasp1;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Sasp1    ";
run;

** shebl_asp = 2 ****************************;
** uvrq_5 * shebl_asp;
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
	where shebl_asp_me=2;
	ods output ParameterEstimates=uvrq_5c_Sasp2;
run;
data rin_uvrq_5c_Sasp2; set uvrq_5c_Sasp2;
	where Parameter='UVRQ';
	variable="rin_uvrq_5c_Sasp2    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=2;
	ods output ParameterEstimates=uvrq_5_Sasp2;
run;
data rin_uvrq_5_Sasp2; set uvrq_5_Sasp2;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Sasp2    ";
run;

** uvrq_5 * shebl_asp;
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
	where shebl_asp_me=2;
	ods output ParameterEstimates=uvrq_5c_Sasp2;
run;
data rma_uvrq_5c_Sasp2; set uvrq_5c_Sasp2;
	where Parameter='UVRQ';
	variable="rma_uvrq_5c_Sasp2    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=2;
	ods output ParameterEstimates=uvrq_5_Sasp2;
run;
data rma_uvrq_5_Sasp2; set uvrq_5_Sasp2;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Sasp2    ";
run;

** shebl_asp = 3 ****************************;
** uvrq_5 * shebl_asp;
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
	where shebl_asp_me=3;
	ods output ParameterEstimates=uvrq_5c_Sasp3;
run;
data rin_uvrq_5c_Sasp3; set uvrq_5c_Sasp3;
	where Parameter='UVRQ';
	variable="rin_uvrq_5c_Sasp3    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=3;
	ods output ParameterEstimates=uvrq_5_Sasp3;
run;
data rin_uvrq_5_Sasp3; set uvrq_5_Sasp3;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Sasp3    ";
run;

** uvrq_5 * shebl_asp;
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
	where shebl_asp_me=3;
	ods output ParameterEstimates=uvrq_5c_Sasp3;
run;
data rma_uvrq_5c_Sasp3; set uvrq_5c_Sasp3;
	where Parameter='UVRQ';
	variable="rma_uvrq_5c_Sasp3    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_asp_me=3;
	ods output ParameterEstimates=uvrq_5_Sasp3;
run;
data rma_uvrq_5_Sasp3; set uvrq_5_Sasp3;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Sasp3    ";
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_uvrqc_Sasp (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_uvrq_5_Sasp0
		rin_uvrq_5c_Sasp0
		rma_uvrq_5_Sasp0
		rma_uvrq_5c_Sasp0
		rin_uvrq_5_Sasp1 
		rin_uvrq_5c_Sasp1 
		rma_uvrq_5_Sasp1		
		rma_uvrq_5c_Sasp1
		rin_uvrq_5_Sasp2
		rin_uvrq_5c_Sasp2
		rma_uvrq_5_Sasp2
		rma_uvrq_5c_Sasp2
		rin_uvrq_5_Sasp3
		rin_uvrq_5c_Sasp3
		rma_uvrq_5_Sasp3
		rma_uvrq_5c_Sasp3
	; 
run;
** use this one, without in situ;
/*data base_fmenstr_uvrqc_mal (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set bma_fmenstr_uvrq1
		bma_fmenstr_uvrq2
		bma_fmenstr_uvrq3
		bma_fmenstr_uvrq4
	; 
run;*/
data base_uvrqc_Saspt (keep=Parameter ClassVal0 A_HR A_LL A_UL variable); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for NSAID aspirin duration';
	title3 'By UVQR quartile';
	title4 '20160523MON WTL';
	set base_uvrqc_Sasp; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.sheblasp.uvrq.v1.xls' style=minimal;
proc print data= base_uvrqc_Saspt; run;
ods _all_ close; ods html;
