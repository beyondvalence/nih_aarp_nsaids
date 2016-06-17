/**********************************************************************************************************/
/*   Filename: /prj/aarppublic/examples/sample.all.cancer.risk.program.begin.sas                          */
/*   Created:  14feb06                                                                                    */
/*   Purpose:  To include All Cancer RFQ analysis file, keep necessary variables, and perform exclusions  */
/*                                                                                                        */
/**********************************************************************************************************/

/********************************************************************************************************/
/*                                                                                                      */
/*   Sample code to include all cancer RFQ analysis file, keep necessary variables,                     */
/*   and perform exclusions with the all cancer RFQ exclusion macro                                     */
/*                                                                                                      */
/*   ***IMPORTANT!***                                                                                   */  
/*   Please note that the only change that can be made in the next section of code is the addition      */  
/*   of variables to the keep statement.  Any other change may crash the program and/or                 */  
/*   alter the SAS library.                                                                             */
/********************************************************************************************************/


title1 "DietAARP All Cancer Analysis file";
title2 "RFQ Cohort";


%include '/prj/aarppublic/includes/all.cancer.analysis.risk.include.sas';
/****** DO NOT INSERT ANY CODE HERE                                                *****/
(keep=westatid raadate dod f_dob coloncan colon_dxdt rf_entry_dt cancer cancer_dxdt fl_proxy fl_rf_proxy sex self_other health 
               rf_Q23_2_1A rf_Q23_2_2A);

/***************************************************************************************/
/*  Create exit date, exit age, and person years for Cancer of Interest                */
/*          Example:  Colon Cancer                                                     */
/***************************************************************************************/
   exit_dt=min(colon_dxdt, mdy(12,31,2006), dod, raadate); 
   personyrs=round(((exit_dt-entry_dt)/365.25),.001);
   exit_age=entry_age+personyrs;



/***************************************************************************************/ 
/*   Implement first primary cancer RFQ exclusion macro:                               */
/*   (code below is copied from the all cancer RFQ exclusion macro)                    */
/*                                                                                     */             
/*                                                                                     */             
/* Program: /prj/aarppublic/macros/exclusions.all.cancer.risk.macro.sas                */
/* Created: 14feb06                                                                    */
/* Updated:                                                                            */
/***************************************************************************************/



/***************************************************************************************/
/*                                                                                     */
/*  Use the exclusion macro to make "standard" exclusions and get counts of            */
/*  excluded subjects.  Each parameter excludes subjects with that condition.          */
/*                                                                                     */
/*  The macro must be included with the statement:                                     */
/*  %include '/prj/aarppublic/macros/exclusions.all.cancer.risk.macro.sas';            */
/*                                                                                     */
/*  Then the macro could be called with any or all of the following parameters:        */
/*                                                                                     */
/*  data            = name of SAS dataset containing the analysis cohort data          */
/*  ex_proxy        = remove proxy (Box B) respondents (default=yes)                   */
/*  ex_rf_proxy     = remove RFQ proxy (RFQ Box B) respondents (default=yes)           */
/*  ex_sex          = remove specific gender (0=male, 1=female - default=keep both)    */
/*  ex_selfother**  = remove self-reported other cancer on baseline qx (default=no)    */
/*  ex_rf_selfbreast= remove self-reported breast cancer on RFQ (default=no)           */
/*  ex_rf_selfovary = remove self-reported ovarian cancer on RFQ (default=no)          */
/*  ex_health       = remove self-reported poor health on baseline qx  (default=no)    */
/*  ex_prevCOI      = remove prevalent COI (give case variable name if yes, blank if no)  */   
/*  ex_deathCOI     = remove death only reports of COI (give case variable name if yes)   */   
/*  ex_prevcan      = remove subjects with any* prevalent cancer (yes/no)  (default=yes)  */                          
/*  ex_deathcan     = remove subjects with death only reports of any* cancer(default=no)  */ 
/*         * any cancer does not include non-melanoma skin cancers                     */
/*                                                                                     */
/*        ** Note: subjects with Baseline self reports of prostate, breast, and colon  */
/*           cancer were not sent RFQ's, so these exclusions are not present here      */
/*                                                                                     */
/*  An example run of the macro would be:                                              */
/*  %exclude(data            = analysis,                                               */
/*           ex_proxy        = 1,                                                      */
/*           ex_rf_proxy     = 1,                                                      */
/*           ex_sex          = 1,                                                      */
/*           ex_selfother    = 1,                                                      */
/*           ex_rf_selfbreast= 1,                                                      */
/*           ex_rf_selfovary = 1,                                                      */
/*           ex_health       = 1,                                                      */
/*           ex_prevCOI      =  remove prevalent COI (give case variable name if yes, blank if no) */   
/*           ex_deathCOI     =  remove death only reports of COI (give case variable name if yes)  */   
/*           ex_prevcan      = 1,                                                      */
/*           ex_deathcan     = 1);                                                     */
/*                                                                                     */
/*                                                                                     */
/*   NOTE:  The following variables must be KEPT in your dataset prior to running      */
/*          the Exclusions Macro:                                                      */
/*          westatid                                                                   */
/*          rf_personyrs                                                               */
/*          rf_entry_dt                                                                */
/*          exit_dt                                                                    */
/*          cancer                                                                     */
/*          cancer_dxdt                                                                */
/*                                                                                     */
/*          To make certain exclusions work, certain other variables must be KEPT:     */
/*               EXCLUSION                NECESSARY VARIABLE                           */
/*               ex_proxy        = 1          fl_proxy                                 */
/*               ex_rf_proxy     = 1          fl_rf_proxy                              */
/*               ex_sex          = 1          sex                                      */
/*               ex_selfother    = 1          self_other                               */
/*               ex_rf_selfbreast= 1          rf_Q23_2_1A                              */
/*               ex_rf_selfovary = 1          rf_Q23_2_2A                              */
/*               ex_health       = 1          health                                   */
/*                                                                                     */
/*                                                                                     */
/***************************************************************************************/
 

%include '/prj/aarppublic/macros/exclusions.all.cancer.risk.macro.sas'; 

%exclude(data            = analysis,
         ex_proxy        = 0,
         ex_rf_proxy     = 1,
         ex_sex          = ,
         ex_selfother    = 1,
         ex_rf_selfbreast= 1,
         ex_rf_selfovary = 1,
         ex_health       = 1,
         ex_prevCOI      = coloncan,
         ex_deathCOI     = coloncan,
         ex_prevcan      = 1,
         ex_deathcan     = 1);

