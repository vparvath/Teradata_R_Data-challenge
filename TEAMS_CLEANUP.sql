
USE TERADATA;
SELECT COUNT(*) FROM Teams 

/*33132 */
SELECT COUNT(*) FROM Teams 
GROUP BY Team_ID
/* 33007   WE SEEM TO HAVE DUPLICATES BUT THEY ARE SMALL IN NUMBER*/

/* aS PER THE FIELD DEFINITION DOCUMENT, WE HAD MORE (CHAOTIC) CATEGORIES IN THE PAST AND WE MUST RECODE THS DATA */
SELECT DISTINCT  [Team Division] FROM Teams
/* 
Team Division
School
Religious
Family/Friends  FNF
Volunteer Group 
Association 
Corporate CORP
Organization CORP
Frien`s and Family FNF
Civic Team OTHER
Club/Organization OTHER

Organization (Clubs; Civic Groups; etc.) 
Open Team OTHER
Ohana 
Ohana and Friends
Beer/Brewery 
Organization (Clubs; Civic Groups; Place of Worship; etc.) 
Friend and Family FNF
Family and Friends FNF
Bike Shops 
Corporation CORP
Small Business CORP
Other
Organization (Clubs, Civic Groups, etc.) 
Place of Worship
Friends and Family FNF
Bike Club 
Bike Shop
Open

*/


SELECT  [Team Division] ,
CASE 
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
FROM TEAMS

CREATE VIEW TEAMS_RECODED AS SELECT 
CASE 
WHEN [Team Division] = 'Family/Friends' THEN 'FNF'
WHEN [Team Division] =  'Frien`s and Family' THEN 'FNF'
WHEN [Team Division] =  'Friend and Family' THEN 'FNF'
WHEN [Team Division] =  'Family and Friends' THEN 'FNF'
WHEN [Team Division] =  'Friends and Family' THEN 'FNF'
WHEN [Team Division] = 'Corporate' THEN 'CORP'
WHEN [Team Division] = 'Organization' THEN 'CORP'
WHEN [Team Division] = 'Corporation' THEN 'CORP'
WHEN [Team Division] = 'Small Business' THEN 'CORP'
ELSE 'OTHER' END AS  Team_Division_RECODED,*
FROM TEAMS



SELECT * FROM TEAMS
WHERE ISNUMERIC([Team Total Confirmed ($)])=0
/* 1 ROW */

DELETE FROM TEAMS
WHERE ISNUMERIC([Team Total Confirmed ($)])=0
/*(1 row(s) affected)
*/
ALTER TABLE TEAMS ALTER COLUMN [Team Total Confirmed ($)] NUMERIC (10,2) /*Command(s) completed successfully. */

SP_RENAME 'TEAMS.[Team Total Confirmed ($)]' ,'Team_Total_Confirmed','COLUMN'


SELECT Team_Division_RECODED, SUM([Team Total Confirmed ($)]) AS TOTAL_AMOUNT FROM TEAMS_RECODED
GROUP BY Team_Division_RECODED
/*
Team_Division_RECODED	TOTAL_AMOUNT
CORP					140190807.59
FNF						125180918.28
OTHER					32930292.37

*/

SELECT Team_Division_RECODED, AVG([Team Total Confirmed ($)]) AS AVERAGE_AMOUNT FROM TEAMS_RECODED
GROUP BY Team_Division_RECODED
/*

Team_Division_RECODED	AVERAGE_AMOUNT
CORP					18194.783593
FNF						5784.967802
OTHER					8695.614568
*/