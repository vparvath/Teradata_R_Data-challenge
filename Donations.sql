
/* All donation csv files received from teradata were loaded in Database for all the years 2013 - 2017 */ 

/* Let us create donations table by combinitng donations over all years */

/* COPY TABLE STRUCTURE WITH DATA SKIPPING INDEXES AND OTHER SCHEMA OBJECTS */
using teradata

SELECT * INTO  DONATIONS  FROM [dbo].[2017 Bike Donations] 

/*  (627498 row(s) affected)  */

INSERT INTO DONATIONS
SELECT * FROM [dbo].[2016 Bike Donations]

/* (690200 row(s) affected) */


INSERT INTO DONATIONS
SELECT * FROM [dbo].[2015 Bike Donations]

/* Msg 213, Level 16, State 1, Line 15
Column name or number of supplied values does not match table definition.

This is because we skipped import of last 3 columns for 2015 as they contained irrelevant text
*/
INSERT INTO DONATIONS( [Security Category Name]
      ,[Event ID]
      ,[Public Event Name]
      ,[Fiscal Year]
      ,[Event Date]
      ,[Campaign Title]
      ,[Campaign ID]
      ,[Gift Amount($)]
      ,[Date Recorded]
      ,[Gift Type]
      ,[Gift Payment Method]
      ,[Offline Status]
      ,[Soft Credit Type]
      ,[Is Registration?]
      ,[Donor ConsID]
      ,[Donor Member ID]
      ,[Donor Affiliate Code]
      ,[Donor Gender]
      ,[Donor Accept Email]
      ,[Donor Opt-out Date]
      ,[Donor Opt-out Method]
      ,[Donor Email Status]
      ,[Donor City]
      ,[Donor State]
      ,[Donor County]
      ,[Donor ZIP]
      ,[Donor Employer]
      ,[Donor Connection to MS]
      ,[Participant Contact ID]
      ,[Participant Member ID]
      ,[Participation Type Name]
      ,[Registration Active Status]
      ,[Registration Date]
      ,[Participant Goal($)]
      ,[Is Prior Participant]
      ,[Is Team Captain]
      ,[Additional Gift Amount($)]
      ,[Team Name]
      ,[Team]
      ,[Team Creation Date]
      ,[Original Value Transacted]
      ,[Net Transaction Amount]
      ,[Ledger Transaction Amount]
      ,[Proxy Type]
      ,[User Confirmation Code]
      ,[Source Code Type])
SELECT * FROM [dbo].[2015 Bike Donations]

/* (777729 row(s) affected)
 */

 INSERT INTO DONATIONS
SELECT * FROM [dbo].[2014 Bike Donations]

/*  (831124 row(s) affected) */

INSERT INTO DONATIONS( [Security Category Name]
      ,[Event ID]
      ,[Public Event Name]
      ,[Fiscal Year]
      ,[Event Date]
      ,[Campaign Title]
      ,[Campaign ID]
      ,[Gift Amount($)]
      ,[Date Recorded]
      ,[Gift Type]
      ,[Gift Payment Method]
      ,[Offline Status]
      ,[Soft Credit Type]
      ,[Is Registration?]
      ,[Donor ConsID]
      ,[Donor Member ID]
      ,[Donor Affiliate Code]
      ,[Donor Gender]
      ,[Donor Accept Email]
      ,[Donor Opt-out Date]
      ,[Donor Opt-out Method]
      ,[Donor Email Status]
      ,[Donor City]
      ,[Donor State]
      ,[Donor County]
      ,[Donor ZIP]
      ,[Donor Employer]
      ,[Donor Connection to MS]
      ,[Participant Contact ID]
      ,[Participant Member ID]
      ,[Participation Type Name]
      ,[Registration Active Status]
      ,[Registration Date]
      ,[Participant Goal($)]
      ,[Is Prior Participant]
      ,[Is Team Captain]
      ,[Additional Gift Amount($)]
      ,[Team Name]
      ,[Team]
      ,[Team Creation Date]
      ,[Original Value Transacted]
      ,[Net Transaction Amount]
      ,[Ledger Transaction Amount]
      ,[Proxy Type]
      ,[User Confirmation Code]
      ,[Source Code Type])
SELECT * FROM [dbo].[2013 Bike Donations]

