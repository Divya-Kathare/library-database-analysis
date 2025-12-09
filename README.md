📚 Library Database Analysis Project




A complete SQL-based analysis of a library management system.
This project demonstrates database design, ER modelling, relational analysis, and SQL querying to extract insights about book distribution, borrower activity, and branch performance.

🧠 1. Project Overview

This project explores real-world library operations using SQL.
The goal is to analyze:

How books are distributed across branches

Borrower usage patterns

Availability of specific authors/titles

Branch-level loan performance

The dataset is normalized into multiple tables, enabling clear relational analysis and efficient querying.

🏗️ 2. Database Schema

The project uses a 7-table relational schema with the following structure:

Table	Purpose
tbl_publisher	Stores publisher details
tbl_book	Contains book info and publisher references
tbl_book_authors	Links books to authors
tbl_library_branch	Stores branch details
tbl_book_copies	Tracks book inventory across branches
tbl_borrower	Stores borrower information
tbl_book_loans	Tracks loan transactions

The schema follows one-to-many and many-to-many relationships enforced via foreign keys.

🧪 3. Dataset Description

The project includes the following CSV datasets:

books.csv

authors.csv

book_copies.csv

book_loans.csv

borrower.csv

library_branch.csv

publisher.csv

These datasets were imported into MySQL and mapped to the appropriate tables.

🔍 4. Key Analysis Questions

The analysis answers:

Copies of “The Lost Tribe” at Sharpstown

Copies of the same book across all branches

Borrowers with no books checked out

Books due on 2018-02-03 from Sharpstown

Total number of books loaned per branch

Borrowers with more than five books checked out

Stephen King books available at the Central branch

📊 5. SQL Result Summary
Query	Summary
Q1	Book not found → 0 rows
Q2	Book not found → 0 rows
Q3	All 20 borrowers have zero checkouts
Q4	No Sharpstown branch, no due-date match
Q5	All branches show 0 loan records
Q6	No borrower has more than 5 loans
Q7	It → 3 copies, The Green Mile → 3 copies at Central
💡 6. Business Insights

No recorded borrowing activity in the dataset

Library branches hold inventory that is not circulating

Borrower engagement is very low

Stephen King titles are well-stocked at Central

Data quality gaps affect operational understanding

🚀 7. Recommendations

Implement a digital circulation system with proper transaction logging

Redistribute popular titles based on expected demand

Improve borrower outreach and engagement programs

Set up automated SQL dashboards for monitoring

Enrich future datasets with timestamps & categories

📁 8. Project Files

This repository contains:

library_database_analysis.sql — full schema + SQL queries

All dataset CSV files

README.md — documentation (this file)

✔ PPT is intentionally not included, as this repository focuses on SQL and datasets only.

🛠️ 9. How to Use This Project
Step 1 — Clone the Repository
git clone https://github.com/Divya-Kathare/library-database-analysis.git

Step 2 — Create the Database
create database Library_Database_Analysis;
use Library_Database_Analysis;

Step 3 — Run the SQL Script

Open and execute:

library_database_analysis.sql

Step 4 — Import CSV Data

Import each CSV into its matching table.

Step 5 — Run Analysis Queries

Generate insights from SQL result sets.

🙋‍♂️ Author

Divya Kathare
SQL • Data Analyst • Data Science Enthusiast

GitHub: https://github.com/Divya-Kathare

LinkedIn: https://www.linkedin.com/in/divya-kathare-41323a3a0

Strong foundation in SQL, database design, and analytical problem-solving.
