
/* CREATE A BACKUP TABLE BEFORE CLEANING DATA  IN CASE WE CHANGE OUR ASSUMPTIONS */

SELECT  * INTO  [dbo].[Participants_Cleaned] FROM [dbo].[Participants] -- COPIES ONLY THE DATA WITHOUT ASSOCIATED INDEXES AND OTHER OBJECTS

/* CHECK FOR ANY NON NUMERIC IDS IF WE CAN */

SELECT [Team_ID],[Team_Name],[Contact_ID],[Member_ID],* From  [dbo].[Participants]  
WHERE isnumeric ([Team_ID]) = 0 or isnumeric ([Contact_ID]) = 0 or ISNUMERIC([Member_ID])=0
/*
Member_ID
59673939_removed

Seems like we have some team_ids which are 0  we have few member IDs which are haveing text _removed at the end.

We can check if these numeric parts of member IDs have valid data or not

*/

SELECT * FROM Donations WHERE [Participant Member ID] LIKE
'%85130489%' -- 0 rows. 

SELECT * FROM Donations WHERE [Participant Member ID] LIKE
'%59673939%' -- 1 row. 


/* We can safely delete these records with _ removed member IDs  which do not have entry in  donations*/



/* Seems like we have some non numeric 'Participant Member ID' in donations file as well.

select [Participant Member ID] from 
all_donations where  [Participant Member ID] in 
(
select
replace([Member_ID],'_removed','')
--cast(replace([Member_ID],'_removed','') as numeric)  
from [Participants]

where ISNUMERIC([Member_ID])=0 and  [Member_ID] <> ''

)



