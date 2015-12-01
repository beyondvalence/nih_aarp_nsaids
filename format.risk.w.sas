/****************************/
/* AARP NSAIDS MELANOMA     */
/* Format file              */
/* Created: 20151130MON WTL */
/****************************/

** set value formats ; 
proc format;
	value sexfmt 					0='Male' 
									1='Female';
	value melanfmt 					0='No melanoma' 
									1='In situ melanoma' 
									2='Malignant melanoma';
	value melanomafmt 				0='No melanoma' 
									1='Melanoma';
	value agecatfmt 				1='<55 years' 
									2='55-59 years' 
									3='60-64 years' 
									4='65-69 years' 
									5='>=70 years';
	value racefmt 					-9='Missing' 
									0='Non-Hispanic white' 
									1='Non-Hispanic black' 
									2='Hispanic, Asian, PI, AIAN';
	value educfmt 					-9='Missing' 
									0='High School or less' 
									1='Some college' 
									2='College or graduate school';
	value bmifmt 					-9='Missing' 
									1='18.5 to 25' 
									2='25 to 30' 
									3='30 to 35' 
									4='35 to 40' 
									5='>=40';
	value physicfmt 				-9='Missing' 
									0='Rarely' 
									1='1-3 per month' 
									2='1-2 per week' 
									3='3-4 per week' 
									4='5+ per week';
	value smokingfmt 				-9='Missing' 
									0='Never smoked' 
									1='Ever smoke';

/* :::risk factors::: */
	** smoking;	
	value smokeformerfmt 			9='Missing' 
									0='Never smoked' 
									1='Former smoker' 
									2='Current smoker';
	value smokequitfmt 				9='Missing' 
									0='Never smoked' 
									1='Stopped 10+ years ago' 
									2='Stopped 5-9 years ago'
									3='Stopped 1-4 years ago' 
									4='Stopped within last year' 
									5='Currently smoking';
	value smokedosefmt 				9='Missing' 
									0='Never smoked' 
									1='1-10 cigs a day' 
									2='11-20 cigs a day' 
									3='21=30 cigs a day'
									4='31-40 cigs a day' 
									5='41-60 cigs a day' 
									6='60+ cigs a day';
	value smokequitdosefmt 			9='Missing' 
									0='Never smoked' 
									1='Quit, <=20 cigs/day' 
									2='quit, >20 cigs/day'
									3='Currently smoking, <=20 cigs/day' 
									4='Currently smoking, >20 cigs/day';
	value coffeefmt 				-9='Missing' 
									0='None' 
									1='<=1 cup/day' 
									2='2-3 cups/day' 
									3='>=4 cups/day';
	value etohfmt 					-9='Missing' 
									0='0' 
									1='>0 to 0.04' 
									2='>0.04 to 0.1' 
									3='>0.1 to 0.52' 
									4='>0.52 to 1.12' 
									5='>1.12'; /* might want to change */
	value rfphysicfmt 				-9='Missing' 
									0='Never-rarely' 
									1='<1 hr/week' 
									2='1-3 hr/week' 
									3='4-7 hr/week' 
									4='>7 hr/week';
	value rf_abnet_aspirinfmt 		0='No' 
									1='Yes';
	value rf_abnet_ibuprofenfmt 	0='No' 
									1='Yes';
	value rf_abnet_cat_aspirinfmt 	0='No use' 
									1='Monthly' 
									2='Weekly' 
									3='Daily';
	value rf_abnet_cat_ibuprofenfmt 0='No use' 
									1='Monthly' 
									2='Weekly' 
									3='Daily';
	value aspirin_collapse_fmt 		0='no use' 
									1='monthly' 
									2='weekly/daily' 
									-9='missing';
	value ibu_collapse_fmt 			0='no use' 
									1='monthly' 
									2='weekly/daily' 
									-9='missing';

	value excludefmt 				0='include'
									1='exclude';
run;
