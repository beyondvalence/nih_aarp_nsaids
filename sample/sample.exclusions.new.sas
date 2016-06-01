/********************************************************************************************************/
/*   Filename: /prj/aarppublic/examples/sample.all.cancer.program.begin.sas                             */
/*   Created:  14feb06                                                                                  */
/*   Purpose:  To include All Cancer analysis file, keep necessary variables, and perform exclusions    */
/*                                                                                                      */
/********************************************************************************************************/

/********************************************************************************************************/
/*                                                                                                      */
/*   Sample code to include the baseline all cancer analysis file, keep necessary variables,            */
/*   perform exclusions with the all cancer exclusion macro, and examples of additional                 */
/*   exclusions in the approved order of exclusions                                                     */
/*                                                                                                      */
/*   PLEASE NOTE:  Most of this program is commented out.  You must first remove the comment marks from */
/*   the relevant sections, then alter them to fit your analysis.  All of the exclusions are optional.  */
/*                                                                                                      */
/********************************************************************************************************/



/********************************************************************************************************/
/*                                                                                                      */
/*   ***IMPORTANT!***                                                                                   */  
/*   Please note that the only change that can be made in the next section of code is the addition      */  
/*   of variables to the keep statement.  Any other change may crash the program and/or                 */  
/*   alter the SAS library.                                                                             */
/********************************************************************************************************/


title1 "DietAARP All Cancer Analysis file";
title2 "Baseline Cohort";


%include '/prj/aarppublic/includes/all.cancer.analysis.include.sas';
/****** DO NOT INSERT ANY CODE HERE                                                *****/
(keep=westatid raadate dod f_dob coloncan colon_dxdt entry_dt cancer cancer_dxdt fl_proxy sex self_prostate
                    self_breast self_colon self_other health renal);

/***************************************************************************************/
/*  Create exit date, exit age, and person years for Cancer of Interest                */
/*          Example:  Colon Cancer Incidence                                           */
/***************************************************************************************/
   exit_dt=min(colon_dxdt, mdy(12,31,2000), dod, raadate); 
   exit_age=round(((exit_dt-f_dob)/365.25),.001);
   personyrs=round(((exit_dt-entry_dt)/365.25),.001);

/***************************************************************************************/ 
/*   Implement All Cancer exclusion macro:                                             */
/*   (code below is copied from the All Cancer exclusion macro)                        */
/*                                                                                     */
/*                                                                                     */
/* Program: /prj/aarppublic/macros/exclusions.all.cancer.macro.sas                     */
/* Created: 14feb06                                                                    */
/* Updated:                                                                            */
/***************************************************************************************/


