/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# creates the melanoma file with cancer, smoking,
# NSAID, UVR variables
# !!!! for risk factors dataset !!!!!
#
# uses the uv_public, rout09jan14, rexp16feb15 datasets
# note: using new rexp dataset above
#
# Created: April 13 2015
# Updated: v20151209WED WTL
# Used IMS: anchovy
# Warning: original IMS datasets are in LINUX latin1 encoding
*******************************************************************/

options nocenter yearcutoff=1900 errors=1;
title1 'NIH-AARP NSAIDs UVR Melanoma Study';

libname conv 'C:\REB\NSAIDS melanoma AARP\Data\converted';

filename uv_pub 'C:\REB\NSAIDS melanoma AARP\Data\uv_public.v9x';

** import the UVR with file extension v9x from the anchovy folder;
proc cimport data=uv_pub1 infile=uv_pub; 
run;
/***************************************************
** use baseline census tract for higher resolution;
proc means data=uv_pub1;
	title "Comparing UVR exposure means";
	var exposure_jul_78_93 exposure_jul_96_05 exposure_jul_78_05;
	var exposure_net_78_93 exposure_net_96_05 exposure_net_78_05;
run; */

** keep the july 1978-2005 UVR data only;
data conv.uv_pub1;
	set uv_pub1; 
	keep	westatid
			exposure_jul_78_05;
run;

** input: first primary cancer _risk; 
** output: analysis;
** uses rexp16feb15, rout09jan14, uv_pub1;
** riskfactor dataset;
**%include 'C:\REB\AARP_HRTandMelanoma\Analysis\anchovy\first.primary.analysis.risk.include.sas';

data ranalysis;  
  merge conv.rout09jan14 (in=ino) conv.rexp16feb15 (in=ine);
  by westatid;
	keep	westatid
			rf_entry_dt
			rf_entry_age
			f_dob
			AGECAT
			racem /* for race exclusions */
			SEX
			raadate /* date moved outside of Registry Ascertainment Area */
			entry_age
			entry_dt
			cancer
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
			/*FAM_CANCER				 Any blood relatives diagnosed with cancer?*/

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
			rf_Q44					/*mammogram*/
			rf_Q15A					/*colonoscopy*/
			rf_Q15B
			rf_Q15C
			rf_Q15D
			rf_Q15E
			HEART					/*baseline Q40C */
			DIABETES				/*baseline Q40B self-report diabetes y/n*/
			MARRIAGE
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
			RF_ABNET_CAT_IBUPROFEN	/*Frequency of Ibuprofen use during the past 12 months*/

;
run;

data ranalysis;
	set ranalysis;
	****  Create exit date, exit age, and person years for First Primary Cancer;
	** with first primary cancer as skin cancer;
	* Chooses the earliest of 4 possible exit dates for skin cancer;
  	exit_dt = min(mdy(12,31,2006), cancer_dxdt, dod, raadate); 
  	exit_age = round(((exit_dt-f_dob)/365.25),.001);
  	personyrs = round(((exit_dt-entry_dt)/365.25),.001);
	rf_personyrs = round(((exit_dt-rf_entry_dt)/365.25),.001);

	format exit_dt entry_date rf_entry_dt f_dob dod cancer_dxdt raadate Date9.;
run;

/* check point for merging the exposure and outcome data */
** copy and save the ranalysis dataset to the converted folder;
proc copy noclone in=Work out=conv;
	select ranalysis;
run;

/**********/
/* start2 */
/**********/
ods _all_ close; ods html;
%include 'C:\REB\NSAIDS melanoma AARP\Analysis\format.risk.w.sas';
libname conv 'C:\REB\NSAIDS melanoma AARP\Data\converted';
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

** merge the melan_r dataset with the UV data;
data melan_r;
	merge melan_r (in=frodo) conv.uv_pub1 ;
	by westatid;
	if frodo;
run;

** quick checks on the conv.melan file;
** especially for the seer ICD-O-3 codes;
** melanoma code is 25010;
** check to see if the melanoma was coded correctly;
/*proc freq data=conv.melan_r;
	table cancer_siterec3*sex;
	table cancer_siterec3*cancer_seergroup /nopercent norow nocol;
run;
*/
/*proc freq data=melan_r;
tables sex;
run;*/

