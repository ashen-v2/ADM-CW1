# Advanced Data Modeling — PL/SQL Scripts

This directory contains PL/SQL type, table, view and data scripts used for the coursework examples (object types, tables, inheritance-like object behaviour, and simple queries).

Files
- `types_attributes.sql`: Defines object types (`Publication`, `Book`, `Journal`, `Member`) and their attributes. (Type declarations / member signatures.)
- `types_functions.sql`: Implements member functions (type bodies) for the types declared in `types_attributes.sql` (e.g., `displayBasicInfo`, `displayFullInfo`, `displayInfo`).
- `types_tables.sql`: Creates database tables: `publication_tab`, `member_tab`, `loan_tab`, `book_tab`, `journal_tab`. Tables reference object types (for example `member_tab OF Member`). Contains DROP statements and CREATE TABLE statements.
- `all_publication_view.sql`: Creates an object view `all_publications_view` that unifies `Book` and `Journal` instances as `Publication` objects for polymorphic queries.
- `Insert_book_journal.sql`: Example inserts that add one book and one journal row into `publication_tab`, `book_tab`, and `journal_tab`.
- `insert_member_loan.sql`: Example inserts for `member_tab` and `loan_tab` showing a loan record.
- `search_loan.sql`: Example queries demonstrating retrieving full information from `all_publications_view`, filtering by title/author/type, and listing borrowed publications.
- `reset.sql`: Cleanup script that drops the tables and types (resets the schema created by these scripts).

Recommended execution order
1. `types_attributes.sql` — create object types (declarations)
2. `types_functions.sql` — create type bodies (member function implementations)
3. `types_tables.sql` — create tables (these reference the object types)
4. `Insert_book_journal.sql` and `insert_member_loan.sql` — load example data
5. `all_publication_view.sql` — create the object view that depends on the tables/types
6. `search_loan.sql` — run example queries against the view and data


Prerequisites
- Oracle Database (version that supports object types and object views)
- SQL client such as `sqlplus` or `SQLcl` with access to the target schema/user

Quick run examples (SQL*Plus / SQLcl)

Run the scripts in the recommended order, for example:

```sql
"types_attributes.sql"
"types_functions.sql"
"types_tables.sql"
"Insert_book_journal.sql" --optional run select statements to view tables
"insert_member_loan.sql"
"all_publication_view.sql"
"search_loan.sql"
```

To tear down the objects created by these scripts:

```sh
sqlplus username/password@DBSERVICE @"reset.sql"
```

