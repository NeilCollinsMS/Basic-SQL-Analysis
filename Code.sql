#Big Query Regression Example


CREATE OR REPLACE MODEL
 `sql-coding-sample-1.Medicare.infone`
 
OPTIONS
  (MODEL_TYPE='LINEAR_REG',
  input_label_cols=['average_covered_charges']) AS

SELECT
  oneinf.total_discharges,
  oneinf.average_covered_charges
  
FROM
  `sql-coding-sample-1.Medicare.oneinf` AS oneinf
  
# Result: No correlation (R^2 = 0.008), further analysis needed. 

################

#WEIGHTS
SELECT
  *
FROM
  ML.WEIGHTS(MODEL `sql-coding-sample-1.Medicare.infone`,
  STRUCT(true AS standardize));
  
  
################

  #EVALUATE
SELECT
  *
FROM
  ML.EVALUATE(MODEL `sql-coding-sample-1.Medicare.infone`);

#################

#PREDICT
SELECT
*
FROM
  ML.PREDICT(MODEL `sql-coding-sample-1.Medicare.infone`,
(
SELECT
  oneinf.total_discharges,
  oneinf.average_covered_charges
FROM
  `sql-coding-sample-1.Medicare.oneinf` AS oneinf
    ))
    
    
