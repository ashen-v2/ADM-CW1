DROP TABLE loan_tab;
DROP TABLE member_tab;
DROP TABLE book_tab;
DROP TABLE journal_tab;
DROP TABLE publication_tab;

CREATE TABLE IF NOT EXISTS publication_tab (
    publication_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- this tells oracle to auto generate unique id for each publication
    title VARCHAR2(255),
    Publication_date DATE,
    publication_type VARCHAR2(20) CHECK (publication_type IN ('Book', 'Journal')) -- only allows 'Book' or 'Journal' as publication types
);

CREATE TABLE IF NOT EXISTS member_tab OF Member( -- this tells create table using attributes of Member Type(Object)
    id PRIMARY KEY -- this tells treat auto created id column using Memeber Type as Primary Key of this table
 ); 

CREATE TABLE IF NOT EXISTS loan_tab(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id NUMBER,
    publication_id NUMBER,
    loan_date DATE,     
    return_date DATE,
    -- CONSTRAINT keyword gives a name to rule so its easy to debug and maintain
    CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES member_tab(id),
    CONSTRAINT fk_publication FOREIGN KEY (publication_id) REFERENCES publication_tab(publication_id)
);

CREATE TABLE IF NOT EXISTS book_tab(
    publication_id NUMBER PRIMARY KEY,
    author VARCHAR2(255),
    isbn VARCHAR2(13) UNIQUE NOT NULL,
    CONSTRAINT fk_publication_book FOREIGN KEY (publication_id) REFERENCES publication_tab(publication_id) -- shared primary key(Google the term if I forget)
);

CREATE TABLE IF NOT EXISTS journal_tab(
    publication_id NUMBER PRIMARY KEY,
    volume NUMBER,
    isbn VARCHAR2(13) UNIQUE NOT NULL,
    CONSTRAINT fk_publication_journal FOREIGN KEY (publication_id) REFERENCES publication_tab(publication_id) -- shared primary key
);