/***************************************************************************************/
/*                                                                                     */
/*  Use the exclusion macro to make "standard" exclusions and get counts of            */
/*  excluded subjects.  Each parameter excludes subjects with that condition.          */
/*                                                                                     */
/*  The macro must be included with the statement:                                     */
/*  %include '/prj/aarppublic/macros/exclusions.all.cancer.macro.sas';                 */
/*                                                                                     */
/*  Then the macro could be called with any or all of the following parameters:        */
/*                                                                                     */
/*  data            = name of SAS dataset containing the analysis cohort data          */
/*  ex_proxy        = remove proxy (Box B) respondents (default=yes)                   */
/*  ex_sex          = remove specific gender (0=male, 1=female - default=keep both)    */
/*  ex_selfprostate = remove self-reported prostate cancer on baseline qx (default=no) */
/*  ex_selfbreast   = remove self-reported breast cancer on baseline qx (default=no)   */
/*  ex_selfcolon    = remove self-reported colon cancer on baseline qx (default=no)    */
/*  ex_selfother    = remove self-reported other cancer on baseline qx (default=no)    */
/*  ex_health       = remove self-reported poor health on baseline qx  (default=no)    */
/*  ex_renal        = remove self-reported end-stage renal disease (default=no)        */
/*  ex_prevCOI     =  remove prevalent COI (give case variable name if yes, blank if no) */
/*  ex_deathCOI     = remove death only reports of COI (give case variable name if yes)  */
/*  ex_prevcan      = remove subjects with any* prevalent cancer (yes/no)  (default=no)  */
/*  ex_deathcan     = remove subjects with death only reports of any* cancer(default=no) */
/*         * any cancer does not include non-melanoma skin cancers                     */
/*                                                                                     */
/*  To run this macro, first include it with the statement:                            */
/*  %include '/prj/aarppublic/macros/exclusions.all.cancer.macro.sas';                 */
/*                                                                                     */
/*  Then an example run of the macro would be:                                         */
/*  %exclude(data            = core,                                                   */
/*           ex_proxy        = 1,                                                      */
/*           ex_sex          = 1,                                                      */
/*           ex_selfprostate = 1,                                                      */
/*           ex_selfbreast   = 1,                                                      */
/*           ex_selfcolon    = 1,                                                      */
/*           ex_selfother    = 1,                                                      */
/*           ex_health       = 1,                                                      */
/*           ex_renal        = 1,                                                      */
/*           ex_prevCOI      = breastcan,                                              */
/*           ex_deathCOI     = breastcan,                                              */
/*           ex_prevcan      = 1,                                                      */
/*           ex_deathcan     = 1);                                                     */
/*                                                                                     */
/*                                                                                     */
/*   NOTE:  The following variables must be KEPT in your dataset prior to running      */
/*          the Exclusions Macro:                                                      */
/*          westatid                                                                   */
/*          personyrs                                                                  */
/*          dod                                                                        */
/*          raadate                                                                    */
/*          entry_dt                                                                   */
/*          exit_dt                                                                    */
/*          cancer                                                                     */
/*          cancer_dxdt                                                                */
/*                                                                                     */
/***************************************************************************************/
            
options mprint;

%include '/prj/aarppublic/macros/exclusions.all.cancer.macro.sas'; 

%exclude(data            = analysis,
         ex_proxy        = 1,
         ex_sex          = ,
         ex_selfprostate = 1,
         ex_selfbreast   = 1,
         ex_selfcolon    = 1,
         ex_selfother    = 1,
         ex_health       = 1,
         ex_renal        = 1,
         ex_prevCOI      = coloncan,
         ex_deathCOI     = coloncan,
         ex_prevcan      = 1,
         ex_deathcan     = 1);


/***************************************************************************************/
/*                                                                                     */
/*    Next exclude subjects for analysis-specific reasons                              */
/*                                                                                     */
/*    Once the standard exclusions are made, analysis-specific exclusions can          */
/*    be made here, health exclusions first, then main exposure exclusions.            */
/*    Use separate data steps to get counts of excluded subjects.                      */
/*                                                                                     */
/*    Note:  any exclusion that defines the primary cohort used for analysis           */
/*    should be made here, before calculating outliers.                                */
/*    Secondary analysis cohorts should be created after the outliers are              */
/*    calculated on the primary cohort.                                                */
/*                                                                                     */
/***************************************************************************************/

/*    e.g.: exclude insitu cases, i.e., analyze only invasive cancer                   */
/*data core;                                                                           */
/*  set core;                                                                          */
/*  if colon_behv=2 then delete;                                                       */

/*    e.g.: exclude women who are still menstruating or status is unknown              */
/*data core;                                                                           */
/*  set core;                                                                          */
/*  if menostat=1 or menostat=3 or menostat=5 or menostat=9 then delete;               */

/**************************************************************************************/
/*                                                                                    */
/*    Next exclude individual analysis main exposure(s) when missing                  */
/*                                                                                    */
/**************************************************************************************/

/*    e.g.: main exposure = BMI                                                       */
/*data core;                                                                          */
/*  set core;                                                                         */
/*  if bmi_cur <= .Z then delete;                                                     */


