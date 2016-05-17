/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# creates the melanoma file with cancer, smoking,
# NSAID, UVR variables
# !!!!! for risk factors dataset !!!!!
#
# uses the uv_public, rout25mar16, rexp23feb16 datasets
# note: using new rexp dataset above
#
# Created: April 13 2015
# Updated: v20160517TUE WTL
# Under git version control
# Used IMS: anchovy server
# Warning: original IMS datasets are in LINUX latin1 encoding
*******************************************************************/

options nocenter yearcutoff=1900 errors=1;
title1 'NIH-AARP NSAIDs UVR Melanoma Study';

libname conv 'C:\REB\NSAIDS melanoma AARP\Data\converted';
libname anchovy 'C:\REB\NSAIDS melanoma AARP\Data\anchovy';
filename uv_pub 'C:\REB\NSAIDS melanoma AARP\Data\anchovy\uv_public.v9x';

** import the UVR with file extension v9x from the anchovy folder;
proc cimport data=uv_pub1 infile=uv_pub; 
run;

** keep the july 1978-2005 UVR data only;
data conv.uv_pub1;
	set uv_pub1; 
	keep	westatid
			exposure_jul_78_05;
run;

** input: first primary cancer _risk; 
** output: ranalysis;
** uses rout25mar16, rexp23feb16, uv_pub1;
** riskfactor dataset;

data ranalysis;  
  *merge conv.rout09jan14 (in=ino) conv.rexp16feb15 (in=ine);
  merge anchovy.rout25mar16 (in=ino) anchovy.rexp23feb16 (in=ine);
  by westatid;
	keep	westatid
			rf_entry_dt
			rf_entry_age
			entry_dt
			f_dob
			racem /* for race exclusions */
			SEX
			raadate /* date moved outside of Registry Ascertainment Area */
			entry_age
			entry_dt
			cancer
			cancer_dxdt
			cancer_seergroup
			cancer_behv /* for cancer staging */
			cancer_siterec3

			self_other /* required for excl macro, for self reported cancers */

			health /* required for excl macro */
			DOD /* date of death */
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

		/******** riskfactor characteristics variables ********/
			rf_agecat
			rf_1d_cancer

			/* necessary for exclusions */
			fl_rf_proxy
			rf_q23_2_1a
			rf_q23_2_2a

			/* add more variables here */
			rf_Q44					/* mammogram */
			rf_Q15A					/* colonoscopy */
			rf_Q15B
			rf_Q15C
			rf_Q15D
			rf_Q15E
			HEART					/* baseline Q40C */
			DIABETES				/* baseline Q40B self-report diabetes y/n */
			MARRIAGE
			BMI_CUR					/* current bmi kg/m2*/
			qp12b 					/* coffee drinking */
			physic 					/* physical activity >=20 min in past 12 months */
			physic_1518				/* physical activity >=20 min in past 12 months during ages 15-18 */
			mped_a_bev 				/* total alcohol per day including food sources */
			q29c					/* single supplement: selenium */
			q30b1					/* how often: beta-carotene */
			q30b2					/* amount: beta-carotene */
			q30d1					/* how often: vitamin e */
			q30d2					/* amount: vitamin e */
			rf_Q47_1				/* Ever been told by doctor to have hypertension */
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

** merge the melan_r dataset with special UVR dataset;
data ranalysis;
	merge ranalysis (in=frodo) conv.uv_pub1 ;
	by westatid;
	if frodo;
run;

/* check point for merging the exposure and outcome data */
** copy and save the ranalysis dataset to the converted folder;
proc copy noclone in=Work out=conv;
	select ranalysis;
run;

/******************************************************************************************/
/* start2 */
/* create melanoma outcome variables
/* exit dates, person years
/* use exclusions macro, exclude non-whites, exclude LE zero personyears
/******************************************************************************************/
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

	melanoma_ins=0;
	if 		melanoma_c=1 	 	then melanoma_ins=1;
	melanoma_mal=0;
	if 		melanoma_c=2	 	then melanoma_mal=1;

	****  Create exit date, exit age, and person years for First Primary Cancer;
	** with first primary cancer as skin cancer;
	* Chooses the earliest of 4 possible exit dates for skin cancer;
  	exit_dt = min(mdy(12,31,2011), cancer_dxdt, dod, raadate); 
  	exit_age = round(((exit_dt-f_dob)/365.25),.001);
  	personyrs = round(((exit_dt-entry_dt)/365.25),.001);
	rf_personyrs = round(((exit_dt-rf_entry_dt)/365.25),.001);
	yob=year(F_DOB);

	format exit_dt entry_dt rf_entry_dt f_dob dod cancer_dxdt raadate Date9.;
