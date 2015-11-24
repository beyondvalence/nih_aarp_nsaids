/******************************************************************
#      NIH-AARP UVR- Reproductive Factors- Melanoma Study
*******************************************************************
#
# creates the melanoma file with cancer, smoking,
# reproductive, hormonal, contraceptives, UVR variables
# !!!! for risk factors dataset !!!!!
#
# uses the uv_public, rout09jan14, rexp16feb15 datasets
# note: using new rexp dataset above
#
# Created: April 03 2015
# Updated: v20150410 WTL
# Used IMS: anchovy
# Warning: original IMS datasets are in LINUX latin1 encoding
*******************************************************************/

ods html close;
ods html;
options nocenter yearcutoff=1900 errors=1;
title1 'NIH-AARP UVR Melanoma Study _riskfactor';

libname uvr 'C:\REB\AARP_HRTandMelanoma\Data\anchovy';
libname conv 'C:\REB\AARP_HRTandMelanoma\Data\converted';

filename uv_pub 'C:\REB\AARP_HRTandMelanoma\Data\anchovy\uv_public.v9x';

** import the UVR with file extension v9x from the anchovy folder;
proc cimport data=uv_pub1 infile=uv_pub; 
run;
/***************************************************/
** use baseline census tract for higher resolution;
proc means data=uv_pub1;
	title "Comparing UVR exposure means";
	var exposure_jul_78_93 exposure_jul_96_05 exposure_jul_78_05;
	var exposure_net_78_93 exposure_net_96_05 exposure_net_78_05;
run;

** keep the july UVR data only;
data conv.uv_pub1;
	set uv_pub1; 
	keep	westatid
			exposure_jul_78_05;
run;
ods html close;
ods html;
proc contents data=conv.rout09jan14;
	title 'risk exp';
run;

