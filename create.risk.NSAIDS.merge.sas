/******************************************************************
#      NIH-AARP UVR- NSAIDs- Melanoma Study
*******************************************************************
#
# merges the rout25mar16 and rexp23feb16 datasets
# !!!!! for risk factors dataset !!!!!
#
# uses the uv_public, rout25mar16, rexp23feb16 datasets
# note: using new rexp dataset above
#
# Created: April 13 2015
# Updated: v20160523MON WTL
# Under git version control
# Used IMS: anchovy server
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
	merge ranalysis (in=rin) conv.uv_pub1 ;
	by westatid;
	if rin;
run;

/* check point for merging the exposure and outcome data */
** copy and save the ranalysis dataset to the converted folder;
proc copy noclone in=Work out=conv;
	select ranalysis;
run;
