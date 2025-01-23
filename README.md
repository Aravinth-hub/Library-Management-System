PROJECT TITLE : LIBRARY MANAGEMENT SYSTEM

INTRODUCTION:
    This project, “Library Management System,” contains data relevant to the books present in the library and also contains staff, branch, and customer details. It includes the return details and the fees paid by the customer. Along with the management of the system, it also maintains the records of issue status and publishers of the books.

TABLES INCLUDED:
1. branch

    Stores information about library branches including branch_id, branch_name, and branch_city.
2. staff

    Contains details about library staff members such as staff_id, staff_name, staff_salary,branch_id (foreign key referencing branch table), and contact information.
3. customer

    Holds records of library customers with customer_id, customer_name, purchase_date, and contact details.
4. book

    Stores information about books available in the library including book_id, title, author and price.
5. fees

    Keeps track of any fees  with fields such as fee_amount,fees_status, customer_id (foreign key referencing customer table).
6. return_details

    Logs details of book returns including return_id, book_id (foreign key referencing book table), customer_id (foreign key referencing customer table), return_date.

SQL SCRIPT:
    lms.sql - Contains SQL commands to create the tables mentioned above along with their respective fields and relationships.

USAGE:
1. Setup
    Execute lms.sql in your SQL database management tool (e.g., MySQL Workbench, pgAdmin).
2. Data Population
    After creating the tables, you can populate them with sample data using INSERT statements to simulate library operations.
3. Queries
    Use SQL queries to retrieve information about branches, staff, customers, books, fees, and return details as needed for your library management application.