** input: first primary cancer _risk; 
** output: analysis;
** uses rexp05jun14, rout09jan14, uv_pub1;
** riskfactor dataset;
%include 'C:\REB\AARP_HRTandMelanoma\Analysis\anchovy\first.primary.analysis.risk.include.sas';
	(keep=	westatid
			rf_entry_dt
			rf_entry_age
			f_dob
			AGECAT
			racem /* for race exclusions */
			SEX
			raadate /* date moved outside of Registry Ascertainment Area */
			entry_age
			entry_dt
			cancer_dxdt
			cancer_seergroup
			cancer_ss_stg /* summary stage: first cancer */
			cancer_behv /* for cancer staging */
			cancer_siterec3
			cancer_grade
			skincan
			skin_dxdt

			/* for self reported cancers */
			self_prostate
			self_breast
			self_colon
			self_other

			health
			renal
			DODSource
			DOD
			EDUCM
			fl_proxy /* for proxy responder exclusions */

			/* smoking */
			smoke_former
			smoke_quit
			smoke_dose
			smoke_quit_dose

			BF_COMB_SELF_CANCER
			BF_HORMEVER
			BF_HORMTYPE
			BF_SMOKE_EVER
			BF_SMOKE_FORMER

			
			rel_1d_cancer			/* family history of cancer - any 1st degree relatives ever diagnosed with cancer (nnmsc)*/


			/* add more variables here */
			BMI_CUR					/* current bmi kg/m2*/
			qp12b 					/* coffee drinking */
			calories 				/* calories consumed */
			Q45 					/* pipe-cigar smoking */
			Q32 					/* current physical activity */
			physic 					/* physical activity >=20 min in past 12 months */
			physic_1518				/* physical activity >=20 min in past 12 months during ages 15-18 */
			mped_a_bev 				/* total alcohol per day including food sources */

		/******** riskfactor characteristics variables ********/
			rf_agecat
			rf_1d_cancer

			/* necessary for exclusions */
			fl_rf_proxy
			rf_q23_2_1a
			rf_q23_2_2a

			/* add more variables here */
			BMI_CUR					/* current bmi kg/m2*/
			qp12b 					/* coffee drinking */
			calories 				/* calories consumed */
			Q45 					/* pipe-cigar smoking */
			Q32 					/* current physical activity */
			physic 					/* physical activity >=20 min in past 12 months */
			physic_1518				/* physical activity >=20 min in past 12 months during ages 15-18 */
			mped_a_bev 				/* total alcohol per day including food sources */
			q29c					/* single supplement: selenium */
			q30b1					/* how often: beta-carotene */
			q30b2					/* amount: beta-carotene */
			q30d1					/* how often: vitamin e */
			q30d2					/* amount: vitamin e */
			rf_Q48					/* have you had a physically demanding job? */
			rf_Q49					/* how many physically demanding jobs have you ever held? */
			rf_Q50					/* what is the total number of years that you worked in physically demanding jobs? */
			rf_Q51_1				/* have you had a job where you walked or biked most days of the week? */
			rf_Q51_2				/* total number of years that you walked or biked to work most days of the week */
			rf_Q52					/* in a typical 24 hr period, how often do you watch TV or movies in the past 12mo */
			rf_Q53_B				/* number of hours spent napping per day */
			rf_Q53_C				/* number of hours spent sitting per day */
			rf_Q54_1				/* hours of light activity ages 15-18 */
			rf_Q54_2				/* hours of light activity ages 19-29 */
			rf_Q54_3				/* hours of light activity ages 30-39 */
			rf_Q54_4				/* hours of light activity past 10 years */
			rf_Q55_1				/* hours of moderate to vigorous activity ages 15-18 */
			rf_Q55_2				/* hours of moderate to vigorous activity ages 19-29 */
			rf_Q55_3				/* hours of moderate to vigorous activity ages 30-39 */
			rf_Q55_4				/* hours of moderate to vigorous activity past 10 years*/

			RF_PHYS_LIGHT_15_18		/*How often did you participate in light activities between the ages of 15 & 18?*/
			RF_PHYS_LIGHT_19_29		/*How often did you participate in light activities between the ages of 19 & 29?*/
			RF_PHYS_LIGHT_35_39		/*How often did you participate in light activities between the ages of 35 & 39?*/
			RF_PHYS_LIGHT_CURR		/*How often did you participate in light activities in the past 10 years?*/
			RF_PHYS_MODVIG_15_18	/*How often did you participate in moderate to vigorous activities between the ages of 15 & 18?*/
			RF_PHYS_MODVIG_19_29	/*How often did you participate in moderate to vigorous activities between the ages of 19 & 29?*/
			RF_PHYS_MODVIG_35_39	/*How often did you participate in moderate to vigorous activities between the ages of 35 & 39?*/
			RF_PHYS_MODVIG_CURR		/*How often did you participate in moderate to vigorous activities in the past 10 years?*/
			RF_PHYS_JOB				/*Number of physically demanding jobs (0=None, 1=1-2, 2=3-5, 3=6+, 9=Unk)*/
			RF_PHYS_JOBYRS			/*Number of years with a physically demanding job (0=<1, 1=1-2, 2=3-5, 3=6-9, 4=10+, 9=Unk)*/
			RF_PHYS_JOBWALK			/*Number of years walked or biked to work most days (0=None, 1=<1, 2=1-2, 3=3-5, 4=6-9, 5=10+, 9=Unk)*/
			RF_PHYS_TV				/*Hours spent watching tv/videos during typical 24 hour period in past 12 months (0=None, 1=<1, 2=1-2, 3=3-4, 4=5-6, 5=7-8, 6=9+, 9=Unk)*/
			RF_PHYS_SLEEP			/*Hours spent sleeping at night during typical 24 hour period in past 12 months (0=<5, 1=5-6, 2=7-8, 3=9+, 9=Unk)*/
			RF_PHYS_NAP				/*Hours spent napping during typical 24 hour period in past 12 months (0=None, 1=<1, 2=1-2, 3=3-4, 4=5-6, 9=Unk)*/
			RF_PHYS_SIT				/*Hours spent sitting during typical 24 hour period in past 12 months (0=<3, 1=3-4, 2=5-6, 3=7-8, 4=9+, 9=Unk)*/

			/** NSAID variables **/
			rf_Q10_1				/* During the past 12 mo, did you take generic aspirin, bayer, bufferin, anacin, ecotrin, or excedrin? */
			rf_Q10_2				/* How often? */
			rf_Q11_1				/* During the past 12 mo, did you take generic ibuprofen, advil, nuprin, motrin, aleve, etc */
			rf_Q11_2				/* How often? */
			RF_ABNET_ASPIRIN		/*Ever take Aspirin during the past 12 months?*/
			RF_ABNET_CAT_ASPIRIN	/*Frequency of Aspirin use during the past 12 months*/
			RF_ABNET_IBUPROFEN		/*Ever take Ibuprofen during the past 12 months?*/		
	);

	****  Create exit date, exit age, and person years for First Primary Cancer;
	** with first primary cancer as skin cancer;
	* Chooses the earliest of 4 possible exit dates for skin cancer;
  	exit_dt = min(mdy(12,31,2006), skin_dxdt, dod, raadate); 
  	exit_age = round(((exit_dt-f_dob)/365.25),.001);
  	personyrs = round(((exit_dt-entry_dt)/365.25),.001);
	rf_personyrs = round(((exit_dt-rf_entry_dt)/365.25),.001);
