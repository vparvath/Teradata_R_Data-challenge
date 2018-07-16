
/* THIS FILE IS FOR DATA PREPARATION FOR ANALYSIS OF TEAMS - WE ARE USING BELOW VARIABLES FROM PARTICIPANTS TABLE 
TO DETERMINE TEAM COMPOSITION AND IT'S IMPACT ON AMOUNT RAISED BY THE TEAMS:

Is Secondary Registration - PERCENTAGE OF TEAM MEMBERS WHO REGISTERED THEMSELVES
Is Prior Participant  - PERCENTAGE OF TEAM MEMBERS WHO WERE PRIOR PARTICIPANT
Participant Connection to MS - PERCENTAGE OF TEAM MEMBERS WHICH HAD DIRECT CONNECTION TO MS (  SOMEBODY THEY KNOW HAD MS)
Participant Gender - PERCENTAGE OF MALES IN THE TEAM



*/

USE TERADATA;



SELECT   [Participant Connection to MS], count(*) AS COUNT_OF_PARTICIPANTS from  [dbo].[Participants]
group by [Participant Connection to MS] 

/*
Participant Connection to MS	COUNT_OF_PARTICIPANTS
Sibling has MS	1923
Relative: Parent of person with MS	4
Possible MS	26
Caregiver of Person with MS	40
None	4769
Child has MS	1038
Parent has MS	2174
	13233
Spouse has MS	1974
Relative: Sibling of person with MS	2
I have MS	2625
I have a Friend of Co-worker with MS	6
Care Manager of Person with MS	19
I have a Friend or Co-worker with MS	74
Relative: other	4
Other	2851
Friend has MS	26777
Relative has MS	6387
Blank	1573
*/



SELECT  distinct [Participant Connection to MS] from  [dbo].[Participants]

where 
[Participant Connection to MS] like '%MS%'
/*

Participant Connection to MS
Sibling has MS
Relative: Parent of person with MS
Possible MS
Caregiver of Person with MS
Child has MS
Parent has MS
Spouse has MS
Relative: Sibling of person with MS
I have MS
I have a Friend of Co-worker with MS
Care Manager of Person with MS
I have a Friend or Co-worker with MS
Friend has MS
Relative has MS



*/
SELECT  distinct [Participant Connection to MS] from  [dbo].[Participants]

where 
[Participant Connection to MS] not like '%MS%'

/*

Participant Connection to MS
None

Relative: other (ONLY RECORDS)
Other
Blank

*/


SELECT distinct [Is Prior Participant] from  [dbo].[Participants]

/*

Is Prior Participant
N/A
Yes
*/

SELECT distinct   [Is Secondary Registration] from  [dbo].[Participants]
/*
Is Secondary Registration
0 : FALSE
1 : TRUE
*/

SELECT distinct   [Participant Gender] from  [dbo].[Participants]

/*

Participant Gender
      : Blank we can asumme these are males
Male
Female

*/

SELECT 
 COUNT(*),[Event Type] FROM Teams

 GROUP BY [Event Type]

 /*

 (No column name)	Event Type
33105	Bike
26	MS Great 8 Cycling Event

-- WE WILL NOT USE THIS IN LINEAR REGRESSION AS COUNT OF ONE CATEGPRY IS VERY SMALL/

 */

 SELECT COUNT(*), Team_ID,Event_ID FROM TEAMS
GROUP BY Team_ID,Event_ID

HAVING COUNT(*) >1 

/* WE SHOULD NOT HAVE THESE 120 DUPLICATES */

/*LETS KEEP ONE OF THESE DUPLICATES */

SELECT ROW_NUMBER() OVER (PARTITION BY Team_ID,Event_ID  ORDER BY Team_ID,Event_ID)AS RN
FROM Teams
WHERE
Team_ID	=
491501 AND Event_ID =	27900

WITH CTE_TEAM AS (
SELECT ROW_NUMBER() OVER (PARTITION BY Team_ID,Event_ID  ORDER BY Team_ID,Event_ID)AS RN, Team_ID,Event_ID,
Team_Total_Confirmed
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
, [Number of Participants]
, Team_Total_Confirmed /[Number of Participants] AS AMOUNT_PER_PARTICIPANT
,DATEDIFF(DAY,[Team Creation Date],[Event Date]) AS DAYS_FROM_TEAM_CREATION
FROM Teams WHERE [Number of Participants]  <>
0 AND  Team_Total_Confirmed  <>
0

)

SELECT  

CAST ( AVG(CASE WHEN   P.[Is Prior Participant]  ='Yes' THEN 1.000 ELSE 0.0000 END ) AS NUMERIC(10,4)) AS PCT_PRIOR_PARTICIPANTS
, CAST ( AVG(CASE WHEN P.[Participant Gender]  = 'Female' THEN 0.0000 ELSE 1.0000 END ) AS NUMERIC(10,4)) AS PCT_MALES
,CAST (  AVG(CASE WHEN P.[Is Secondary Registration] = 1 then 1.0000 else 0.0000 end ) AS NUMERIC(10,4)) AS PCT_SECONDARY_REGISTRATIONS
,CAST ( AVG( CASE WHEN P.[Participant Connection to MS] not like '%MS%' THEN 1.0000 ELSE 0.0000 END)AS NUMERIC(10,4)) AS PCT_DIRECT_CONNECTION_TO_MS
--,T.AMOUNT_PER_PARTICIPANT
--,T.DAYS_FROM_TEAM_CREATION
,T.Event_ID
--,T.[Number of Participants]
--,T.Team_Division_RECODED
,T.Team_ID
--,T.Team_Total_Confirmed 

