libname analysis 'E:\NCI REB\AARP\Data\converted';

data outcome;
  set analysis.rout09jan14;
  
data exposure;
  set analysis.rexp16feb15;
     
data analysis;
  merge outcome (in=ino)
        exposure (in=ine);
  by westatid;
 
proc datasets;
  delete outcome exposure;   
  
data ranalysis;  
  set analysis ;