** Check for missing NSAID response;
** Both aspirin and nonaspirin;

**** Exclusions risk macro;

*Start here to run macro to get exclusion;
ods _all_ close; ods html;
%include 'C:\REB\NSAIDS melanoma AARP\Analysis\anchovy\exclusions.first.primary.risk.macro.sas';

**** Outbox macro for use with outliers;
*%include 'E:\NCI REB\AARP\Analysis\anchovy\outbox.macro.sas';

**** Use the exclusion macro to make "standard" exclusions and get counts of excluded subjects;
title 'exclusion macro, rfq';
%exclude(data            	= melan_r,
         ex_proxy        	= 1,
		 ex_rf_proxy	 	= 1,
 		 ex_sex          	= ,
		 ex_selfother    	= 1,
		 ex_rf_selfbreast   = 1,
		 ex_rf_selfovary	= 1,
         ex_health       	= ,
		 ex_prevcan      	= 1,
         ex_deathcan     	= 1);

/***************************************************************************************/ 
/*   Exclude if not 'non-Hispanic White'                                               */
/***************************************************************************************/      
title 'exclusion non non-Hispanic whites';
data melan_r;
   set melan_r;
   excl_1_race=0;
   if racem NE 1 then excl_1_race=1;
run;
proc freq data= melan_r;
	title 'excl_1_race: exclude non-whites';
	tables 	excl_1_race
			excl_1_race*melanoma_c /missing;
run;
data melan_r;
	set melan_r;
	where excl_1_race=0;
run;

/***************************************************************************************/ 
/*   Exclude if person-years <= 0                                                       */
/***************************************************************************************/      
title 'exclusion person years <=0';
data melan_r;
   set melan_r;
   excl_2_pyr=0;
   if rf_personyrs <= 0 then excl_2_pyr=1;
run;
proc freq data= melan_r ;
	title 'excl_2_pyr: exclude 0 or negative person years';
	tables 	excl_2_pyr
			excl_2_pyr*melanoma_c /missing;
run;
data melan_r;
	set melan_r;
	where excl_2_pyr=0;
run;
title;

*END HERE for exclusion counts;

** find the cutoffs for the percentiles of UVR- exposure_jul_78_05 mped_a_bev;
/*proc univariate data=conv.melan_r;
	var F_DOB; 
	output 	out=bla 
			pctlpts= 10 20 25 30 40 50 60 70 75 80 90 
			pctlpre=p;
run;
proc print data=bla; 
	title 'DOB exposure percentiles';
run; 


	** need to change the exposure percentiles after exclusions;
	** birth cohort;
	** p10     p20     p25     p30     p40     p50     p60     p70     p75     p80   p90 ;
	** -11931  -11392  -11113  -10843  -10316  -9711   -9047   -8327   -7950   -7544 -6578;
*/
** find the cutoffs for the percentiles of UVR- exposure_jul_78_05 mped_a_bev;
/*proc univariate data=conv.melan_r;
	var exposure_jul_78_05; 
	output 	out=blu 
			pctlpts= 0 20 40 60 80 100
			pctlpre=p;
run;
proc print data=blu; 
	title 'UVR exposure percentiles';
run; */

	** need to change the exposure percentiles after exclusions;
	** uvr exposure;
	** Quartiles: 176.095 <= Q1 <= 186.255 < Q2 <= 236.805 < Q3 <= 253.731 < Q4 <= 289.463


