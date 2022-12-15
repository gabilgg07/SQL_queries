
-- update columns values with column of another table based on condition [duplicate]

UPDATE [Ogani].[dbo].[Blogs] 
    SET [Ogani].[dbo].[Blogs].[Body] = [testing].[dbo].[BlogPosts].[Body] 
    FROM [Ogani].[dbo].[Blogs]  INNER JOIN  [testing].[dbo].[BlogPosts] ON [Ogani].[dbo].[Blogs].id = [testing].[dbo].[BlogPosts].id

UPDATE [Ogani].[dbo].[Blogs] 
    SET [Ogani].[dbo].[Blogs].[PublishedDate] = [testing].[dbo].[BlogPosts].[PublishedDate] 
    FROM [Ogani].[dbo].[Blogs]  INNER JOIN  [testing].[dbo].[BlogPosts] ON [Ogani].[dbo].[Blogs].id = [testing].[dbo].[BlogPosts].id

UPDATE table1 
   SET table1.Price = table2.price 
   FROM table1  INNER JOIN  table2 ON table1.id = table2.id

UPDATE table1 
    SET price=(SELECT price FROM table2 WHERE table1.id=table2.id);