run;


**** Exclusions risk macro;
*Start here to run macro to get exclusion;
ods _all_ close; ods html;
%include 'C:\REB\NSAIDS melanoma AARP\Analysis\anchovy\exclusions.first.primary.risk.macro.sas';

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

/***************************************************************************************/ 
/*   Exclude if person-years <= 0                                                      */
/***************************************************************************************/      
title 'exclusion person years <=0';
data melan_r;
    set melan_r;
    excl_2_pyr=0;
    if rf_personyrs <= 0 then excl_2_pyr=1;
	where excl_1_race=0;
run;
proc freq data= melan_r ;
	title 'excl_2_pyr: exclude 0 or negative person years';
	tables 	excl_1_race*excl_2_pyr
			excl_2_pyr*melanoma_c /missing;
run;

/***************************************************************************************/ 
/*   Exclude if UVR <= 0                                                               */
/*   updated 20160517TUE WTL                                                           */
/***************************************************************************************/      
title 'exclusion UVR missing';
data melan_r;
    set melan_r;
    excl_3_exposure=0;
    if exposure_jul_78_05 <= 0 then excl_3_exposure=1;
	where excl_2_pyr=0;
run;
proc freq data= melan_r ;
	title 'excl_3_exposure: exclude 0 or less and missing UVR';
	tables 	excl_2_pyr*excl_3_exposure
			excl_3_exposure*melanoma_c /missing;
run;
data melan_r;
	set melan_r;
	where excl_3_exposure=0;
run;

proc freq data= melan_r;
	title 'RFQ counts';
	tables melanoma_c*sex /missing;
run;
title;

/******************************************************************************************/
** find the cutoffs for the percentiles of UVR- exposure_jul_78_05 ;
/*proc univariate data=conv.melan_r;
	var exposure_jul_78_05; 
	output 	out=blu 
			pctlpts= 0 20 40 60 80 100
			pctlpre=p;
run;
proc print data=blu; 
	title 'UVR exposure percentiles';
run; */

	** need to change the exposure percentiles after exclusion change;
	** uvr exposure;
	** Quartiles: 176.095 <= Q1 <= 186.255 < Q2 <= 236.805 < Q3 <= 253.731 < Q4 <= 289.463;