/******************************************************************************************/
** create the UVR, and confounder variables by quartile/categories;
** for both baseline and riskfactor questionnaire variables;
/* cat=categorical ************************************************************************/
data melan_use;
	set melan_r;

	** UVR TOMS quartile;
	UVRQ=.;
	if      176.000 < exposure_jul_78_05 <= 186.255 	then UVRQ=1;
	else if 186.255 < exposure_jul_78_05 <= 236.805 	then UVRQ=2;
	else if 236.805 < exposure_jul_78_05 <= 253.731 	then UVRQ=3;
	else if 253.731 < exposure_jul_78_05 <= 289.463		then UVRQ=4;
	else 												UVRQ=-9;

	** birth cohort date of birth quintile;
	birth_cohort=.;
	if      -11931 <= F_DOB <= -11392 then birth_cohort=1;
	else if -11392 <= F_DOB < -10316  then birth_cohort=2;
	else if -10316 <= F_DOB < -9047   then birth_cohort=3;
	else if -9047  <= F_DOB < -7544   then birth_cohort=4;
	else if -7544  <= F_DOB           then birth_cohort=5;

	** physical exercise cat;
	physic_c=.;
	if      physic in (0,1)		then physic_c=0; /* rarely */
	else if physic=2 	 		then physic_c=1; /* 1-3 per month */
	else if physic=3 	 		then physic_c=2; /* 1-2 per week */
	else if physic=4     		then physic_c=3; /* 3-4 per week */
	else if physic=5     		then physic_c=4; /* 5+ per week */
	else if physic=9	 		then physic_c=-9; /* missing */

	** physical exercise ages 15..18 cat;
	physic_1518_c=.;
	if      physic_1518 in (0,1)	then physic_1518_c=0; /* rarely */
	else if physic_1518=2	 	 	then physic_1518_c=1; /* 1-3 per month */
	else if physic_1518=3 		 	then physic_1518_c=2; /* 1-2 per week */
	else if physic_1518=4   	  	then physic_1518_c=3; /* 3-4 per week */
	else if physic_1518=5	     	then physic_1518_c=4; /* 5+ per week */
	else if physic_1518=9		 	then physic_1518_c=-9; /* missing */

	** education cat;
	educ_c=.;
	if 		educm in (1,2) 		then educ_c=0; /* highschool or less */
	else if educm in (3,4)		then educ_c=1; /* some college */
	else if educm=5				then educ_c=2; /* college and grad */
	else if educm=9				then educ_c=-9; /* missing */

	** race cat;
	race_c=.;
	if      racem=1				then race_c=0; /* non hispanic white */
	else if racem=2				then race_c=1; /* non hispanic black */
	else if racem in (3,4) 		then race_c=2; /* hispanic, asian PI AIAN */
	else if racem=9				then race_c=-9; /* missing */
	
	** former smoker status cat;
	smoke_f_c=.;
	if      bf_smoke_former=0		then smoke_f_c=0; /* never smoke */
	else if bf_smoke_former=1		then smoke_f_c=1; /* former smoker (ever)*/
	else if bf_smoke_former=2		then smoke_f_c=1; /* current smoker? (ever)*/
	else if bf_smoke_former=9		then smoke_f_c=-9; /* missing */
	else 							smoke_f_c=-9;

	** cancer grade cat;
	cancer_g_c=.;
	if 	    cancer_grade='1'		then cancer_g_c=0; 
	else if cancer_grade='2'		then cancer_g_c=1;
	else if cancer_grade='3'		then cancer_g_c=2;
	else if cancer_grade='4'		then cancer_g_c=3;
	else if cancer_grade='9'		then cancer_g_c=-9; /* missing */

	** bmi three categories;
	bmi_c=.;
	if		0<bmi_cur<18.5		then bmi_c=0; /*underweight*/
	else if 18.5<=bmi_cur<25 	then bmi_c=1; /* normal */
   	else if 25<=bmi_cur<30 		then bmi_c=2; /* overweight */
   	else if 30<=bmi_cur 		then bmi_c=3; /* obese */
   	else if bmi_cur=. 			then bmi_c=-9; /* missing */
      	
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

	** first primary cancer stage;
	stage_c=.;
	if      cancer_ss_stg='0' 					then stage_c=0;
	else if cancer_ss_stg='1' 					then stage_c=1;
	else if cancer_ss_stg in ('2','3','4','5')	then stage_c=2;
	else if cancer_ss_stg='7'					then stage_c=3;
	else if cancer_ss_stg in ('8','9')			then stage_c=4;
	else  										stage_c=-9;	

	** coffee drinking;
	coffee_c=.;
	if		qp12b='0'							then coffee_c=0; 	/* none */
	else if qp12b in ('1','2','3','4','5','6')	then coffee_c=1; 	/* <=1/day */
	else if qp12b='7'							then coffee_c=2; 	/* 2-3/day */
	else if qp12b in ('8','9')					then coffee_c=3; 	/* >=4/day */
	else if qp12b in ('E','M')					then coffee_c=-9;	/* missing */
	else										coffee_c=-9; 		/* missing */

	** total alcohol per day; /* CHECKME */
	etoh_c=.;
	if mped_a_bev=0					then etoh_c=0;		/* none */
	else if 0   <mped_a_bev<=0.04	then etoh_c=1;		/* 0-0.04 */
	else if 0.04<mped_a_bev<=0.1 	then etoh_c=2;		/* 0.04-0.1 */
	else if 0.1 <mped_a_bev<=0.52	then etoh_c=3;		/* 0.1-0.52 */
	else if 0.52<mped_a_bev<=1.12	then etoh_c=4;		/* 0.52-1.12 */
	else if 	 mped_a_bev> 1.12	then etoh_c=5;		/* 1.12-37.44 */
	else 		 					etoh_c=-9;			/* missing */

	** risk physical exercise ages 15..18 cat;
	rf_physic_1518_c=.;
	if      rf_phys_modvig_15_18 in (0,1)	then rf_physic_1518_c=0; /* rarely */
	else if rf_phys_modvig_15_18=2 	 		then rf_physic_1518_c=1; /* <1 hour/week */
	else if rf_phys_modvig_15_18=3 	 		then rf_physic_1518_c=2; /* 1-3 hours/week */
	else if rf_phys_modvig_15_18=4     		then rf_physic_1518_c=3; /* 4-7 hours/week */
	else if rf_phys_modvig_15_18=5     		then rf_physic_1518_c=4; /* >7 hours/week */
	else if rf_phys_modvig_15_18=9	 		then rf_physic_1518_c=-9; /* missing */
	else 									rf_physic_1518_c=-9;

	** (rf) physical exercise how often participate mod-vig activites in past 10 years;
	rf_physic_c=.;
	if		rf_phys_modvig_curr in (0,1)	then rf_physic_c=0;	/* none-rarely */
	else if rf_phys_modvig_curr=2			then rf_physic_c=1; /* <1 hr/week */
	else if rf_phys_modvig_curr=3			then rf_physic_c=2; /* 1-3 hr/week */
	else if rf_phys_modvig_curr=4			then rf_physic_c=3; /* 4-7 hr/week */
	else if rf_phys_modvig_curr=5			then rf_physic_c=4; /* >7 hr/week */
	else if rf_phys_modvig_curr=9			then rf_physic_c=-9; /* missing */
	else 									rf_physic_c=-9;

	alcohol=.;
	if mped_a_bev=0							then alcohol=0;		/* none */
	else if 0<mped_a_bev<=1					then alcohol=1;		/* 0-1 */
	else if 1<mped_a_bev<=2 				then alcohol=2;		/* >1-<=2 drinks*/
	else if 2< mped_a_bev<=3				then alcohol=3;		/* >2-<=3 drinks */
	else if 3<mped_a_bev					then alcohol=4;		/* >3 drinks */
	else 									alcohol=-9;			/* missing */

	white=.;
	if race_c=0 							then white=1; /* non-Hispanic white */
	else white=-9;

	/* checked 20151201TUE wtl */
	/*utilizer_m=-9; 
	if rf_Q15A='1' | rf_Q15B='1' | 
		rf_Q15C='1' | rf_Q15D='1' 			then utilizer_m=1;
	else if rf_Q15E='1'						then utilizer_m=0; 
	else utilizer_m=0;*/

	utilizer_m=-9;
	if rf_Q15E='1'			then utilizer_m=0;
	else if rf_Q15A='1'		then utilizer_m=1;
	else if rf_Q15B='1'		then utilizer_m=1;
	else if rf_Q15C='1'		then utilizer_m=1;
	else if rf_Q15D='1'		then utilizer_m=1;

	utilizer_w=.; /* CHECK */
	if rf_Q44='1' | rf_Q44='2'				then utilizer_w=1; /* yes once and more mammograms in last 3 years*/
	else utilizer_w=0;

	aspirin_collapse=.;
	if RF_ABNET_CAT_ASPIRIN=0				then aspirin_collapse=0; /* no use */
	else if RF_ABNET_CAT_ASPIRIN=1			then aspirin_collapse=1; /* monthly use */
	else if RF_ABNET_CAT_ASPIRIN>=2			then aspirin_collapse=2; /* >monthly use */

	ibu_collapse=.;
	if RF_ABNET_CAT_IBUPROFEN=0				then ibu_collapse=0; /* no use */
	else if RF_ABNET_CAT_IBUPROFEN=1		then ibu_collapse=1; /* monthly use */
	else if RF_ABNET_CAT_IBUPROFEN>=2		then ibu_collapse=2; /* >monthly use */

	melanoma_ins=.;
	if 		melanoma_c=1 	 then melanoma_ins=1;
	else if melanoma_c=0	 then melanoma_ins=0;
	else if melanoma_c=2	 then melanoma_ins=0;

	melanoma_mal=.;
	if 		melanoma_c=2	 then melanoma_mal=1;
	else if melanoma_c=0	 then melanoma_mal=0;
	else if melanoma_c=1	 then melanoma_mal=0;

