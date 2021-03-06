/****************************/
/* AARP NSAIDS MELANOMA     */
/* Format file              */
/* Created: 20151223WED WTL */
/* Updated: 20160523MON WTL */
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
	value birthcohortfmt			1='1925 to 1928'
									2='1928 to 1931'
									3='1931 to 1935'
									4='1935 to 1939'
									5='1939 to 1945';
	value nsaidbifmt				9='Missing'
									0='No reported NSAID use'
									1='Reported NSAID use';
	value nsaidfmt					9='Missing'
									0='No reported NSAID use'
									1='Monthly NSAID user'
									2='Weekly NSAID user'
									3='Daily NSAID user';
	value agecatfmt 				1='1. 51-59 years' 
									2='2. 60-64 years' 
									3='3. 65+ years';
	value uvrqfmt					9='Missing'
									1='1. >176 and <=186.255'
									2='2. >186.255 and <=236.805'
									3='3. >236.805 and <=253.731'
									4='4. >253.731 and <290';
	value uvrq5cfmt					1='1. >176 and <=186.255'
									2='2. >186.255 and <=213.574'
									3='3. >213.574 and <=242.867'
									4='4. >242.867 and <=255.170'
									5='5. >255.170 and < 290';
	value alcoholfmt				9='Missing'
									0='1. None'
									1='2. <1 drink per week'
									2='3. 1-6 per week'
									3='4. 7+ per week';
	value physicfmt 				9='Missing' 
									0='1. Never/rarely' 
									1='2. 1-3 per month' 
									2='3. 1-2 per week' 
									3='4. 3-4 per week' 
									4='5. 5+ per week';	
	value physiccfmt 				9='Missing' 
									0='Never' 
									1='Rarely' 
									2='1-3 per month' 
									3='1-2 per week' 
									4='3-4 per week' 
									5='5+ per week';
	value $qp12bfmt 				'0'='None' 
									'1'='Less than 1 cup per month' 
									'2'='1-3 cups per month'
									'3'='1-2 cups per week'
									'4'='3-4 cups per week'
									'5'='5-6 cups per week'
									'6'='1 cup per day'
									'7'='2-3 cups per day'
									'8'='4-5 cups per day'
									'9'='6+ cups per day'
									'E'='Error'
									'M'='Missing';
	value tvfmt						9='Missing'
									1='1. <1 hr/day'
									2='2. 1-2 hr/day'
									3='3. 3-4 hr/day'
									4='4. >=5 hr/day';
	value rftvfmt					9='Missing'
									0='None'
									1='<1 hr/day'
									2='1-2 hr/day'
									3='3-4 hr/day'
									4='5-6 hr/day'
									5='7-8 hr/day'
									6='9+ hr/day';
	value napfmt					9='Missing'
									0='1. Never nap'
									1='2. <1 hr/day'
									2='3. >=1 hr/day';
	value rfnapfmt					9='Missing'
									0='None'
									1='<1'
									2='1-2'
									3='3-4'
									4='5-6';
	value marriagefmt				9='Missing'
									1='1. Married'
									2='2. Widowed'
									3='3. Divorced or separated'
									4='4. Never married';
	value rfmarriagefmt				9='Missing'
									1='Married'
									2='Widowed'
									3='Divorced'
									4='Separated'
									5='Never married';
	value educfmt 					9='Missing' 
									1='1. High school graduate or less' 
									2='2. Post-high school'
									3='3. Some college' 
									4='4. College or graduate school';
	value rfeducfmt					9='Missing'
									1='Less than 11 years'
									2='High school'
									3='Post-high school'
									4='Some college'
									5='College and post graduate';
	value heartfmt					9='Missing'
									0='No self-reported heart disease'
									1='Yes heart disease history';
	value utilizerwfmt				9='Missing'
									0='No mammogram in past 3 years'
									1='Yes mammogram(s) in past 3 years';
	value $rfq44fmt					'0'='No mammograms'
									'1'='Yes one mammogram'
									'2'='Yes more than one mammogram';
	value utilizermfmt				9='Missing'
									0='No colorectal procedure in past 3 years'
									1='Yes colorectal procedure(s) in past 3 years';
	value $rfq15afmt 				'0'='No' 
									'1'='Sigmoidoscopy';
	value $rfq15bfmt 				'0'='No' 
									'1'='Colonoscopy';
	value $rfq15cfmt 				'0'='No' 
									'1'='Proctoscopy';
	value $rfq15dfmt 				'0'='No' 
									'1'='Unknown type';
	value $rfq15efmt 				'0'='NA' 
									'1'='None';
	value bmifmt 					9='Missing or extreme' 
									1='1. underweight, <18.5' 
									2='2. normal, 18.5-24.9' 
									3='3. overweight, 25-29.9'
									4='4. obese, 30+';
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
	value coffeefmt 				9='Missing' 
									0='1. None' 
									1='2. <=1 cup/day' 
									2='3. 2-3 cups/day' 
									3='4. >=4 cups/day';
	value rfphysicfmt 				9='Missing' 
									0='Never-rarely' 
									1='<1 hr/week' 
									2='1-3 hr/week' 
									3='4-7 hr/week' 
									4='>7 hr/week';
	value rfphysiccfmt 				9='Missing' 
									0='Never'
									1='Rarely' 
									2='<1 hr/week' 
									3='1-3 hr/week' 
									4='4-7 hr/week' 
									5='>7 hr/week';
	value htensionfmt				9='Unknown'
									0='No'
									1='Yes hypertension';
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
	value aspirin_collapsefmt 		0='no use' 
									1='monthly' 
									2='weekly/daily' 
									9='missing';
	value ibu_collapsefmt 			0='no use' 
									1='monthly' 
									2='weekly/daily' 
									9='missing';
	value nsaidfmt					9='Missing'
									0='NSAID non-user'
									1='NSAID monthly user'
									2='NSAID weekly user'
									3='NSAID daily user';
	value nsaidbifmt				9='Missing'
									0='NSAID non-user'
									1='NSAID user';
	value $rfq101fmt				'0'='No use'
									'1'='Yes use';
	value $rfq102fmt				'0'='<2 per month'
									'1'='2-3 per month'
									'2'='1-2 per week'
									'3'='3-4 per week'
									'4'='5-6 per week'
									'5'='1 per day'
									'6'='2+ per day';
	value sheblaspffmt				9='5. Unknown'
									1='2. Monthly, <=3 per month'
									2='3. Weekly, >=1 per week'
									3='4. Daily, >=1 per day'
									0='1. Non User';
	value sheblaspufmt				9='Unknown'
									1='Yes, user'
									0='Not user';
	value shebltypefmt				9='Unknown'
									1='1. Neither NSAID use'
									2='2. Aspirin use only'
									3='3. Non-aspirin use only'
									4='4. Both aspirin and non-aspirin use';
	value excludefmt 				0='include'
									1='exclude';
run;
