DELETE FROM LOAN_TAB;
DELETE FROM MEMBER_TAB;

INSERT INTO MEMBER_TAB VALUES(MEMBER(1,'ashen','45,random street, random city'));

INSERT INTO LOAN_TAB
(member_id,publication_id, loan_date, return_date)
 VALUES
 (1,1, TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-01-15','YYYY-MM-DD'));