/* (880823 row(s) affected)   */
SELECT
      COUNT(*) FROM  DONATIONS

	  WHERE ISNUMERIC ([Participant Member ID])=0

	  /* 47086 ROWS */


SELECT
      DISTINCT [Participant Member ID] FROM  DONATIONS

	  WHERE ISNUMERIC ([Participant Member ID])=0

	  /*

	  Participant Member ID

42367866(Participant Reg. - Other Accommodation
56928695_removed
62540741(Event Participant
84360521(Cyclist
89558015(Cyclist
90652478_removed
Cyclist
Cyclist - June 1, 2015 to day of ride
Cyclist w/ Sunday PM Bus
Event Participant
Event Participant - Cyclist
Marineland Start
One-Day Cyclist
Participant - No Bus
Two-Day Participant
*/


/* Set all the non numeric [Participant Member ID]  to -1 - we do not want to lose their information for future analysis */

UPDATE DONATIONS
SET [Participant Member ID] = -1

WHERE ISNUMERIC ([Participant Member ID])=0

/* (47086 row(s) affected) */

ALTER TABLE DONATIONS ALTER COLUMN [Participant Member ID] NUMERIC(10,0) /* Command(s) completed successfully.
 */

EXEC sp_rename 'DONATIONS.[Participant Member ID]','Participant_Member_ID', 'COLUMN'

CREATE INDEX IDX_DONATIONS_Participant_Member_ID ON DONATIONS(Participant_Member_ID)
--Command(s) completed successfully.

select count(*) from DONATIONS
where isnumeric( [Event ID]) =0 
/* 2 records */

/* Set all the non numeric[Event ID]  to -1 - we do not want to lose their information for future analysis */

UPDATE DONATIONS
SET [Event ID] = -1

WHERE ISNUMERIC ([Event ID])=0

/* (2 row(s) affected) */

ALTER TABLE DONATIONS ALTER COLUMN [Event ID] NUMERIC(10,0) /* Command(s) completed successfully.
 */

EXEC sp_rename 'DONATIONS.[Event ID]','Event_ID', 'COLUMN'

CREATE INDEX IDX_DONATIONS_Event_ID ON DONATIONS(Event_ID)
/* Command(s) completed successfully. */

select count(*) from DONATIONS
where isnumeric( [Participant Contact ID]) =0 

/* 33047 */


select distinct ([Participant Contact ID]) from  DONATIONS

WHERE ISNUMERIC ([Participant Contact ID])=0

/* we just have blank field here for 33047 records*/

/* Set all the non numeric[Participant Contact ID]  to -1 - we do not want to lose their information for future analysis */

UPDATE DONATIONS
SET [Participant Contact ID] = -1

WHERE ISNUMERIC ([Participant Contact ID])=0

/*(33047 row(s) affected) */ 


ALTER TABLE DONATIONS ALTER COLUMN [Participant Contact ID] NUMERIC(10,0) /* Command(s) completed successfully.
 */

EXEC sp_rename 'DONATIONS.[Participant Contact ID]','Participant_Contact_ID', 'COLUMN'

CREATE INDEX IDX_DONATIONS_Participant_Contact_ID ON DONATIONS(Participant_Contact_ID)
/* Command(s) completed successfully. */



select count(*) from DONATIONS
where isnumeric([Donor Member ID]) =0 
/* 4948 */

select distinct [Donor Member ID] from DONATIONS
where isnumeric([Donor Member ID]) =0 

/*

Donor Member ID

56694874_removed
56928695_removed
58340249_removed
59460287_removed
60237990_removed
75524768_removed
90362893_removed
91033605(MNM
ALC
CAS
KSG
MIG
MNM
OHA
TXH
VAR
WIG */

UPDATE DONATIONS
SET [Donor Member ID]= -1
WHERE ISNUMERIC ([Donor Member ID])=0
/* (4948 row(s) affected) */


ALTER TABLE DONATIONS ALTER COLUMN [Donor Member ID] NUMERIC(10,0) /* Command(s) completed successfully.
 */

EXEC sp_rename 'DONATIONS.[Donor Member ID]','Donor_Member_ID', 'COLUMN'

CREATE INDEX IDX_DONATIONS_Donor_Member_ID ON DONATIONS(Participant_Contact_ID)
/* Command(s) completed successfully. */
