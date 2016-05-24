/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# tests interactions for UVR by shebl_non
#
# with SAS output to MS Excel
# uses melan and melan_r datasets
# 
# Created: May 23, 2016
# Updated: v20160524TUE WTL
#
*******************************************************************/
libname conv 'C:\REB\NSAIDS melanoma AARP\Data\converted';
%include 'C:\REB\NSAIDS melanoma AARP\Analysis\format.risk.w.sas';

data use;
	set conv.melan_use;
run;

proc freq data = use;
	tables shebl_non_me*melanoma_c;
run;
*******************************************************************************;
** Base: shebl_non Analysis by UVRQ                    ***********************;
*******************************************************************************;
** shebl_non = 0 ****************************;
** uvrq * shebl_non;
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
	where shebl_non_me=0;
	ods output ParameterEstimates=uvrqc_Snon0;
run;
data rin_uvrqc_Snon0; set uvrqc_Snon0;
	where Parameter='UVRQ';
	variable="rin_uvrqc_Snon0    ";
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
	where shebl_non_me=0;
	ods output ParameterEstimates=uvrq_Snon0;
run;
data rin_uvrq_Snon0; set uvrq_Snon0;
	where Parameter='UVRQ';
	variable="rin_uvrq_Snon0    ";
run;

** uvrq * shebl_non;
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
	where shebl_non_me=0;
	ods output ParameterEstimates=uvrqc_Snon0;
run;
data rma_uvrqc_Snon0; set uvrqc_Snon0;
	where Parameter='UVRQ';
	variable="rma_uvrqc_Snon0    ";
run;

** uvrq * shebl_non;
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
	where shebl_non_me=0;
	ods output ParameterEstimates=uvrq_Snon0;
run;
data rma_uvrq_Snon0; set uvrq_Snon0;
	where Parameter='UVRQ';
	variable="rma_uvrq_Snon0    ";
run;

** shebl_non = 1 ****************************;
** uvrq * shebl_non;
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
	where shebl_non_me=1;
	ods output ParameterEstimates=uvrqc_Snon1;
run;
data rin_uvrqc_Snon1; set uvrqc_Snon1;
	where Parameter='UVRQ';
	variable="rin_uvrqc_Snon1     ";
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
	where shebl_non_me=1;
	ods output ParameterEstimates=uvrq_Snon1;
run;
data rin_uvrq_Snon1; set uvrq_Snon1;
	where Parameter='UVRQ';
	variable="rin_uvrq_Snon1     ";
run;

** uvrq * shebl_non;
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
	where shebl_non_me=1;
	ods output ParameterEstimates=uvrqc_Snon1;
run;
data rma_uvrqc_Snon1; set uvrqc_Snon1;
	where Parameter='UVRQ';
	variable="rma_uvrqc_Snon1    ";
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
	where shebl_non_me=1;
	ods output ParameterEstimates=uvrq_Snon1;
run;
data rma_uvrq_Snon1; set uvrq_Snon1;
	where Parameter='UVRQ';
	variable="rma_uvrq_Snon1    ";
run;

** shebl_non = 2 ****************************;
** uvrq * shebl_non;
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
	where shebl_non_me=2;
	ods output ParameterEstimates=uvrqc_Snon2;
run;
data rin_uvrqc_Snon2; set uvrqc_Snon2;
	where Parameter='UVRQ';
	variable="rin_uvrqc_Snon2    ";
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
	where shebl_non_me=2;
	ods output ParameterEstimates=uvrq_Snon2;
run;
data rin_uvrq_Snon2; set uvrq_Snon2;
	where Parameter='UVRQ';
	variable="rin_uvrq_Snon2    ";
run;

** uvrq * shebl_non;
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
	where shebl_non_me=2;
	ods output ParameterEstimates=uvrqc_Snon2;
run;
data rma_uvrqc_Snon2; set uvrqc_Snon2;
	where Parameter='UVRQ';
	variable="rma_uvrqc_Snon2    ";
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
	where shebl_non_me=2;
	ods output ParameterEstimates=uvrq_Snon2;
run;
data rma_uvrq_Snon2; set uvrq_Snon2;
	where Parameter='UVRQ';
	variable="rma_uvrq_Snon2    ";
run;

** shebl_non = 3 ****************************;
** uvrq * shebl_non;
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
	where shebl_non_me=3;
	ods output ParameterEstimates=uvrqc_Snon3;
