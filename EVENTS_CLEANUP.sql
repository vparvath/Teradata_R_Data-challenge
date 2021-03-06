/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Fiscal_Year] --N
      ,[Event_ID] --N
      ,[Security_Category_Name] --N
      ,[Public_Event_Name]  --N
      ,[Event_Created_Date]  --E
      ,[Event_Date] --E
      ,[Event_Goal($)] --Y
      ,[Active_Registrations] --Y
      ,[Inactive_Registrations] --Y
      ,[Total_Fees_Paid] --Y
      ,[Total_of_All_Confirmed_Gifts($)] --D
      ,[Total_Online_Gifts($)] --D2
      ,[Teams]  --Y
      ,[Captains]--Y
      ,[Average_Team_Size] --Y
      ,[Team_pages_with_custom_URL] --Y
      ,[Emails_Sent] --Y
      ,[Personal_pages_with_custom_URL] --Y
      ,[Total_Offline_Confirmed_Gifts($)]  --D3
      ,[Self_Donors] -- Y
      ,[Total_From_Participant($)] --D4
      ,[Non-self_Donors] --Y
      ,[Total_Not_From_Participant($)] --D5
      ,[Total_Team_Gifts($)] --D6
      ,[Total_Event_Gifts($)] --D7
      ,[Total_Offline_Unconfirmed_Gifts($)] --D8
      ,[Street_Address] --N
      ,[City] --V
      ,[State] --V
      ,[Zip_Code] --V
      ,[Internal_Event_Name]--N
      ,[Previous_Event_ID] --N
  FROM [TERADATA].[dbo].[Events]


  SELECT DATEDIFF(DAY,[Event_Created_Date],[Event_Date]),*  FROM [TERADATA].[dbo].[Events]

  WHERE DATEDIFF(DAY,[Event_Created_Date],[Event_Date]) <0 ORDER BY 1 ASC

  SELECT * FROM [TERADATA].[dbo].[Events]  ORDER BY Captains DESC




  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
LOG(CASE WHEN[Total_of_All_Confirmed_Gifts($)] =0 THEN 1 ELSE [Total_of_All_Confirmed_Gifts($)] END) AS NATURAL_LOG_Total_of_All_Confirmed_Gifts,
LOG(CASE WHEN [Total_of_All_Confirmed_Gifts($)] =0 THEN 1 ELSE [Total_of_All_Confirmed_Gifts($)] END ,10) AS LOG10_Total_of_All_Confirmed_Gifts,
    CAST(CASE WHEN DATEDIFF(DAY,[Event_Created_Date],[Event_Date]) <0 THEN 0 ELSE  DATEDIFF(DAY,[Event_Created_Date],[Event_Date]) END AS INTEGER ) AS DAYS_FROM_EVENT_CREATION_DATE
      ,[Event_Goal($)] --Y
      ,[Active_Registrations] --Y
      ,[Inactive_Registrations] --Y
      ,[Total_Fees_Paid] --Y
      ,[Total_of_All_Confirmed_Gifts($)] --D
      ,[Total_Online_Gifts($)] --D2
      ,[Teams]  --Y
      ,[Captains]--Y
      ,[Average_Team_Size] --Y
      ,[Team_pages_with_custom_URL] --Y
      ,[Emails_Sent] --Y
      ,[Personal_pages_with_custom_URL] --Y
      ,[Total_Offline_Confirmed_Gifts($)]  --D3
      ,[Self_Donors] -- Y
      ,[Total_From_Participant($)] --D4
      ,[Non-self_Donors] --Y
      ,[Total_Not_From_Participant($)] --D5
      ,[Total_Team_Gifts($)] --D6
      ,[Total_Event_Gifts($)] --D7
      ,[Total_Offline_Unconfirmed_Gifts($)] --D8
      ,[Street_Address] --N
      ,[City] --V
      ,[State] --V
      ,[Zip_Code] --V
    INTO [dbo].[Events_FOR_REGRESSION]
  FROM [TERADATA].[dbo].[Events]
  /*
(700 rows affected)
 */

 SELECT 
LOG(CASE WHEN[Total_of_All_Confirmed_Gifts($)] =0 THEN 1 ELSE [Total_of_All_Confirmed_Gifts($)] END) AS NATURAL_LOG_Total_of_All_Confirmed_Gifts,
LOG(CASE WHEN [Total_of_All_Confirmed_Gifts($)] =0 THEN 1 ELSE [Total_of_All_Confirmed_Gifts($)] END ,10) AS LOG10_Total_of_All_Confirmed_Gifts,
    CAST(CASE WHEN DATEDIFF(DAY,[Event_Created_Date],[Event_Date]) <0 THEN 0 ELSE  DATEDIFF(DAY,[Event_Created_Date],[Event_Date]) END AS INTEGER ) AS DAYS_FROM_EVENT_CREATION_DATE
      ,[Event_Goal($)] --Y
      ,[Active_Registrations] --Y
      ,[Inactive_Registrations] --Y
      ,[Total_Fees_Paid] --Y
      ,[Total_of_All_Confirmed_Gifts($)] --D
      ,[Total_Online_Gifts($)] --D2
      ,[Teams]  --Y
      ,[Captains]--Y
      ,[Average_Team_Size] --Y
      ,[Team_pages_with_custom_URL] --Y
      ,[Emails_Sent] --Y
      ,[Personal_pages_with_custom_URL] --Y
      ,[Total_Offline_Confirmed_Gifts($)]  --D3
      ,[Self_Donors] -- Y
      ,[Total_From_Participant($)] --D4
      ,[Non-self_Donors] --Y
      ,[Total_Not_From_Participant($)] --D5
      ,[Total_Team_Gifts($)] --D6
      ,[Total_Event_Gifts($)] --D7
      ,[Total_Offline_Unconfirmed_Gifts($)] --D8
      ,[Street_Address] --N
      ,[City] --V
      ,[State] --V
      ,[Zip_Code] --V
    
  FROM [TERADATA].[dbo].[Events] WHERE [Total_of_All_Confirmed_Gifts($)] <>0