/******************************************************************************************/
/** start3
/** create the UVR, and confounder variables by quartile/categories
/** for both baseline and riskfactor questionnaire variables
/** cat=categorical **/
/** reordered 20160119TUE **/
/******************************************************************************************/
data melan_use;
	set melan_r;
	
	** UVR TOMS quartile;
	UVRQ=9;
	if      176.000 < exposure_jul_78_05 <= 186.255 	then UVRQ=1; /* Q1 lowest*/
	else if 186.255 < exposure_jul_78_05 <= 236.805 	then UVRQ=2; /* Q2 */
	else if 236.805 < exposure_jul_78_05 <= 253.731 	then UVRQ=3; /* Q3 */
	else if 253.731 < exposure_jul_78_05 <  290			then UVRQ=4; /* Q4 highest */

	/* education attained */
	educm_comb=9;
	if			EDUCM in (1,2)					then educm_comb=1; *high school graduate*;
	else if		EDUCM=3							then educm_comb=2; *post high school*;
	else if		EDUCM=4							then educm_comb=3; *some college*;
	else if		EDUCM=5							then educm_comb=4; *college graduate*;

	/* alcohol consumption */
	** edited to weekly, 20151223WED ;
	alcohol_comb=9;
	if 		mped_a_bev=0						then alcohol_comb=0; /* none */
	else if 0<mped_a_bev<0.142857				then alcohol_comb=1; /* <=1, <1 drink per week */
	else if 0.142857<=mped_a_bev<1				then alcohol_comb=2; /* >1-<=2 drinks, 1-6 per week */
	else if 1<=mped_a_bev						then alcohol_comb=3; /* 2< drinks, 7+ per week */

	** bmi four categories;
	bmi_c=9;
	if            bmi_cur<18.5 					then bmi_c=1; /* <18.5, underweight */
   	else if 18.5<=bmi_cur<25					then bmi_c=2; /* 18.5-24.9, normal */
   	else if 25  <=bmi_cur<30					then bmi_c=3; /* 25-29.9, overweight */
	else if 30  <=bmi_cur						then bmi_c=4; /* >=30, obese */

	** physical exercise cat;
	physic_c=9;
	if      physic in (0,1)						then physic_c=0; /* rarely */
	else if physic=2 	 						then physic_c=1; /* 1-3 per month */
	else if physic=3 	 						then physic_c=2; /* 1-2 per week */
	else if physic=4     						then physic_c=3; /* 3-4 per week */
	else if physic=5     						then physic_c=4; /* 5+ per week */

	** physical exercise between ages 15 and 18 cat;
	physic_1518_c=9;
	if      physic_1518 in (0,1)				then physic_1518_c=0; /* rarely */
	else if physic_1518=2 	 					then physic_1518_c=1; /* 1-3 per month */
	else if physic_1518=3 	 					then physic_1518_c=2; /* 1-2 per week */
	else if physic_1518=4     					then physic_1518_c=3; /* 3-4 per week */
	else if physic_1518=5     					then physic_1518_c=4; /* 5+ per week */

	** coffee drinking;
	coffee_c=9;
	if		qp12b='0'							then coffee_c=0; 	/* none */
	else if qp12b in ('1','2','3','4','5','6')	then coffee_c=1; 	/* <=1/day */
	else if qp12b='7'							then coffee_c=2; 	/* 2-3/day */
	else if qp12b in ('8','9')					then coffee_c=3; 	/* >=4/day */
	else if qp12b in ('E','M')					then coffee_c=9;	/* missing */

	/* marriage status */
	marriage_comb=9;
	if			MARRIAGE=1						then marriage_comb=1; *married or living as married *;
	else if		MARRIAGE=2						then marriage_comb=2; *widowed*;
	else if		MARRIAGE in (3,4)				then marriage_comb=3; *divorced or separated*;
	else if		MARRIAGE=5						then marriage_comb=4; *never married*;

	**********************************************************************************************************;
	** new NSAID variables below **;

	** Shebl NSAID coding 20151217THU;
	** http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0114633 ;

	** nsaid type;
	shebl_type=9;
	if		rf_Q10_1='0' and rf_Q11_1='0'					then shebl_type=1; /* neither nsaid use */
	else if rf_Q10_1='1' and rf_Q11_1='0'					then shebl_type=2; /* apsirin use only */
	else if rf_Q10_1='0' and rf_Q11_1='1'					then shebl_type=3; /* nonaspirin use only */
	else if rf_Q10_1='1' and rf_Q11_1='1'					then shebl_type=4; /* both aspirin and nonaspirin use */

	** shebl type main effect;
	shebl_type_me=shebl_type;
	if shebl_type_me=9										then shebl_type_me=.; /* unknown to missing */	

	** nsaid gamba type;
	** http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3880825/ ;
	gamba_asp=9;
	if 		rf_Q10_1='0' and rf_Q11_1='0'					then gamba_asp=1; /* NSAID non-user */
	else if rf_Q10_1='0' and rf_Q11_1='1'					then gamba_asp=2; /* NSAID non-aspirin user */
	else if rf_Q10_1='1'									then gamba_asp=3; /* NSAID aspirin user */

	** gamba_asp main effect;
	gamba_asp_me=gamba_asp;
	if gamba_asp_me=9										then gamba_asp_me=.; /* unknown to missing value */

	** aspirin use frequency;
	shebl_asp_f=9; 
	if		rf_Q10_1='1' and rf_Q10_2 in ('0','1')			then shebl_asp_f=1; /* monthly, <=3 per month */
	else if rf_Q10_1='1' and rf_Q10_2 in ('2','3','4')		then shebl_asp_f=2; /* weekly, >=1 per week */
	else if rf_Q10_1='1' and rf_Q10_2 in ('5','6')			then shebl_asp_f=3; /* daily, >=1 per day */
	else if rf_Q10_1='0'									then shebl_asp_f=0; /* no aspirin */

	**aspirin use main effect;
	shebl_asp_me=shebl_asp_f;
	if shebl_asp_me=9										then shebl_asp_me=.; /* unknown to missing */

	** nonaspirin use frequency;
	shebl_non_f=9; 
	if		rf_Q11_1='1' and rf_Q11_2 in ('0','1')			then shebl_non_f=1; /* monthly, <=3 per month */
	else if rf_Q11_1='1' and rf_Q11_2 in ('2','3','4')		then shebl_non_f=2; /* weekly, >=1 per week */
	else if rf_Q11_1='1' and rf_Q11_2 in ('5','6')			then shebl_non_f=3; /* daily, >=1 per day */
	else if rf_Q11_1='0'									then shebl_non_f=0; /* no nonaspirin */

	** nonaspirin use main effect;
	shebl_non_me=shebl_non_f;
	if shebl_non_me=9										then shebl_non_me=.; /* unknown to missing */

	** END new NSAIDs variables **;
	************************************************************************************************************************;

	/* Television watched */
	TV_comb=9;
	if			RF_PHYS_TV in (0,1)				then TV_comb=1; *none/<1 hr/day *;
	else if		RF_PHYS_TV=2					then TV_comb=2; *1-2 hours/day *;
	else if		RF_PHYS_TV=3					then TV_comb=3; *3-4 hours/day *;
	else if		RF_PHYS_TV in (4,5,6)			then TV_comb=4; *>=5 hours/day *;

	/* napping duration */
	nap_comb=9;
	if			RF_PHYS_NAP=0					then nap_comb=0; *never naps *;
	else if		RF_PHYS_NAP=1					then nap_comb=1; *<1 hour/day *;
	else if		RF_PHYS_NAP in (2,3,4)			then nap_comb=2; *naps >=1 hour/day *;

	** hypertension as told by doctor?;
	htension=9;
	if		rf_Q47_1='1'						then htension=1; /* yes to hypertension */
	else if rf_Q47_1='0'						then htension=0; /* no to hypertension*/

	/* hospital utilization-colonoscopy, sigmoidoscopy, proctoscopy in past 3 years */
	utilizer_m=9;
	if rf_Q15E='1'								then utilizer_m=0; /* yes, utilized */
	else if rf_Q15A='1'							then utilizer_m=1; /* did not utilize */
	else if rf_Q15B='1'							then utilizer_m=1; /* did not utilize */
	else if rf_Q15C='1'							then utilizer_m=1; /* did not utilize */
	else if rf_Q15D='1'							then utilizer_m=1; /* did not utilize */

	/* hospital utilization-mammograms */
	utilizer_w=9;
	if rf_Q44='1' | rf_Q44='2'					then utilizer_w=1; /* yes once and more mammograms in last 3 years*/
	else if rf_Q44='0' 							then utilizer_w=0;	/* no mamograms in last 3 years */
	
	** RF entry age quartiles;
	agecat=.;
	if		51 <= rf_entry_age < 60		then agecat=1; /* 51-59 */
	else if 60 <= rf_entry_age < 65		then agecat=2; /* 60-64 */
	else if 65 <= rf_entry_age 			then agecat=3; /* 65+ */

	/*************************************************************************************************/

	** 5 yr year of birth categories;
	bc_cat=.;
	if		1925 <= yob < 1930			then bc_cat=1; /* 1925-1929 */
	else if 1930 <= yob < 1935			then bc_cat=2; /* 1930-1934 */
	else if 1935 <= yob < 1940			then bc_cat=3; /* 1935-1939 */
	else if 1940 <= yob <= 1945			then bc_cat=4; /* 1940-1945 */

	** (rf) physical exercise how often participate mod-vig activites in past 10 years;
	rf_physic_c=9;
	if		rf_phys_modvig_curr in (0,1)		then rf_physic_c=0;	/* none-rarely */
	else if rf_phys_modvig_curr=2				then rf_physic_c=1; /* <1 hr/week */
	else if rf_phys_modvig_curr=3				then rf_physic_c=2; /* 1-3 hr/week */
	else if rf_phys_modvig_curr=4				then rf_physic_c=3; /* 4-7 hr/week */
	else if rf_phys_modvig_curr=5				then rf_physic_c=4; /* >7 hr/week */

	/*************************************************************************************************/
