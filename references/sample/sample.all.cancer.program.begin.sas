/********************************************************************************************************/
/*   Filename: /prj/aarppublic/examples/sample.all.cancer.program.begin.sas                             */
/*   Created:  14feb06                                                                                  */
/*   Purpose:  To include All Cancer analysis file, keep necessary variables, and perform exclusions    */
/*                                                                                                      */
/********************************************************************************************************/

/********************************************************************************************************/
/*                                                                                                      */
/*   Sample code to include all cancer analysis file, keep necessary variables,                         */
/*   and perform exclusions with the all cancer exclusion macro                                         */
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
/*          Example:  Colon Cancer                                                     */
/***************************************************************************************/
   exit_dt=min(colon_dxdt, mdy(12,31,2006), dod, raadate); 
   personyrs=round(((exit_dt-entry_dt)/365.25),.001);
   exit_age=entry_age+personyrs;
   
   

/***************************************************************************************/ 
/*   Implement All Cancer exclusion macro:                                             */
/*   (code below is copied from the All Cancer exclusion macro)                        */
/*                                                                                     */
/*                                                                                     */
/* Program: /prj/aarppublic/macros/exclusions.new.all.cancer.macro.sas                 */
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
