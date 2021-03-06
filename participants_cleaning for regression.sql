/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Security Category Name],     
		DATEDIFF(DAY,[Registration Date], [Event Date])  AS DAYS_TO_EVENT_SINCE_REGISTRATION 
		,CASE 
		WHEN [Team Division] = 'Family/Friends' THEN 'FNF'
		WHEN [Team Division] =  'Frien`s and Family' THEN 'FNF'
		WHEN [Team Division] =  'Friend and Family' THEN 'FNF'
		WHEN [Team Division] =  'Family and Friends' THEN 'FNF'
		WHEN [Team Division] =  'Friends and Family' THEN 'FNF'
		WHEN [Team Division] = 'Corporate' THEN 'CORP'
		WHEN [Team Division] = 'Organization' THEN 'CORP'
		WHEN [Team Division] = 'Corporation' THEN 'CORP'
		WHEN [Team Division] = 'Small Business' THEN 'CORP'
		ELSE 'OTHER' END AS  Team_Division_RECODED
     ,[Participant Accept Email]
      ,[Is Team Captain]
      ,[Is Secondary Registration]
      ,CASE WHEN  [Is Prior Participant] ='Yes' THEN 1 ELSE 0 END AS PRIOR_PARTICIPANT_RECODED
      ,[Emails Sent]
      ,[Number From Participant]
      ,[Number Not From Participant]    
      , CASE WHEN  [Participant Connection to MS] LIKE '%MS%' THEN 1 ELSE 0 END AS [Participant_Direct_Connection_to_MS] /* */
      ,CASE WHEN  [Registration Type] ='Online' THEN 1 ELSE 0 END AS IS_ONLINE_REGISTRATION
      ,CASE WHEN [Participant Gender] = 'Female' THEN 0 ELSE 1 END AS GENDER
	  ,CASE WHEN  [Registration Active Status] ='Inactive' THEN 0 ELSE 1 END AS REGISTRATION_ACTIVE_STATUS_RECODED 
      ,[Participant Goal($)]
      ,[Suggested Participant Goal($)]
      --,[Source Code Type]
      --,[Source Code Text]
      --,[Sub Source Code Text]
	  ,[Total of All Confirmed Gifts($)]
	  ,[Total From Participant($)]
      ,[Total Not From Participant($)] INTO [Participants_FOR_REGRESSION]
  FROM [TERADATA].[dbo].[Participants]


  /*
(65499 rows affected)
*/



 select   [Participation Type Name],count(*) as count_of_participants FROM [TERADATA].[dbo].[Participants]
  group by [Participation Type Name]

  /*

  Security Category Name	count_of_participants
AZA Bike Events	2146
CAS Bike Events	9925
FLN Bike Events	1980
ALC Bike Events	3655
FLC Bike Events	4926
CAL Bike Events	5760
COC Bike Events	15931
DED Bike Events	4251
ARR Bike Events	779
CAN Bike Events	10584
CTN Bike Events	3571
DCW Bike Events	1938
AKA Bike Events	53

*/







 select   [Team Division],count(*) as count_of_participants FROM [TERADATA].[dbo].[Participants]
  group by [Team Division]


  /*
  Team Division	count_of_participants
School	24
Religious	2
Corporate	22574
	12209
Organization (Clubs; Civic Groups; etc.)	235
Family and Friends	5127
Corporation	1722
Other	603
Place of Worship	2
Friends and Family	23001

*/

 select   [Participant Accept Email]
,count(*) as count_of_participants FROM [TERADATA].[dbo].[Participants]
  group by [Participant Accept Email]


  /*

  Participant Accept Email	count_of_participants
0	21551
1	43948
*/



[Registration Active Status]


 select   [Registration Active Status]
,count(*) as count_of_participants FROM [TERADATA].[dbo].[Participants]
  group by [Registration Active Status]

  /*

  Registration Active Status	count_of_participants
Inactive	2994
Active	62505

*/



 select   [Is Secondary Registration]
,count(*) as count_of_participants FROM [TERADATA].[dbo].[Participants]
  group by [Is Secondary Registration]


   SELECT   DATEDIFF(DAY,[Registration Date], [Event Date]) FROM [TERADATA].[dbo].[Participants]

    SELECT   [Participant Gender],COUNT(*) FROM [TERADATA].[dbo].[Participants]
	group by [Participant Gender]

	SELECT CASE WHEN  [Registration Active Status] ='Inactive' THEN 0 ELSE 1 END AS REGISTRATION_ACTIVE_STATUS_RECODED FROM [TERADATA].[dbo].[Participants]

SELECT DISTINCT [Participant Accept Email]	FROM [TERADATA].[dbo].[Participants]

SELECT CASE WHEN  [Registration Type] ='Online' THEN 1 ELSE 0 END AS IS_ONLINE_REGISTRATION	FROM [TERADATA].[dbo].[Participants]


SELECT CASE WHEN  [Is Prior Participant] ='Yes' THEN 1 ELSE 0 END AS PRIOR_PARTICIPANT_RECODED	FROM [TERADATA].[dbo].[Participants]









