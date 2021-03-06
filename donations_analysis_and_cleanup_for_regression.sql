/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct  [Security Category Name]       
  FROM [TERADATA].[dbo].[DONATIONS] /* 162 catgories */

  SELECT distinct  [Public Event Name]       
  FROM [TERADATA].[dbo].[DONATIONS] /* 512 categories */

    SELECT distinct  [Gift Type]       
  FROM [TERADATA].[dbo].[DONATIONS] /* 8 categories need to be recoded into 4 */


    SELECT distinct      [Gift Payment Method]   
  FROM [TERADATA].[dbo].[DONATIONS] /* 6 categories - recoding necessary */

      SELECT distinct   [Soft Credit Type]      
  FROM [TERADATA].[dbo].[DONATIONS]  /* 8 categries recoding needed */

      SELECT distinct   [Is Registration?]      
  FROM [TERADATA].[dbo].[DONATIONS] /* bad data - numeric values */

  
      SELECT *      
  FROM [TERADATA].[dbo].[DONATIONS]
  where  [Is Registration?] not in ('BALSE','FALSE','TRUE') /* 10 rows to be removed */


    /* Backup */
      SELECT *      into [TERADATA].[dbo].[DONATIONS_DELETED_RECORDS]
  FROM [TERADATA].[dbo].[DONATIONS]
  where  [Is Registration?] not in ('BALSE','FALSE','TRUE') /*(10 rows affected) */

  DELETE FROM [TERADATA].[dbo].[DONATIONS] WHERE [Is Registration?] not in ('BALSE','FALSE','TRUE')
  /*(10 rows affected)*/

        SELECT distinct   [Is Registration?]      
  FROM [TERADATA].[dbo].[DONATIONS]


          SELECT distinct     [Donor Affiliate Code]    
  FROM [TERADATA].[dbo].[DONATIONS] /* 69 ROWS */

            SELECT distinct   [Donor Gender]      
  FROM [TERADATA].[dbo].[DONATIONS] /* 12 ROWS RECODING NECESSARY */

          SELECT distinct     [Donor Accept Email]    
  FROM [TERADATA].[dbo].[DONATIONS]