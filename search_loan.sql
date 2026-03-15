
-- This query retrieves the full information of books whose title or author contains 'No' and are of publication type 'Book'. 
-- use  Book's displayFullInfo() method to get the full information of the book.
SELECT VALUE(p).displayFullInfo() AS bookfullinfo
FROM ALL_PUBLICATIONS_VIEW p 
WHERE p.title LIKE '%No%' 
OR 
TREAT(VALUE(p) AS Book).author LIKE '%No%'
AND
p.publication_type = 'Book';

-- This query retrieves the full information of journals whose title contains 'Sci' and are of publication type 'Journal'.
-- use Journal's displayFullInfo() method to get the full information of the journal.
SELECT VALUE(p).displayFullInfo() AS Journalfullinfo
FROM ALL_PUBLICATIONS_VIEW p 
WHERE p.title LIKE '%Sci%'
AND
p.publication_type = 'Journal';

SELECT VALUE(p).displayFullInfo() AS borrowedpublicationfullinfo
FROM ALL_PUBLICATIONS_VIEW p
WHERE p.title IN 
(SELECT title from publication_tab WHERE publication_id IN (SELECT publication_id FROM LOAN_TAB));