FROM  [dbo].[Participants] P INNER JOIN
CTE_TEAM  T
ON p.[Event ID] = t.Event_ID 
and p.Team_ID = t.Team_ID 
WHERE T.RN = 1
GROUP BY T.Event_ID,T.Team_ID



SELECT 
ta.PCT_PRIOR_PARTICIPANTS
,ta.PCT_MALES
,ta.PCT_SECONDARY_REGISTRATIONS
,ta.PCT_DIRECT_CONNECTION_TO_MS
,t.Team_Total_Confirmed
,CASE 
WHEN t.[Team Division] = 'Family/Friends' THEN 'FNF'
WHEN [Team Division] =  'Frien`s and Family' THEN 'FNF'
WHEN [Team Division] =  'Friend and Family' THEN 'FNF'
WHEN [Team Division] =  'Family and Friends' THEN 'FNF'
WHEN [Team Division] =  'Friends and Family' THEN 'FNF'
WHEN [Team Division] = 'Corporate' THEN 'CORP'
WHEN [Team Division] = 'Organization' THEN 'CORP'
WHEN [Team Division] = 'Corporation' THEN 'CORP'
WHEN [Team Division] = 'Small Business' THEN 'CORP'
ELSE 'OTHER' END AS  Team_Division_RECODED 
, [Number of Participants]
, Team_Total_Confirmed /[Number of Participants] AS AMOUNT_PER_PARTICIPANT
,DATEDIFF(DAY,[Team Creation Date],[Event Date]) AS DAYS_FROM_TEAM_CREATION


 from
[dbo].[Teams] t  
INNER JOIN [dbo].[TEMAS_AGGREGATED] ta
ON 
T.Event_ID  =  TA.Event_ID
AND T.Team_ID = TA.Team_ID


select *  from [dbo].[TEMAS_AGGREGATED_NEW]


/* 
(5054 rows affected)
 */








SELECT * FROM Teams
WHERE
Team_ID	=
491501 AND Event_ID =	27900



SELECT 

AVG(CASE WHEN   P.[Is Prior Participant]  ='Yes' THEN 1 ELSE 0 END ) AS PCT_PRIOR_PARTICIPANTS
, AVG(CASE WHEN P.[Participant Gender]  = 'Female' THEN 0 ELSE 1 END ) AS PCT_MALES
, AVG(CASE WHEN P.[Is Secondary Registration] = 1 then 1 else 0 end ) AS PCT_SECONDARY_REGISTRATIONS
,AVG( CASE WHEN P.[Participant Connection to MS] not like '%MS%' THEN 1 ELSE 0 END) AS PCT_DIRECT_CONNECTION_TO_MS
,T.Team_Total_Confirmed
,CASE 
WHEN T.[Team Division] = 'Family/Friends' THEN 'FNF'
WHEN T.[Team Division] =  'Frien`s and Family' THEN 'FNF'
WHEN T.[Team Division] =  'Friend and Family' THEN 'FNF'
WHEN T.[Team Division] =  'Family and Friends' THEN 'FNF'
WHEN T.[Team Division] =  'Friends and Family' THEN 'FNF'
WHEN T.[Team Division] = 'Corporate' THEN 'CORP'
WHEN T.[Team Division] = 'Organization' THEN 'CORP'
WHEN T.[Team Division] = 'Corporation' THEN 'CORP'
WHEN T.[Team Division] = 'Small Business' THEN 'CORP'
ELSE 'OTHER' END AS  Team_Division_RECODED 
, T.[Number of Participants]
, T.Team_Total_Confirmed /T.[Number of Participants] AS AMOUNT_PER_PARTICIPANT
,DATEDIFF(DAY,t.[Team Creation Date],T.[Event Date]) AS DAYS_FROM_TEAM_CREATION
FROM  [dbo].[Participants] P INNER JOIN
[dbo].[Teams] T
ON p.[Event ID] = t.Event_ID 
and p.Team_ID = t.Team_ID
WHERE [Number of Participants]  <>
0 AND  Team_Total_Confirmed  <>
0

group by T.Team_ID,T.Event_ID




SELECT  [Number of Participants], Team_Total_Confirmed FROM [dbo].[Teams]

WHERE [Number of Participants]  =
0


SELECT  [Number of Participants], Team_Total_Confirmed FROM [dbo].[Teams]

WHERE  Team_Total_Confirmed  =
0

SELECT  * FROM [dbo].[Teams]
WHERE [Event Date] IS NULL

/* 0 ROWS */

SELECT  * FROM [dbo].[Teams]
WHERE [Team Creation Date] IS NULL

/* 0 ROWS */

SELECT   FROM [dbo].[Teams]

SELECT DATEDIFF(DAY, '1/1/2011', '3/1/2011')