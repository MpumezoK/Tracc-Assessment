 /****** 
 
- This Script is written in Microsoft SQL utilising the SQL Server Management Studio (SSMS)
- The Dataset maturity_assessment_dataset.csv was impoted into a table named maturity_ass on a cci DATABASE
- The below script is an attempt to answer a series of questions and these questions precedes every response as shown below:
 ******/
 
 
/* Which client has conducted the most assessments in total? */

SELECT Top 1 [client]
      ,COUNT([tracc_maturity]) as NumberofAssessments
  FROM [cci].[dbo].[maturity_ass]
  GROUP BY client 
  ORDER BY COUNT([tracc_maturity]) DESC
  
  

/* Across how many countries are our clients assessing TRACC practices ? */ 

 SELECT COUNT(DISTINCT country) as countriesWithTRACC_practices
 FROM [cci].[dbo].[maturity_ass]



/* How many assessments were conducted in total for all clients, after 31 March 2018 ? */

  SELECT COUNT([tracc_maturity]) as NumberofAssessmentsonAllClients
  FROM [cci].[dbo].[maturity_ass]
  WHERE assessment_date >'2018-03-31'
  

 /*  How many unique TRACC practices did Client 48 assess ? */ 
 
   SELECT COUNT( DISTINCT tracc_practice) as NumberofPracticesfoClient48
   FROM DBO.maturity_ass
   WHERE client = 'client 48'
   

/* How many assessments were done for each practice in 2017 ? */

   SELECT tracc_practice
   ,COUNT([tracc_maturity]) as Assessmentsin2017
   ,Year(assessment_date)
   FROM DBO.maturity_ass
   where Year(assessment_date) = '2017'
   group by tracc_practice,Year(assessment_date)
   
 

/* Which clients have achieved a maturity score greater than 2.5, for the 5S and Teamwork practices ? */

 SELECT distinct client 
 FROM DBO.maturity_ass
 where [tracc_maturity] > 2.5 and tracc_practice in ('5S','Teamwork')