run;
/* check point for merging the exposure and outcome data */
** copy and save the analysis_use dataset to the converted folder;
proc copy noclone in=Work out=conv;
	select ranalysis;
run;
ods html close;
ods html;
proc contents data=conv.ranalysis;
run;

** set value formats ; 
proc format;
	value sexfmt 0 = 'Male' 1 = 'Female';
	value melanfmt 0 = 'no melanoma' 1 = 'in situ melanoma' 2 = 'malignant melanoma';
	value melanomafmt 0 = 'no melanoma' 1 = 'melanoma';
	value agecatfmt 1 = '<55 years' 2 = '55-59 years' 3 = '60-64 years' 4 = '65-69 years' 5 = '>=70 years';
	value racefmt -9='missing' 0='non-Hispanic white' 1='non-Hispanic black' 2='Hispanic, Asian, PI, AIAN';
	value educfmt -9='missing' 0='highschool or less' 1='some college' 2='college or graduate school';
	value bmifmt -9='missing' 1='18.5 to 25' 2='25 to 30' 3='30 to 35' 4='35 to 40' 5='>=40';
	value physicfmt -9='missing' 0='rarely' 1='1-3 per month' 2='1-2 per week' 3='3-4 per week' 4='5+ per week';
	value smokingfmt -9='missing' 0='never smoked' 1='ever smoke';

	** menopause status recoded;
	value fmenstrfmt 9='missing' 1='<=10' 2='11-12' 3='13-14' 4='>=15';
	value menostatfmt -9='missing' 0='pre-menopausal' 1='natural menopause' 2='hysterectomy, both ovaries removed'
						3='hysterectomy, other ovary surgery' 4='hysterectomy, both ovaries intact' 
						5='hysterectomy, ovaries unknown' 6='other reason';
	value menoagefmt -9='missing' 1='<45' 2='45-49' 0='50-54' 3='55+';
	value hystagefmt -9='missing' 0='<45' 1='45-49' 2='50-54' 3='55+';
	value flbagefmt -9='missing' 1='< 20 years old' 2='20s' 3='30s';
	value parityfmt -9='missing' 0='nulliparous' 1='1-2 live children' 2='3-4 live children' 3='5+ live children';
	value hormstatfmt -9='missing' 0='never' 1='former' 2='current';
	value oralbcdurfmt -9='missing' 0='none' 1='1-4 years' 2='5-9 years' 3='10+ years';
	value uvrqfmt -9='missing' 1='0 to 186.255' 2='186.255 to 215.622' 3='215.622 to 245.151' 
					4='245.151 to 257.14' 5='>257.14';
	value relativefmt 9='missing' 0='No' 1='Yes';
/* :::risk factors::: */
	** smoking;
	value smokeformerfmt 9='missing' 0='never smoked' 1='former smoker' 2='current smoker';
	value smokequitfmt 9='missing' 0='never smoked' 1='stopped 10+ years ago' 2='stopped 5-9 years ago'
						3='stopped 1-4 years ago' 4='stopped within last year' 5='currently smoking';
	value smokedosefmt 9='missing' 0='never smoked' 1='1-10 cigs a day' 2='11-20 cigs a day' 3='21=30 cigs a day'
						4='31-40 cigs a day' 5='41-60 cigs a day' 6='60+ cigs a day';
	value smokequitdosefmt 9='missing' 0='never smoked' 1='quit, <=20 cigs/day' 2='quit, >20 cigs/day'
							3='currently smoking, <=20 cigs/day' 4='currently smoking, >20 cigs/day';
	value coffeefmt -9='missing' 0='none' 1='<=1 cup/day' 2='2-3 cups/day' 3='>=4 cups/day';
	value etohfmt -9='missing' 0='0' 1='>0 to 0.04' 2='>0.04 to 0.1' 3='>0.1 to 0.52' 4='>0.52 to 1.12' 5='>1.12';
	value rfphysicfmt -9='missing' 0='never-rarely' 1='<1 hr/week' 2='1-3 hr/week' 3='4-7 hr/week' 4='>7 hr/week';

run;

** uses the pre-created analysis_use from above checkpoint;
data melan_r; ** name the output of the first primary analysis include to melan_r;
	set conv.ranalysis;
	****** Define melanoma - pulled from allcancer-coffee analysis ******; 
	** create the melanoma case variable from the cancer ICD-O-3 and SEER coding of 25010;
	** contains both melanoma subtypes;
	melanoma_c = .;
	* in situ melanoma =1;
    if cancer_behv='2' and cancer_seergroup = 18 and cancer_siterec3=25010 
		then melanoma_c = 1;
	* malignant melanoma =2;
	else if cancer_behv='3' and cancer_seergroup = 18 and cancer_siterec3=25010 
		then melanoma_c = 2;  
	else melanoma_c = 0;
	
	** create melanoma indicator Y/N;
	melanoma_agg = .;
	* melanoma including in situ and malignant;
	if (cancer_behv='2' or cancer_behv='3') and cancer_seergroup=18 and cancer_siterec3=25010
		then melanoma_agg = 1;
	else melanoma_agg = 0;