/***************************************************************************************/
/*                                                                                     */
/*                      Flags for Sensitivity Analysis                                 */
/*                                                                                     */
/*   Remove the comment marks from one or both of the following statements when        */
/*   running sensitivity analyses for discrepant date of birth or sex.                 */
/*                                                                                     */
/***************************************************************************************/

/*   Remove anyone with discrepancies between Frame and Baseline dates of birth        */ 
/*data core;                                                                           */
/*  set core;                                                                          */
/*  if fl_dob > 0 then delete;                                                         */
  
/*   Remove anyone with discrepancies between Frame, Baseline, & p.16 gender           */ 
/*data core;                                                                           */
/*  set core;                                                                          */
/*  if fl_sex > 0 then delete;                                                         */




/**************************************************************************************/
/*   Exclude outliers of energy intake                                             */
/**************************************************************************************/

/**************************************************************************************/
/*                                                                                    */
/*   Remove calorie outliers before other outliers are calculated.                    */
/*                                                                                    */
/*   Special SAS missing values are used in noout_ variables:                         */
/*                  .L = value too low                                                */
/*                  .H = value too high                                               */
/*   Delete special missing values by deleting noout_ values <= .Z                    */
/*                                                                                    */
/**************************************************************************************/
                                                                                      
/*%include '/prj/aarppublic/macros/outbox.macro.sas';                                 */
/*                                                                                    */
/*  %outbox(data     = core,                                                          */
/*          id       = westatid,                                                      */
/*          by       = sex,                                                           */
/*          comb_by  = ,                                                              */
/*          var      = calories,                                                      */
/*          cutoff1  = 3,                                                             */
/*          cutoff2  = 2,                                                             */
/*          keepzero = N,                                                             */
/*          lambzero = Y,                                                             */
/*          print    = N,                                                             */
/*          step     = 0.01,                                                          */
/*          addlog   = 0);                                                            */
                                                                                        
                                                                                        
/*data core;                                                                          */
/*  set core;                                                                         */
/*  if noout_calories <= .Z then delete;                                              */
  
/**************************************************************************************/
/*   The following exclusions are optional:                                           */
/*   After calories are removed, remove main exposure outliers using outbox macro     */
/*
/*   NEXT, remove other nutrient outliers using outbox macro                          */
/*                                                                                    */
/*   NEXT, remove outliers from non-nutrient variables using the outbox macro         */
/*                                                                                    */
/*   Use the noout_ version of the variable for outlier-free analyses.                */
/*                                                                                    */
/**************************************************************************************/


/**************************************************************************************/
/*                                                                                    */
/*   Exclude for covariates not requiring outbox macro                                */
/*                                                                                    */
/*   Note:  any exclusion that defines the primary cohort used for analysis           */
/*   should NOT be made here, but rather BEFORE calculating outliers.                 */
/*                                                                                    */
/*   Other exclusions that do not affect the primary cohort may be made here,         */
/*   AFTER the outliers are calculated on the primary cohort, as well as creating     */
/*   secondary analysis cohorts.                                                      */
/*                                                                                    */
/**************************************************************************************/

/*    e.g.: exclude subjects with unknown education level                             */
/*  if educm = 9 then delete;                                                         */

  
/**************************************************************************************/
/*                                                                                    */
/*   Modifications for Latency Analysis                                               */
/*   move this code before exclusions if doing Latency Analysis                       */
/*                                                                                    */
/**************************************************************************************/
/*                                                                                    */
/*   Add numyrs (1,2,etc) to entry date, recalculate person years,                    */
/*   and exclude any exits (death, move, COI) before new entry date                   */
/*  numyrs = 1;                                                                       */
/*  entry_dt = entry_dt + numyrs*(365.25);                                            */
/*  personyrs=round(((exit_dt-entry_dt)/365.25),.01);                                 */
/*  if exit_dt < entry_dt then delete;                                                */
/**************************************************************************************/