run;

** check melanoma variables;
proc freq data=melan_use;
	table rf_Q44*utilizer_w utilizer_m /missing;
run;

** add labels;
proc datasets library=work;
	title;
	modify melan_use;
	
	** set variable labels;
	label 	/* melanoma outcomes */
			melanoma_agg = "Melanoma indicator"
			melanoma_c = "Melanoma indicator by type"
			melanoma_ins= "Melanoma in situ indicator"
			melanoma_mal= "Malignant melanoma indicator"

			/* for baseline */
			uvrq = "TOMS UVR measures in quartiles"
			educ_c = "education level"
			physic_c = "level of physical activity"	
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

			educ_c educfmt. race_c racefmt. 
			physic_c physic_1518_c physicfmt. smoke_f_c smokingfmt. 
			bmi_fc bmifmt. agecat agecatfmt.
			smoke_former smokeformerfmt. smoke_quit smokequitfmt. smoke_dose smokedosefmt. 
			smoke_quit_dose smokequitdosefmt.
			coffee_c coffeefmt. etoh_c etohfmt. rf_abnet_aspirin rf_abnet_aspirinfmt.
			rf_abnet_ibuprofen rf_abnet_ibuprofenfmt. rf_abnet_cat_aspirin rf_abnet_cat_aspirinfmt.
            rf_abnet_cat_ibuprofen rf_abnet_cat_ibuprofenfmt.
			rf_physic_1518_c rfphysicfmt. rf_physic_c rfphysicfmt.
	;