run;

*******************************************************;
/* Check for exclusions from Loftfield Coffee paper;
** total of n=566398;
proc copy noclone in=Work out=conv;
	select analysis;
run;
*/
*******************************************************;

ods html close;
ods html;

** merge the melan_r dataset with the UV data;
data melan_r;
	merge melan_r (in=frodo) conv.uv_pub1 ;
	by westatid;
	if frodo;
run;

** copy and save the melan dataset to the converted folder;
proc copy noclone in=Work out=conv;
	select melan_r;
run;
** quick checks on the conv.melan file;
** especially for the seer ICD-O-3 codes;
** melanoma code is 25010;
** check to see if the melanoma was coded correctly;
proc freq data=conv.melan_r;
	table cancer_siterec3*sex;
	table cancer_siterec3*cancer_seergroup /nopercent norow nocol;
run;

**** Exclusions risk macro;
%include 'C:\REB\AARP_HRTandMelanoma\Analysis\anchovy\exclusions.first.primary.risk.macro.sas';

**** Outbox macro for use with outliers;
%include 'C:\REB\AARP_HRTandMelanoma\Analysis\anchovy\outbox.macro.sas';

**** Use the exclusion macro to make "standard" exclusions and get counts of excluded subjects;

%exclude(data            	= melan_r,
         ex_proxy        	= 1,
		 ex_rf_proxy	 	= 1,
         ex_sex          	= 0,
         ex_rf_selfbreast   = 1,
		 ex_rf_selfovary	= 1,
         ex_selfother    	= 1,
         ex_health       	= ,
         ex_prevcan      	= 1,
         ex_deathcan     	= 1);

/***************************************************************************************/ 
/*   Exclude if low or high caloric consumption                                        */
/***************************************************************************************/      
* Define outliers for total energy;
%outbox(data     = melan_r,
        id       = westatid,
        by       = ,
        comb_by  = ,
        var      = calories,
        cutoff1  = 3,
        cutoff2  = 2,
        keepzero = N,
        lambzero = Y,
        print    = N,
        step     = 0.01,
        addlog   = 0);

data melan_r excl_kcal;
   set melan_r;
   if noout_calories <= .z  then output excl_kcal;
   else output melan_r;
run;
/***************************************************************************************/ 
/*   Exclude if person-years = 0                                                       */
/***************************************************************************************/      
data melan_r excl_py_zero;
   set melan_r;
   if rf_personyrs <= 0 then output excl_py_zero;
   else output melan_r;
run;

** copy and save the melan dataset to the converted folder;
** now work with melan data in conv library;
proc copy noclone in=work out=conv;
	select melan_r;
run;

** find the cutoffs for the percentiles of UVR- exposure_jul_78_05 mped_a_bev;
proc univariate data=conv.melan_r;
	var /*F_DOB; mped_a_bev; exposure_jul_78_05;*/ F_DOB; 
	output 	out=bla 
			pctlpts= 10 20 25 30 40 50 60 70 75 80 90 
			pctlpre=p;
run;
proc print data=bla; 
	*title 'UVR exposure percentiles';
	title 'DOB exposure percentiles';
run; 
	** need to change the exposure percentiles after exclusions;
	** uvr exposure;
	** p10     p20     p25     p30     p40     p50     p60     p70     p75     p80    p90 ;
	** 185.266 186.255 186.255 192.716 215.622 239.642 245.151 250.621 253.731 257.14 267.431 ;
	** birth cohort;
	** p10     p20     p25     p30     p40     p50     p60     p70     p75     p80   p90 ;
	** -11897  -11330  -11040  -10760  -10194  -9583   -8920   -8203   -7834   -7431 -6408;

/******************************************************************************************/
** create the UVR, and confounder variables by quintile/categories;
** for both baseline and riskfactor questionnaire variables;
/* cat=categorical ************************************************************************/
data conv.melan_r;
	set conv.melan_r;

