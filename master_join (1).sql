
select distinct 
D.[Security Category Name] as 'Donations_SecurityCategoryName'
,D.[Fiscal Year] as 'Donations_FiscalYear'
,D.[Event Date] as 'Donations_EventDate'
,D.[Participation Type Name] as 'Donations_ParticipationTypeName'
,D.[Registration Active Status] as 'Donations_RegistrationActiveStatus'
,D.[Registration Date] as 'Donations_RegistrationDate'
,D.[Participant Goal($)] as 'Donations_ParticipantGoal($)'
,D.[Is Prior Participant] as 'Donations_'
,D.[Is Team Captain] as 'Donations_IsTeamCaptain'
,D.[Team Creation Date] as 'Donations_TeamCreationDate'
,D.[Source Code Type] as 'Donations_SourceCodeType'
,D.[Source Code Text] as 'Donations_SourceCodeText' 
,D.[Sub Source Code Text] as 'Donations_SubSourceCodeText'
      ,P.[Event ID] as 'participant_Event_ID'
      ,[Public Event Name]
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
      ,[Donor_Member_ID]
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
      ,[Participant_Contact_ID]
      ,[Participant_Member_ID]
      ,[Additional Gift Amount($)]
      ,P.[Team_Name] as 'participant_Team_Name'
      ,[Team]
	        ,[Original Value Transacted]
      ,[Net Transaction Amount]
      ,[Ledger Transaction Amount]
      ,[Proxy Type]
      ,[User Confirmation Code]
	        ,[Batch ID] as 'participantBatchID'
	  ,p.[Security Category Name] as 'participant_SecurityCategoryName'
      ,p.[Fiscal Year] as 'participant_FiscalYear'
      ,P.[Internal Event Name] as 'participant_InternalEventName'
      ,p.[Event Date] as 'participant_EventDate'
      ,p.[Participation Type Name]  as 'participants_Type_Name'
      ,[Team_Name]
      ,p.[Team Creation Date] as 'participants_TeamCreationDate'
      ,p.[Team Division] as 'participants_TeamDivision'
      ,P.[Team_ID] as 'participants_Team_ID'
      ,[Contact_ID]
      ,[Member_ID]
      ,[Participant Accept Email]
      ,p.[Registration Date] as 'participant_RegistrationDate'
      ,p.[Registration Active Status] as 'participant_RegistrationActiveStatus'
      ,p.[Is Team Captain] as 'participant_IsTeamCaptain'
      ,[Is Secondary Registration] 
      ,P.[Is Prior Participant] as 'particpiant_IsPriorParticipant'
      ,[Emails Sent]
      ,[Total of All Confirmed Gifts($)]
      ,[Total From Participant($)]
      ,[Total Not From Participant($)]
      ,[Number From Participant]
      ,[Number Not From Participant]
      ,[Participant Email Status]
      ,[Participant Employer]
      ,[Participant Occupation]
      ,[Participant Connection to MS]
      ,[Address  -  Participant State Province]
      ,[Address  -  Participant County]
      ,[Address  -  Participant City]
      ,[Address -  Participant ZIP Postal Code]
      ,[Registration Type]
      ,[Event ID]
      ,[Participant Gender]
      ,P.[Participant Goal($)] as 'participant_Participant_Goal'
      ,[Suggested Participant Goal($)]
      ,P.[Source Code Type] as 'participant_Source_Code_Type'
      ,P.[Source Code Text] as 'participant_Source_Code_Text'
      ,P.[Sub Source Code Text] as 'participant_SubSourceCodeText'
