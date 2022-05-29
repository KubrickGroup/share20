CREATE TABLE XXXXX.cardcustomer
(
 ClientNum BIGINT PRIMARY KEY
,Attrition_Flag VARCHAR(100)
,Customer_Age INT
,Gender VARCHAR(10)
,Dependent_count INT
,Education_Level VARCHAR(100)
,Marital_Status VARCHAR(100)
,Income_Category VARCHAR(100)
,Card_Category VARCHAR(100)
,Months_on_book INT
,Total_Relationship_Count INT
,Months_Inactive_12_mon INT
,Contacts_Count_12_mon INT
,Credit_Limit DECIMAL(10,2)
,Total_Revolving_Bal DECIMAL(10,2)
,Avg_Open_To_Buy DECIMAL(10,2)
,Total_Amt_Chng_Q4_Q1 DECIMAL(10,2)
,Total_Trans_Amt DECIMAL(10,2)
,Total_Trans_Ct DECIMAL(10,2)
,Total_Ct_Chng_Q4_Q1 DECIMAL(10,2)
,Avg_Utilization_Ratio FLOAT
);