/* for baseline */

	** UVR TOMS quintile;
	UVRQ=.;
	if      0       < exposure_jul_78_05 <= 186.255 then UVRQ=1;
	else if 186.255 < exposure_jul_78_05 <= 215.622 then UVRQ=2;
	else if 215.622 < exposure_jul_78_05 <= 245.151 then UVRQ=3;
	else if 245.151 < exposure_jul_78_05 <= 257.14  then UVRQ=4;
	else if 257.14  < exposure_jul_78_05            then UVRQ=5;
	else UVRQ=-9;

	** birth cohort date of birth quintile;
	birth_cohort=.;
	if      -12571 <= F_DOB <= -11330 then birth_cohort=1;
	else if -11330 <= F_DOB < -10194  then birth_cohort=2;
	else if -10194 <= F_DOB < -8920   then birth_cohort=3;
	else if -8920  <= F_DOB < -7431   then birth_cohort=4;
	else if -7431  <= F_DOB           then birth_cohort=5;

	** physical exercise cat;
	physic_c=.;
	if      physic in (0,1)	then physic_c=0; /* rarely */
	else if physic=2 	 	then physic_c=1; /* 1-3 per month */
	else if physic=3 	 	then physic_c=2; /* 1-2 per week */
	else if physic=4     	then physic_c=3; /* 3-4 per week */
	else if physic=5     	then physic_c=4; /* 5+ per week */
	else if physic=9	 	then physic_c=-9; /* missing */

	** physical exercise ages 15..18 cat;
	physic_1518_c=.;
	if      physic_1518 in (0,1)	then physic_1518_c=0; /* rarely */
	else if physic_1518=2	 	 	then physic_1518_c=1; /* 1-3 per month */
	else if physic_1518=3 		 	then physic_1518_c=2; /* 1-2 per week */
	else if physic_1518=4   	  	then physic_1518_c=3; /* 3-4 per week */
	else if physic_1518=5	     	then physic_1518_c=4; /* 5+ per week */
	else if physic_1518=9		 	then physic_1518_c=-9; /* missing */

	** oral contraceptive duration cat;
	oralbc_dur_c=.;
	if      oralbc_yrs=0		then oralbc_dur_c=0; /* none */
	else if oralbc_yrs=1		then oralbc_dur_c=1; /* 1-4 years */
	else if oralbc_yrs=2		then oralbc_dur_c=2; /* 5-9 years */
	else if oralbc_yrs=3 		then oralbc_dur_c=3; /* 10+ years */
	else if oralbc_yrs in (8,9)	then oralbc_dur_c=-9; /* missing */

	** oral contraceptive yes/no;
	oralbc_yn_c=.;
	if      oralbc_yrs=0 	then oralbc_yn_c=0; /* no oc */
	else if 0<oralbc_yrs<8	then oralbc_yn_c=1; /* yes oc */
	else if oralbc_yrs>7	then oralbc_yn_c=-9; /* missing */

	** age at menarche cat;
	menarche_c=.;
	if      fmenstr=1	then menarche_c=0; /* <=10 years old */
	else if fmenstr=2	then menarche_c=1; /* 11-12 years old */
	else if fmenstr=3	then menarche_c=2; /* 13-14 years old */
	else if fmenstr=4	then menarche_c=3; /* 15+ years old */
	else if fmenstr>4	then menarche_c=-9; /* missing */

	** age at menarche cat;
	menarche_old_c=.;
	if      menarche_c in (0,1)		then menarche_old_c=0; /* <=12 years old */
	else if menarche_c in (2,3)		then menarche_old_c=1; /* >=13 years old */
	else if menarche_c=-9			then menarche_old_c=-9; /* missing */

	** education cat;
	educ_c=.;
	if 		educm in (1,2) 	then educ_c=0; /* highschool or less */
	else if educm in (3,4)	then educ_c=1; /* some college */
	else if educm=5			then educ_c=2; /* college and grad */
	else if educm=9			then educ_c=-9; /* missing */

	** race cat;
	race_c=.;
	if      racem=1			then race_c=0; /* non hispanic white */
	else if racem=2			then race_c=1; /* non hispanic black */
	else if racem in (3,4) 	then race_c=2; /* hispanic, asian PI AIAN */
	else if racem=9			then race_c=-9; /* missing */

	** age at first live birth cat;
	flb_age_c=.;
	if      age_flb=0			then flb_age_c=0; /* no births */
	else if age_flb in (1,2)	then flb_age_c=1; /* < 20 years old */
	else if age_flb in (3,4)	then flb_age_c=2; /* 20s */
	else if age_flb in (5,6,7)	then flb_age_c=3; /* 30s */
	else if age_flb in (8,9)	then flb_age_c=-9; /* missing */