run;

** add labels;
proc datasets library=work;
	title;
	modify melan_use;
	
	** set variable labels;
	label 	/* melanoma outcomes */
			melanoma_c = "Melanoma indicator by type"
			melanoma_ins= "Melanoma in situ indicator"
			melanoma_mal= "Malignant melanoma indicator"

			/* for baseline */
			uvrq = "TOMS UVR measures in quartiles"
			/*educ_c = "education level"*/
			physic_c = "level of physical activity"	
			bmi_c = "bmi, rough"
			physic_c = "physical activity in past 12 months"
			physic_1518_c = "physical activity at ages 15-18"

			smoke_former ="Smoking Status"
			smoke_quit = 'Quit smoking status'
			smoke_dose = 'Smoking dose'
			smoke_quit_dose = 'Smoking status and dose combined'
			coffee_c = 'Coffee drinking'
			alcohol_comb = 'Total alchohol per day including food sources'

			/* for riskfactor */
			rf_Q10_1="RFQ aspirin indicator"
			rf_Q10_2="RFQ aspirin freq"
			rf_Q11_1="RRQ non-aspirin indicator"
			rf_Q11_2="RFQ non-aspirin freq"
			rf_Q47_1="RFQ hypertension"
			htension="Hypertension"
			rf_physic_c = "Times engaged in moderate-vigorous physical activity"
			rf_1d_cancer = "Family History of Cancer"
			shebl_asp_f="Shebl coded aspirin freq"
			shebl_non_f="Shebl coded non-aspirin freq"
			shebl_type="Shebl coded NSAID use type"
	;
	** set variable value labels;
	format	/* for outcomes */
			melanoma_c melanfmt.
			bmi_c bmifmt. agecat agecatfmt.
			smoke_quit smokequitfmt. smoke_dose smokedosefmt. 
			smoke_quit_dose smokequitdosefmt.
			coffee_c coffeefmt. 
			sex sexfmt.
			UVRQ uvrqfmt.
			alcohol_comb alcoholfmt.
			smoke_former smokeformerfmt.
			physic_c physic_1518_c physicfmt. 
			physic physic_1518 physiccfmt.
			coffee_c coffeefmt. qp12b $qp12bfmt.
			tv_comb tvfmt. RF_PHYS_TV rftvfmt.
			nap_comb napfmt. RF_PHYS_NAP rfnapfmt.
			marriage_comb marriagefmt. MARRIAGE rfmarriagefmt.
			educm_comb educfmt. EDUCM rfeducfmt.
			heart heartfmt.
			utilizer_w utilizerwfmt. rf_Q44 $rfq44fmt.
			utilizer_m utilizermfmt.
			rf_Q15A $rfq15afmt. rf_Q15B $rfq15bfmt. rf_Q15C $rfq15cfmt. rf_Q15D $rfq15dfmt. rf_Q15E $rfq15efmt.
			htension htensionfmt.
			rf_abnet_aspirin rf_abnet_aspirinfmt.
			rf_abnet_ibuprofen rf_abnet_ibuprofenfmt. 
			rf_abnet_cat_aspirin rf_abnet_cat_aspirinfmt.
            rf_abnet_cat_ibuprofen rf_abnet_cat_ibuprofenfmt.
			rf_Q10_1 rf_Q11_1 $rfq101fmt. rf_Q10_2 rf_Q11_2 $rfq102fmt. 
			shebl_asp_f shebl_non_f shebl_asp_me shebl_non_me sheblaspffmt.
			shebl_type shebl_type_me shebltypefmt.
			RF_PHYS_MODVIG_CURR rfphysiccfmt.
	;
run;

proc copy noclone in=Work out=conv;
	select melan_use;
run;