run;

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

	nsaid_1=nsaid;
	if nsaid_1 in (2,3)				then nsaid_1=0;
	nsaid_2=nsaid;
	if nsaid_2 in (1,3)				then nsaid_2=0;
	nsaid_3=nsaid;
	if nsaid_3 in (1,2)				then nsaid_3=0;

	utilizer=.; *combine utilizer_m (colonoscopy) and utilizer_w (mammogram) into single variable;
	if			utilizer_m=1 and utilizer_w=1		then utilizer=1; *both yes;
	if			utilizer_m=1 and utilizer_w=0		then utilizer=1; *colonoscopy yes, mammogram no = utilizer yes;
	if			utilizer_m=0 and utilizer_w=1		then utilizer=1; *colonoscopy no, mammogram yes = utilizer yes;
	if			utilizer_m=0 and utilizer_w=0		then utilizer=0; *both no = utilizer no;

	coffee=.;
	if		qp12b='0'							then coffee=0; 	/* none */
	else if qp12b in ('1','2','3','4','5','6')	then coffee=1; 	/* <=1/day */
	else if qp12b='7'							then coffee=2; 	/* 2-3/day */
	else if qp12b in ('8','9')					then coffee=3; 	/* >=4/day */
	else if qp12b in ('E','M')					then coffee=-9;	/* missing */
	else	coffee_c=-9; 										/* missing */
run;

proc copy noclone in=Work out=conv;
	select melan_use;
run;