*******************************************************************************************;
/** recode menopause status to include hysterectomy and oophorectomy **/
*******************************************************************************************;
	** menopause status recoded;
	** use the perstop_surgery (hyststat and ovarystat) and perstop_radchem;

	menostat_c=.;
	if 		perstop_nostop=1								then menostat_c=0; /* premenopausal */
	else if perstop_menop=1									then menostat_c=1; /* natural menopause */
	else if perstop_surg=1 & (hyststat=1 & ovarystat=1)		then menostat_c=2; /* hysterectomy, removed 2 ovaries */
	else if perstop_surg=1 & (hyststat=1 & ovarystat=3) 	then menostat_c=3; /* hysterectomy, surgery to ovaries */
	else if perstop_surg=1 & (hyststat=1 & ovarystat=2) 	then menostat_c=4; /* hysterectomy, ovaries intact */
	else if perstop_surg=1 & (hyststat=1 & ovarystat=9) 	then menostat_c=5; /* hysterectomy, ovaries unknown */
	else if perstop_menop=0 | (perstop_surg=9 | perstop_radchem in (0,1,9))	
															then menostat_c=6; /* other reason */
	else if perstop_nostop=9 | perstop_menop=9				then menostat_c=-9; /* missing */

	** for natural menopause age; 
	meno_age_c=.;
	if      menostat_c=1 & menop_age=4			then meno_age_c=0; /* 50-54 */
	else if menostat_c=1 & menop_age in (1,2)	then meno_age_c=1; /* less than 45 */
	else if menostat_c=1 & menop_age=3			then meno_age_c=2; /* 45-49 */
	else if menostat_c=1 & menop_age=5			then meno_age_c=3; /* 55+ */
	else if menostat_c=1 & menop_age in (8,9)	then meno_age_c=-9; /* missing */
	else 	meno_age_c=-9;

	** hysterectomy age cat;
	hyst_age_c=.;
	if 		menostat_c in (2,3,4,5) & menop_age in (1,2)		then hyst_age_c=0; /* less than 45 */
	else if menostat_c in (2,3,4,5) & menop_age=3				then hyst_age_c=1; /* 45-49 */
	else if menostat_c in (2,3,4,5) & menop_age=4				then hyst_age_c=2; /* 50-54 */
	else if menostat_c in (2,3,4,5) & menop_age=5				then hyst_age_c=3; /* 55+ */
	else if menostat_c in (2,3,4,5) & menop_age in (8,9)		then hyst_age_c=-9; /* missing */
	else	hyst_age_c=-9;

	** former smoker status cat;
	smoke_f_c=.;
	if      bf_smoke_former=0	then smoke_f_c=0; /* never smoke */
	else if bf_smoke_former=1	then smoke_f_c=1; /* former smoker (ever)*/
	else if bf_smoke_former=2	then smoke_f_c=1; /* current smoker? (ever)*/
	else if bf_smoke_former=9	then smoke_f_c=-9; /* missing */
	else smoke_f_c=-9;

	** hormonal status cat;
	horm_c=.;
	if      hormstat=0			then horm_c=0; /* never hormones */
	else if hormstat=1			then horm_c=1; /* former */
	else if hormstat=2			then horm_c=2; /* current */
	else if hormstat in (8,9)	then horm_c=-9; /* missing */

	** live child parity cat;
	parity=.;
	if livechild=0					then parity=0; /* no live children */
	else if livechild in (1,2) 		then parity=1; /* 1 to 2 live children */
	else if livechild in (3,4,5) 	then parity=2; /* 3 to 5+ live children */
	else if livechild in (8,9)		then parity=-9; /* missing */

	** cancer grade cat;
	cancer_g_c=.;
	if 	    cancer_grade=1		then cancer_g_c=0; 
	else if cancer_grade=2		then cancer_g_c=1;
	else if cancer_grade=3		then cancer_g_c=2;
	else if cancer_grade=4		then cancer_g_c=3;
	else if cancer_grade=9		then cancer_g_c=-9; /* missing */

	*******************************************************************************************;
	** bmi categories *************************************************************************;
	*******************************************************************************************;
	** bmi three categories;
	if      18.5<=bmi_cur<25 	then bmi_c=1; /* low bmi */
   	else if 25<=bmi_cur<30 		then bmi_c=2; /* higher bmi */
   	else if 30<=bmi_cur<50 		then bmi_c=3; /* highest bmi */
   	else if bmi_cur=. 			then bmi_c=-9; /* missing */
   	else if bmi_cur<18.5 		then bmi_c=-9; /* less than lowest valid bmi */
   	else if bmi_cur<=50 		then bmi_c=-9; /* more than highest valid bmi */

	** bmi three categories standalone variables;
	bmi_c1=0;
	bmi_c2=0;
	bmi_c3=0;
	bmi_cn9=0;

	if      bmi_c=1 	then bmi_c1=1;
   	else if bmi_c=2 	then bmi_c2=1;
	else if bmi_c=3 	then bmi_c3=1;
	else if bmi_c=-9 	then bmi_cn9=1;

	** bmi five categories;
	if      18.5<=bmi_cur<25 	then bmi_fc=1; /* low bmi */
   	else if 25<=bmi_cur<30 		then bmi_fc=2; /* mid bmi */
   	else if 30<=bmi_cur<35 		then bmi_fc=3; /* high bmi */
	else if 35<=bmi_cur<40 		then bmi_fc=4; /* higher bmi */
   	else if bmi_cur>=40 		then bmi_fc=5; /* highest valid bmi */
	else bmi_fc=-9;

	** bmi five categories standalone variables;
	bmi_fc1=0;
	bmi_fc2=0;
	bmi_fc3=0;
	bmi_fc4=0;
	bmi_fc5=0;

	if      bmi_fc=1 	then bmi_fc1=1;
   	else if bmi_fc=2 	then bmi_fc2=1;
	else if bmi_fc=3 	then bmi_fc3=1;
	else if bmi_fc=4 	then bmi_fc4=1;
	else if bmi_fc=5 	then bmi_fc5=1;

	** continuous bmi;
	bmi_cont=bmi_cur/5;

	* finish bmi;
	***************************************************************************;

	** first primary cancer stage;
	stage_c=.;
	if      cancer_ss_stg=0 				then stage_c=0;
	else if cancer_ss_stg=1 				then stage_c=1;
	else if cancer_ss_stg in (2,3,4,5)		then stage_c=2;
	else if cancer_ss_stg=7					then stage_c=3;
	else if cancer_ss_stg in (8,9)			then stage_c=4;
	else if cancer_ss_stg=. 				then stage_c=-9;	

	** coffee drinking;
	coffee_c=.;
	if		qp12b=0					then coffee_c=0; 	/* none */
	else if qp12b in (1,2,3,4,5,6)	then coffee_c=1; 	/* <=1/day */
	else if qp12b=7					then coffee_c=2; 	/* 2-3/day */
	else if qp12b in (8,9)			then coffee_c=3; 	/* >=4/day */
	else if qp12b in ('M', 'E')		then coffee_c=-9;	/* missing */
	else	coffee_c=-9; 								/* missing */

	** total alcohol per day;
	etoh_c=.;
	if mped_a_bev=0					then etoh_c=0;		/* none */
	else if 0<mped_a_bev<=0.04		then etoh_c=1;		/* 0-0.04 */
	else if 0.04<mped_a_bev<=0.1 	then etoh_c=2;		/* 0.04-0.1 */
	else if 0.1< mped_a_bev<=0.52	then etoh_c=3;		/* 0.1-0.52 */
	else if 0.52<mped_a_bev<=1.12	then etoh_c=4;		/* 0.52-1.12 */
	else if 	 mped_a_bev>1.12	then etoh_c=5;		/* 1.12-37.44 */
	else 		 etoh_c=-9;								/* missing */

