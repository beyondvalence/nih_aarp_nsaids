/*****************************************************************************/
/*   saved as: /prj/aarppublic/examples/breast.risk.programbegin.sas         */
/*****************************************************************************/

%include '/prj/aarppublic/includes/breast.analysis.risk.include.sas';


title1 "DietAARP Breast Cancer Analysis file";

data females;
  set analysis (keep=westatid sex breastcan breastc_dxdt end_fl); /*keeps only the variables for the analysis you are working on*/
  where sex=1; /*keeps only the male subjects:  0=male, 1=female*/

proc datasets;
  delete analysis; /*delete large input file*/