,	T.	 [Event Type]	 AS 'Teams_EventType'
,	T.	[Internal Event Name]	 AS 'Teams_InternalEventName'
,	T.	[Event_ID]	 AS 'Teams_Event_ID'
,	T.	[Team_ID]	 AS 'Teams_Team_ID'
,	T.	[Team Name]	 AS 'Teams_TeamName'
,	T.	[Team Creation Date]	 AS 'Teams_TeamCreationDate'
,	T.	[Team Captain Contact ID]	 AS 'Teams_TeamCaptainContactID'
,	T.	[Captain Email Domain]	 AS 'Teams_CaptainEmailDomain'
,	T.	[Team Captain Accept Email]	 AS 'Teams_TeamCaptainAcceptEmail'
,	T.	[Team Division]	 AS 'Teams_TeamDivision'
,	T.	[Company]	 AS 'Teams_Company'
,	T.	[Number of Participants]	 AS 'Teams_NumberofParticipants'
,	T.	[Total Fees Paid]	 AS 'Teams_TotalFeesPaid'
,	T.	[Team_Total_Confirmed]	 AS 'Teams_Team_Total_Confirmed'
,	T.	[Total Online Gifts($)]	 AS 'Teams_TotalOnlineGifts($)'
,	T.	[Total Offline Confirmed Gifts($)]	 AS 'Teams_TotalOfflineConfirmedGifts($)'
,	T.	[Total Offline Unconfirmed Gifts($)]	 AS 'Teams_TotalOfflineUnconfirmedGifts($)'
,	T.	[Team Goal($)]	 AS 'Teams_TeamGoal($)'
,	T.	[Total Confirmed Gifts in Team History($)]	 AS 'Teams_TotalConfirmedGiftsinTeamHistory($)'
,	T.	[Previous Event Fiscal Year]	 AS 'Teams_PreviousEventFiscalYear'
,	T.	[Previous Event Internal Name]	 AS 'Teams_PreviousEventInternalName'
,	T.	[Previous Event Team Name]	 AS 'Teams_PreviousEventTeamName'
,	T.	[Previous Event Confirmed Gifts($)]	 AS 'Teams_PreviousEventConfirmedGifts($)'
,	T.	[Previous Event Team Members]	 AS 'Teams_PreviousEventTeamMembers'
,	T.	[Event Date]	 AS 'Teams_EventDate'
,	T.	[Fiscal Year]	 AS 'Teams_FiscalYear'
,E.[Fiscal_Year]	 AS 'EVENTS_Fiscal_Year'
,E.[Event_ID]	 AS 'EVENTS_Event_ID'
,E.[Security_Category_Name]	 AS 'EVENTS_Security_Category_Name'
,E.[Public_Event_Name]	 AS 'EVENTS_Public_Event_Name'
,E.[Event_Created_Date]	 AS 'EVENTS_Event_Created_Date'
,E.[Event_Date]	 AS 'EVENTS_Event_Date'
,E.[Event_Goal($)]	 AS 'EVENTS_Event_Goal($)'
,E.[Active_Registrations]	 AS 'EVENTS_Active_Registrations'
,E.[Inactive_Registrations]	 AS 'EVENTS_Inactive_Registrations'
,E.[Total_Fees_Paid]	 AS 'EVENTS_Total_Fees_Paid'
,E.[Total_of_All_Confirmed_Gifts($)]	 AS 'EVENTS_Total_of_All_Confirmed_Gifts($)'
,E.[Total_Online_Gifts($)]	 AS 'EVENTS_Total_Online_Gifts($)'
,E.[Teams]	 AS 'EVENTS_Teams'
,E.[Captains]	 AS 'EVENTS_Captains'
,E.[Average_Team_Size]	 AS 'EVENTS_Average_Team_Size'
,E.[Team_pages_with_custom_URL]	 AS 'EVENTS_Team_pages_with_custom_URL'
,E.[Emails_Sent]	 AS 'EVENTS_Emails_Sent'
,E.[Personal_pages_with_custom_URL]	 AS 'EVENTS_Personal_pages_with_custom_URL'
,E.[Total_Offline_Confirmed_Gifts($)]	 AS 'EVENTS_Total_Offline_Confirmed_Gifts($)'
,E.[Self_Donors]	 AS 'EVENTS_Self_Donors'
,E.[Total_From_Participant($)]	 AS 'EVENTS_Total_From_Participant($)'
,E.[Non-self_Donors]	 AS 'EVENTS_Non-self_Donors'
,E.[Total_Not_From_Participant($)]	 AS 'EVENTS_Total_Not_From_Participant($)'
,E.[Total_Team_Gifts($)]	 AS 'EVENTS_Total_Team_Gifts($)'
,E.[Total_Event_Gifts($)]	 AS 'EVENTS_Total_Event_Gifts($)'
,E.[Total_Offline_Unconfirmed_Gifts($)]	 AS 'EVENTS_Total_Offline_Unconfirmed_Gifts($)'
,E.[Street_Address]	 AS 'EVENTS_Street_Address'
,E.[City]	 AS 'EVENTS_City'
,E.[State]	 AS 'EVENTS_State'
,E.[Zip_Code]	 AS 'EVENTS_Zip_Code'
,E.[Internal_Event_Name]	 AS 'EVENTS_Internal_Event_Name'
,E.[Previous_Event_ID]	 AS 'EVENTS_Previous_Event_ID'


	  into DONATIONS_PARTICIPANTS_TEAMS_EVENTS
from TERADATA.[dbo].[DONATIONS] D
Inner join
[dbo].[Participants] P
on isnumeric (P.[Member_ID]) >0 and  P.[Member_ID] = D.[Participant_Member_ID] 
and P.[Event ID] = d.event_id 

inner join Teams T
on
 p.Team_ID =  T.Team_ID

 inner join [Events] e

 on D.Event_ID = E.Event_ID