/* for riskfactor */

	** risk physical exercise ages 15..18 cat;
	rphysic_1518_c=.;
	if      rf_phys_modvig_15_18 in (0,1)	then rf_physic_1518_c=0; /* rarely */
	else if rf_phys_modvig_15_18=2 	 		then rf_physic_1518_c=1; /* <1 hour/week */
	else if rf_phys_modvig_15_18=3 	 		then rf_physic_1518_c=2; /* 1-3 hours/week */
	else if rf_phys_modvig_15_18=4     		then rf_physic_1518_c=3; /* 4-7 hours/week */
	else if rf_phys_modvig_15_18=5     		then rf_physic_1518_c=4; /* >7 hours/week */
	else if rf_phys_modvig_15_18=9	 		then rf_physic_1518_c=-9; /* missing */
	else rphysic_1518=-9;

	** (rf) physical exercise how often participate mod-vig activites in past 10 years;
	rf_physic_c=.;
	if		rf_phys_modvig_curr in (0,1)	then rf_physic_c=0;	/* none-rarely */
	else if rf_phys_modvig_curr=2			then rf_physic_c=1; /* <1 hr/week */
	else if rf_phys_modvig_curr=3			then rf_physic_c=2; /* 1-3 hr/week */
	else if rf_phys_modvig_curr=4			then rf_physic_c=3; /* 4-7 hr/week */
	else if rf_phys_modvig_curr=5			then rf_physic_c=4; /* >7 hr/week */
	else if rf_phys_modvig_curr=9			then rf_physic_c=-9; /* missing */
	else rf_physic_c=-9;

	*******************************************************************************************;
	*************** HRT variables *************************************************************;
	*******************************************************************************************;

	** Estrogen ***************;


	** Progestin **************;


	** both EP ****************;




	** finished HRT variables;
	*******************************************************************************************;
run;

ods html close;
ods html;
proc freq data=conv.melan_r;
	table menostat_c;