run;
data rin_uvrqc_Snon3; set uvrqc_Snon3;
	where Parameter='UVRQ';
	variable="rin_uvrqc_Snon3    ";
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
	where shebl_non_me=3;
	ods output ParameterEstimates=uvrq_Snon3;
run;
data rin_uvrq_Snon3; set uvrq_Snon3;
	where Parameter='UVRQ';
	variable="rin_uvrq_Snon3    ";
run;

** uvrq * shebl_non;
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
	where shebl_non_me=3;
	ods output ParameterEstimates=uvrqc_Snon3;
run;
data rma_uvrqc_Snon3; set uvrqc_Snon3;
	where Parameter='UVRQ';
	variable="rma_uvrqc_Snon3    ";
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
	where shebl_non_me=3;
	ods output ParameterEstimates=uvrq_Snon3;
run;
data rma_uvrq_Snon3; set uvrq_Snon3;
	where Parameter='UVRQ';
	variable="rma_uvrq_Snon3    ";
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_uvrqc_Snon (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_uvrq_Snon0
		rin_uvrqc_Snon0
		rin_uvrq_Snon1 
		rin_uvrqc_Snon1 
		rin_uvrq_Snon2
		rin_uvrqc_Snon2
		rin_uvrq_Snon3
		rin_uvrqc_Snon3

		rma_uvrq_Snon0
		rma_uvrqc_Snon0
		rma_uvrq_Snon1		
		rma_uvrqc_Snon1
		rma_uvrq_Snon2
		rma_uvrqc_Snon2
		rma_uvrq_Snon3
		rma_uvrqc_Snon3
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
data base_uvrqc_Snont (keep=Parameter ClassVal0 A_HR A_LL A_UL variable); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for NSAID non-aspirin';
	title3 'By UVQR quartile';
	title4 '20160524TUE WTL';
	set base_uvrqc_Snon; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.sheblnon.uvrq.v1.xls' style=minimal;
proc print data= base_uvrqc_Snont; run;
ods _all_ close; ods html;

** Pint **;
proc phreg data = use multipass;
	class shebl_non_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq shebl_non_me shebl_non_me*uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	ods output ParameterEstimates=uvrq_Snon_pint_ins;
run;
proc phreg data = use multipass;
	class shebl_non_me (ref='1. Non User')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq shebl_non_me shebl_non_me*uvrq
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	ods output ParameterEstimates=uvrq_Snon_pint_mal;
run;


*******************************************************************************;
** Base: uvrq_5 interaction by shebl_non              ***********************;
*******************************************************************************;
** shebl_non = 0 ****************************;
** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class uvrq_5 (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=0;
	ods output ParameterEstimates=uvrq_5_Snon0;
run;
data rin_uvrq_5_Snon0; set uvrq_5_Snon0;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Snon0    ";
run;

proc phreg data = use multipass;
	class
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=0;
	ods output ParameterEstimates=uvrq_5_Snon0;
run;
data rin_uvrq_5_Snon0; set uvrq_5_Snon0;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Snon0    ";
run;

** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class uvrq_5 (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=0;
	ods output ParameterEstimates=uvrq_5_Snon0;
run;
data rma_uvrq_5_Snon0; set uvrq_5_Snon0;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Snon0    ";
run;

** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=0;
	ods output ParameterEstimates=uvrq_5_Snon0;
run;
data rma_uvrq_5_Snon0; set uvrq_5_Snon0;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Snon0    ";
run;

** shebl_non = 1 ****************************;
** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class uvrq_5 (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=1;
	ods output ParameterEstimates=uvrq_5c_Snon1;
run;
data rin_uvrq_5c_Snon1; set uvrq_5c_Snon1;
	where Parameter='UVRQ';
	variable="rin_uvrq_5c_Snon1     ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=1;
	ods output ParameterEstimates=uvrq_5_Snon1;
run;
data rin_uvrq_5_Snon1; set uvrq_5_Snon1;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Snon1     ";
run;

** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class uvrq_5 (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=1;
	ods output ParameterEstimates=uvrq_5c_Snon1;
run;
data rma_uvrq_5c_Snon1; set uvrq_5c_Snon1;
	where Parameter='UVRQ';
	variable="rma_uvrq_5c_Snon1    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=1;
	ods output ParameterEstimates=uvrq_5_Snon1;
run;
data rma_uvrq_5_Snon1; set uvrq_5_Snon1;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Snon1    ";
run;

** shebl_non = 2 ****************************;
** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class uvrq_5 (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=2;
	ods output ParameterEstimates=uvrq_5c_Snon2;
run;
data rin_uvrq_5c_Snon2; set uvrq_5c_Snon2;
	where Parameter='UVRQ';
	variable="rin_uvrq_5c_Snon2    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=2;
	ods output ParameterEstimates=uvrq_5_Snon2;
run;
data rin_uvrq_5_Snon2; set uvrq_5_Snon2;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Snon2    ";
run;

** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class uvrq_5 (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=2;
	ods output ParameterEstimates=uvrq_5c_Snon2;
run;
data rma_uvrq_5c_Snon2; set uvrq_5c_Snon2;
	where Parameter='UVRQ';
	variable="rma_uvrq_5c_Snon2    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=2;
	ods output ParameterEstimates=uvrq_5_Snon2;
run;
data rma_uvrq_5_Snon2; set uvrq_5_Snon2;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Snon2    ";
run;

** shebl_non = 3 ****************************;
** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class uvrq_5 (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=3;
	ods output ParameterEstimates=uvrq_5c_Snon3;
run;
data rin_uvrq_5c_Snon3; set uvrq_5c_Snon3;
	where Parameter='UVRQ';
	variable="rin_uvrq_5c_Snon3    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_ins(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=3;
	ods output ParameterEstimates=uvrq_5_Snon3;
run;
data rin_uvrq_5_Snon3; set uvrq_5_Snon3;
	where Parameter='UVRQ';
	variable="rin_uvrq_5_Snon3    ";
run;

** uvrq_5 * shebl_non;
proc phreg data = use multipass;
	class uvrq_5 (ref='1. >176 and <=186.255')
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=3;
	ods output ParameterEstimates=uvrq_5c_Snon3;
run;
data rma_uvrq_5c_Snon3; set uvrq_5c_Snon3;
	where Parameter='UVRQ';
	variable="rma_uvrq_5c_Snon3    ";
run;

proc phreg data = use multipass;
	class 
				SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
				HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
				utilizer_m utilizer_w;
	model exit_age*melanoma_mal(0)= 
			uvrq_5
			SEX educm_comb SMOKE_FORMER alcohol_comb bmi_c physic_c htension
			HEART rel_1d_cancer coffee_c TV_comb nap_comb marriage_comb
			utilizer_m utilizer_w
			/ entry = entry_age RL; 
	where shebl_non_me=3;
	ods output ParameterEstimates=uvrq_5_Snon3;
run;
data rma_uvrq_5_Snon3; set uvrq_5_Snon3;
	where Parameter='UVRQ';
	variable="rma_uvrq_5_Snon3    ";
run;

ods _all_ close; ods html;
*Combine and output to Excel;
data base_uvrqc_Snon (rename=(HazardRatio=A_HR HRLowerCL=A_LL HRUpperCL=A_UL)); 
	set rin_uvrq_5_Snon0
		rin_uvrq_5c_Snon0
		rma_uvrq_5_Snon0
		rma_uvrq_5c_Snon0
		rin_uvrq_5_Snon1 
		rin_uvrq_5c_Snon1 
		rma_uvrq_5_Snon1		
		rma_uvrq_5c_Snon1
		rin_uvrq_5_Snon2
		rin_uvrq_5c_Snon2
		rma_uvrq_5_Snon2
		rma_uvrq_5c_Snon2
		rin_uvrq_5_Snon3
		rin_uvrq_5c_Snon3
		rma_uvrq_5_Snon3
		rma_uvrq_5c_Snon3
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
data base_uvrqc_Snont (keep=Parameter ClassVal0 A_HR A_LL A_UL variable); 
	title1 'AARP Melanoma NSAID Riskfactor';
	title2 'Hazard Ratios for NSAID non-aspirin';
	title3 'By UVQR quartile';
	title4 '20160523MON WTL';
	set base_uvrqc_Snon; 
	*where ClassVal0=' ';
run;
ods html file='C:\REB\NSAIDS melanoma AARP\Results\interactions\risk.sheblnon.uvrq.v1.xls' style=minimal;
proc print data= base_uvrqc_Snont; run;
ods _all_ close; ods html;
