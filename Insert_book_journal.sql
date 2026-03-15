-- DELETE FROM BOOK_TAB;
-- DELETE FROM JOURNAL_TAB;
-- DELETE FROM PUBLICATION_TAB;

INSERT INTO PUBLICATION_TAB 
(title, publication_date, publication_type) 
VALUES 
('No Longer Human', TO_DATE('1948-04-10', 'YYYY-MM-DD'), 'Book');

INSERT INTO BOOK_TAB 
(publication_id, author, isbn) 
VALUES 
((SELECT publication_id FROM PUBLICATION_TAB WHERE title = 'No Longer Human'), 'Osamu Dazai', '9780156027301');

INSERT INTO PUBLICATION_TAB 
(title, publication_date, publication_type)
VALUES
('The Science of Nature', TO_DATE('2026-02-15', 'YYYY-MM-DD'), 'Journal');

INSERT INTO JOURNAL_TAB
(publication_id, volume, isbn)
VALUES
((SELECT publication_id FROM PUBLICATION_TAB WHERE title = 'The Science of Nature'), 114, '9781234567890');