run;
** add labels;
proc datasets library=conv;
	modify melan_r;
	
	** set variable labels;
	label 	/* melanoma outcomes */
			melanoma_agg = "Melanoma indicator"
			melanoma_c = "Melanoma indicator by type"

			/* for baseline */
			uvrq = "TOMS AVGLO-UVR measures in quintiles"
			oralbc_dur_c = "birth control duration"
			oralbc_yn_c = "birth control yes/no"
			menarche_old_c = "menarche 2 split"
			menarche_c = "menarche age"
			educ_c = "education level"
			race_c = "race split into 3"
			flb_age_c = "Age at first live birth among parous women"
			fmenstr = "Age at menarche"
			menostat_c = "menopause status"
			meno_age_c ="age at natural menopause"
			hyst_age_c ="age at hysterectomy"
			menostat_c ="menopause status"
			physic_c = "level of physical activity"	
			horm_c = "hormone usage status"
			parity = "total number of live births"
			cancer_g_c = "cancer grade"
			bmi_c = "bmi, rough"
			bmi_fc = "bmi, 5"
			stage_c = "stage of first primary cancer"
			physic_1518_c = "level of physical activity at ages 15-18 (base)"

			smoke_f_c = "ever smoking status"
			smoke_former ="Smoking Status"
			smoke_quit = 'Quit smoking status'
			smoke_dose = 'Smoking dose'
			smoke_quit_dose = 'Smoking status and dose combined'
			rel_1d_cancer = 'Family History of Cancer'
			coffee_c = 'Coffee drinking'
			etoh_c = 'Total alchohol per day including food sources'

			/* for riskfactor */
			rf_physic_1518_c = "level of physical activity at ages 15-18 (rf)"
			rf_physic_c = "Times engaged in moderate-vigorous physical activity"
			rf_1d_cancer = "Family History of Cancer"
	;
	** set variable value labels;
	format	/* for outcomes */
			melanoma_c melanfmt. melanoma_agg melanomafmt. 

			/* for baseline*/
			uvrq uvrqfmt. oralbc_dur_c oralbcdurfmt. educ_c educfmt. race_c racefmt. 
			flb_age_c flbagefmt. fmenstr fmenstrfmt. meno_age_c menoagefmt. menostat_c menostatfmt. hyst_age_c hystagefmt.
			physic_c physic_1518_c physicfmt. smoke_f_c smokingfmt. horm_c hormstatfmt. parity parityfmt. 
			bmi_fc bmifmt. PERSTOP_SURG hysterectomyfmt. agecat agecatfmt.
			smoke_former smokeformerfmt. smoke_quit smokequitfmt. smoke_dose smokedosefmt. 
			smoke_quit_dose smokequitdosefmt.
			rel_1d_cancer relativefmt. coffee_c coffeefmt. etoh_c etohfmt.

			/* for riskfactor */
			rf_physic_1518_c rfphysicfmt. rf_physic_c rfphysicfmt. rf_1d_cancer relativefmt.
	;
run;
/******************************************************************************************/
ods html close;
ods html;
** check the contents of the created melan other;
proc contents data=conv.melan_r;
	title 'melanoma risk content';
run;

** check that the melanoma cases were properly created;
proc freq data=conv.melan_r;
	title 'melanoma frequencies risk';
	table cancer_siterec3*melanoma_c /nopercent norow nocol;
	table cancer_seergroup /nopercent norow nocol;
	table agecat UVRQ birth_cohort UVRQ*birth_cohort UVRQ*agecat /nopercent norow;
	table melanoma_c*sex /nopercent norow; * verify only females;
run;

** check the repro and hormone vars ;
proc freq data=conv.melan_r;
	title 'hormone frequencies';
	*table DAUGH_ESTONLY_CALC_MO_2002 DAUGH_ESTPRG_CALC_MO_2002 DAUGH_EST_CALC_MO_2002 DAUGH_PRGONLY_CALC_MO_2002 DAUGH_PRG_CALC_MO_2002;
	table FMENSTR HORMEVER*HORMSTAT melanoma_c*HORM_CUR melanoma_c*HORMSTAT HORM_YRS;
run;

** check coffee and alcohol variables;
ods html close;
ods html;
proc freq data=conv.melan;
	title 'coffee, alchohol, meno_age, hyst_age';
	table coffee_c etoh_c meno_age_c hyst_age_c;
run;
ods html close;
/*****************************************************
#
#
proc phreg data=conv.melan_r;
	title 'melanoma HR with UVR quintiles';
	class agecat(ref='1') UVRQ(ref='1');
	model (entry_age, exit_age)*melan_case(0) = agecat UVRQ /rl;

run;
*****************************************************/
