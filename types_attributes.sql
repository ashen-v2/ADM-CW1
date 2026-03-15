
                                                                         -- JAVA EQUIVENT
CREATE OR REPLACE TYPE Publication AS OBJECT(                            -- public abstract class Publication {
    title VARCHAR2(255),                                                 --      protected String title;
    publication_date DATE,                                               --      protected Date publicationDate;
    publication_type VARCHAR2(20),                                       --      protected String publicationType;

    MEMBER FUNCTION displayBasicInfo RETURN VARCHAR2,                    --     public  String displayBasicInfo() 
    NOT INSTANTIABLE MEMBER FUNCTION displayFullInfo RETURN VARCHAR2     --     public abstract String displayFullInfo()             
    ) NOT INSTANTIABLE NOT FINAL;                                        --}
    /

CREATE OR REPLACE TYPE Book UNDER Publication(                           -- public class Book extends Publication {
    author VARCHAR2(255),                                                --      private String author;
    isbn VARCHAR2(13),                                                   --      private String isbn;
                                                                         --     @override
    OVERRIDING MEMBER FUNCTION displayFullInfo RETURN VARCHAR2           --     public String displayFullInfo()
);                                                                       --}                                                   
/

CREATE OR REPLACE TYPE Journal UNDER Publication(                        -- public class Journal extends Publication {
    volume NUMBER,                                                       --     private int volume;
    isbn VARCHAR2(13),                                                   --     private String ISBN
                                                                         --      @override
    OVERRIDING MEMBER FUNCTION displayFullInfo RETURN VARCHAR2           --     public String displayFullInfo()
);                                                                       --}
/  

CREATE OR REPLACE TYPE Member AS OBJECT(                                 -- public class Member {
    id NUMBER,                                                           --    private int id;
    name VARCHAR2(255),                                                  --    private String name
    contact_info VARCHAR2(255),                                          --    private String contact_info

    MEMBER FUNCTION displayInfo RETURN VARCHAR2                          -- public String displayInfo()
);                                                                       --}
/











