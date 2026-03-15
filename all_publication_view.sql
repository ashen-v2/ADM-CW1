--=====================================================================
-- CREATE A VIEW THAT CONTAINS ALL PUBLICATIONS
--=====================================================================

--creates a view of Publication Type (class) Publication act as a unifier for book and journal types since its the super class of both types  
CREATE OR REPLACE VIEW all_publications_view OF Publication
-- view needs a  unique identifier as its primary key we use WITH OBJECT IDENTIFIER to specify which attribute should be the identifier. title attribute in this case
WITH OBJECT IDENTIFIER (title) AS
-- we join publication table and book table on its shared primary key to create book types
-- then we join publication table and journal table on its sahred primary key to create journal types
-- then we use UNION ALL to combine both book and journal types into one view of publication type since they are both subtypes of publication
-- like java abstract class or interface now we can call type body functions
SELECT BOOK(title, publication_date,'Book', author, isbn)
FROM PUBLICATION_TAB
JOIN BOOK_TAB ON PUBLICATION_TAB.PUBLICATION_ID = BOOK_TAB.PUBLICATION_ID
UNION ALL
SELECT JOURNAL(title, publication_date,'Journal', volume, isbn)
FROM PUBLICATION_TAB
JOIN JOURNAL_TAB ON PUBLICATION_TAB.PUBLICATION_ID = JOURNAL_TAB.PUBLICATION_ID;