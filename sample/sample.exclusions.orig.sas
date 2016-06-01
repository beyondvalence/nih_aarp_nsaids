/***************************************************************************************/
/***************************************************************************************/
/************                Exclusion Criteria                    *********************/
/***************************************************************************************/
/***************************************************************************************/


data core;
  set core;

/********* Limit analysis for gender-specific cancers *********************/
  where sex=1;            /************ exclude males *********************/

/********* Exclude duplicates in the AARP dataset ******************************/
  if fl_westdup=1 then delete;

/********* Exclude outliers of energy intake ******************************/
  if fl_cal_outlier=1 then delete;

/******** Exclude women with person years less than 0 *********************/ 
  if personyrs < 0 then delete;

/********* exclude breast cancers prior to baseline by registry; **********/
/********* retain non-breast ca's prior to BL by registry *****************/
  if breastcan=3 then delete;
  
/********* OR exclude any diagnosis prior to baseline by registry; **********/
/* if oth_first_dxdate < entry_dt then delete;                              */

/******** Exclude subjects with self-reported history of breast cancer(Q41A2) */ 
/******** NB:  if hx of non-breast ca, subject retained ***********************/
   if self_breast then delete; 

/******** OR exclude subjects with self-reported history of any cancer *****/
/* if self_cancer =1 then delete;                                          */

/********* delete "only death report" b/c this is incidence analysis ******/
  if breastcan=2 then delete;

/********* exclude insitu cases, i.e., invasive cancer only analysis ******/
  if bc_insitu=1 and bc_invasive~=1 then delete;

/******** Exclude women who are still menstruating and status unknown ******/
  if menostat=1 or menostat=3 or menostat=5 or menostat=9 then delete;

/******** Rename breast case from breastcan to case for model running purposes */
  case=breastcan;
  


/****************************************************************************************/
/****************************************************************************************/
/************           Flags for Sensitivity Analysis             **********************/
/****************************************************************************************/
/****************************************************************************************/


/******** Remove anyone with discrepancies between Frame and Baseline dates of birth ****/ 
/*  if fl_age > 0 then delete;                                                          */
  
/******** Remove anyone with discrepancies between Frame, Baseline, & p.16 gender    ****/ 
/*  if fl_gender > 0 then delete;                                                       */


/****************************************************************************************/
/****************************************************************************************/
/************           Modifications for Latency Analysis         **********************/
/************  move this code before exclusions if doing Latency Analysis  **************/
/****************************************************************************************/
/****************************************************************************************/

/********* Add numyrs (1,2,etc) to entry date, recalculate person years,                */
/********* and exclude COI dx before new entry date                                     */
/*  numyrs = 1;                                                                         */
/*  entry_dt = entry_dt + numyrs*(365.25);                                              */
/*  personyrs=round(((exit_dt-entry_dt)/365.25),.01);                                   */
/*  if breastc_dxdt < entry_dt then delete;                                             */



