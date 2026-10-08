
# SQL Fundamentals – School Database Management System

## Project Overview


The project involves creating and managing a relational school database using **PostgreSQL**, hosted on **Supabase**. It demonstrates how to retrieve, filter, join, aggregate, insert, update, and delete database records using SQL.

The database manages students, teachers, courses, and student enrollments.

## Project Objectives

- Create and populate relational database tables using SQL.
- Retrieve and filter records using `SELECT`, `WHERE`, and `ORDER BY`.
- Combine related tables using `JOIN`.
- Analyse data using `COUNT()`, `AVG()`, `MAX()`, and `MIN()`.
- Group and filter aggregated data using `GROUP BY` and `HAVING`.
- Answer business questions using SQL queries.
- Perform data modifications using `INSERT`, `UPDATE`, and `DELETE`.
- Verify database integrity and query results.

## Technologies Used

| Technology | Purpose |
|---|---|
| PostgreSQL | Relational database management |
| Supabase | Cloud-hosted PostgreSQL database and SQL Editor |
| SQL | Database queries and data manipulation |
| VS Code | Writing and organising SQL files |
| Git & GitHub | Version control and project submission |

## Database Structure

The project consists of four related tables:

| Table | Description |
|---|---|
| `students` | Stores student information, including names, ages, emails, and towns |
| `teachers` | Stores teacher information and departments |
| `courses` | Stores course information and assigned teachers |
| `enrollments` | Connects students to courses and records grades |

### Initial Database Records

- **10 students**
- **5 teachers**
- **7 courses**
- **27 enrollments**

### Database Relationships

- One teacher can teach multiple courses.
- One student can enrol in multiple courses.
- One course can have multiple students.
- The `enrollments` table connects students and courses through foreign keys.

## Project Structure

```text
sql-fundamentals/
│
├── schema_and_seed.sql
├── queries.sql
├
│
├── screenshots/
│   
│
└── README.md
```

## Assignment Tasks

### Task 1: Basic SQL Queries

Completed 10 SQL queries demonstrating:

- Filtering students by town and age.
- Retrieving courses based on credit requirements.
- Joining students with their enrolled courses.
- Counting students enrolled in each course.
- Calculating average, maximum, and minimum grades.
- Filtering student names using pattern matching.
- Retrieving courses taught by Computer Science teachers.
- Grouping students by town using `GROUP BY` and `HAVING`.

**File:** `02_basic_queries.sql`

### Task 2: Business Questions

Used SQL to answer three business questions:

1. Which teacher teaches the highest number of unique students?
2. What is the average grade for each course?
3. Which students are enrolled in more than three courses?

These queries demonstrate multi-table joins, aggregation, grouping, and sorting.

**File:** `03_business_questions.sql`

### Task 3: Data Modifications

Performed three SQL operations:

- **INSERT:** Added five new Kenyan students.
- **UPDATE:** Increased grades in course ID 1 by five points without exceeding 100.
- **DELETE:** Removed students who had no course enrollments.

After the operations, the database should return to 10 students.

**File:** `04_data_modifications.sql`

## How to Run the Project

### 1. Set Up Supabase

1. Visit [Supabase](https://supabase.com/dashboard/project/zgvwexzkhlfbqtxgexaf).
2. Create or open a PostgreSQL project.
3. Navigate to **SQL Editor**.
4. Open a new SQL query.

### 2. Create and Populate the Database

Copy the contents of `01_schema_and_seed.sql` into Supabase SQL Editor and click **Run**.

**Note:** The starter SQL drops existing assignment tables before recreating them. Only run it when you intend to reset the database.

### 3. Execute SQL Queries


1. `01_schema_and_seed.sql` – Create and populate the database.
2. `02_basic_queries.sql` – Execute the 10 basic queries.
3. `03_business_questions.sql` – Answer the business questions.
4. `04_data_modifications.sql` – Insert, update, and delete records.
5. `05_verification.sql` – Verify the final database state.

Run individual queries separately when reviewing and capturing their outputs.

### 4. Verify the Results

After completing all tasks, check the final database totals:

| Table | Expected Records |
|---|---:|
| Students | 10 |
| Teachers | 5 |
| Courses | 7 |
| Enrollments | 27 |

Confirm that no student grade exceeds 100.


## Key Learning Outcomes

Through this project, I gained practical experience in:

- Understanding relational database structures.
- Writing SQL queries to retrieve and analyse data.
- Using primary and foreign keys to establish relationships.
- Applying SQL joins and aggregate functions.
- Solving practical business questions with SQL.
- Performing database modifications safely.
- Working with PostgreSQL through Supabase.
- Organising and documenting SQL projects using VS Code and GitHub.


## Author

**Dominic Kores Kisioya**

Full-Stack Software & AI Engineering 

