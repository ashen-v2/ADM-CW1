--   ======================================================================================================================
--    IN PL\SQL WE CAN WRITE CLASS ATTRIBUTES AND CLASS METHODS IN SEPERATE SCRIPTS UNLIKE JAVA
--    CHECK types_attributes.sql for ATTRIBUTES OF THE Type(class)
--    Attributes inside the class body are called MEMBER VARIABLES and methods are called MEMBER FUNCTIONS
--    IN JAVA We call this.Attribute when using it inside the class but in PL\SQL we use SELF.Attribute Like Python Classes
--   ======================================================================================================================

-- Parent class                                                                     --Java Equivant
CREATE OR REPLACE TYPE BODY Publication AS                                          -- public class Publication {                                          
    MEMBER FUNCTION displayBasicInfo RETURN VARCHAR2 IS                             --     public String displayBasicInfo() {      
    BEGIN                                                                           --         String output =("Title: " + this.title + "| Publication Date: " + this.publicationDate + |"Type: " + this.publicationType);
        RETURN 'Title: ' || SELF.title ||                                           --         return output;     
        '| Publication Date:' || TO_CHAR(SELF.publication_date, 'YYYY-MM-DD') ||    --         }
        '| Type: ' || SELF.publication_type;                                        --}
    END;
END;
/
-- Child class of Publication Super class
CREATE OR REPLACE TYPE BODY Book AS                                                 --public class Book{
                                                                                    --    @override
    OVERRIDING MEMBER FUNCTION displayFullInfo RETURN VARCHAR2 IS                   --    public String displayFullInfo(){
    BEGIN                                                                           --        String output =(this.displayBasicInfo() + "| Author: " + this.author + "| ISBN: " + this.isbn);
        RETURN SELF.displayBasicInfo ||                                             --        return output;
        '| Author: ' || SELF.author ||                                              --        } 
        '| ISBN: ' || SELF.isbn;                                                    --}
    END;
END;
/
-- Child class of Publication Super class
CREATE OR REPLACE TYPE BODY Journal AS                                              --public class Journal{
                                                                                    --    @override
    OVERRIDING MEMBER FUNCTION displayFullInfo RETURN VARCHAR2 IS                   --    public String displayFullInfo(){
    BEGIN                                                                           --        String output =(this.displayBasicInfo() + "| Author: " + this.author + "| ISBN: " + this.isbn);
        RETURN SELF.displayBasicInfo ||                                             --        return output;
        '| Volume: ' || SELF.volume ||                                              --        } 
        '| ISBN: ' || SELF.isbn;                                                    --}
    END;
END;
/

CREATE OR REPLACE TYPE Body Member AS                                               --public class Member{
    MEMBER FUNCTION displayInfo RETURN VARCHAR2 IS                                  --    public String displayInfo()
    BEGIN                                                                           --          String output =("Id: " + this.Id + "| Name: " + this.name + "| Contact_info: " + this.contact_info);
        RETURN '|Id: ' || SELF.Id ||                                                --          return output;
        '| Name: ' || SELF.name ||                                                  --          }                                                 
        '| Contact_info: ' || SELF.contact_info;                                    --}
    END;
END;
/