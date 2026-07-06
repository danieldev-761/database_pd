Documentación
El proyecto deberá incluir un README.md en inglés con:
• Project description.
• Technologies used.
• Database engine used.
• Explanation of normalization process.
• Database structure.
• Entity Relationship Model.
• Instructions to create the database.
• Instructions to load data.
• Explanation of each SQL query.
• Developer information:
o Full name.
o Clan.

# Project Database RiwiSUply

## Project Description
The objectives of this project are to:

- Analyze the data in the *Dataset_RiwiSupply* Excel file.
- Identify inconsistencies and redundancies within the data.
- Design an Entity-Relationship Model (ERM).
- Apply the first three normal forms (1NF, 2NF, and 3NF).
- Construct the resulting relational model.
- Implement the database in MySQL or PostgreSQL.
- Load data from CSV files or by using SQL scripts.
- Execute SQL queries to retrieve information relevant to the company's operations.

## Technologies used

- DBeaver
- Docker Desktop
- PostgreSQL 16

## Decisions
- 1. Insert manually, with the exception of master tables.
- 2. In the Products table, filter for the necessary columns and select the lowest value for Unit_Price.
- 3. I decided not to include total_price in the Purchases table because that price can be obtained by summing the subtotals of each product from the associative table linked to Products.

## Database structure.



## Author

Daniel Echeverría - Clan Garabato

### Repository: https://github.com/danieldev-761/database_pd

