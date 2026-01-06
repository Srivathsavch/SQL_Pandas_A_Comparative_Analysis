# SQL_Pandas_A_Comparative_Analysis
# SQL vs Pandas – Practical Data Cleaning & Manipulation Guide

## 📌 Project Overview
This project is a **side-by-side practical comparison of SQL Server and Python Pandas**
for common **data loading, cleaning, filtering, transformation, and joining operations**.

Each SQL operation is paired with its **equivalent Pandas implementation** to
demonstrate how the same data tasks are performed across both technologies.

This project focuses on **hands-on data manipulation**, not just analysis outcomes.

---

## 📂 Datasets
Two CSV files are used throughout the project:

- `cust.csv` — customer master data
- `ords.csv` — order transaction data

The datasets intentionally include:
- Missing values (NULLs)
- Duplicate records
- Inconsistent fields

This allows realistic data cleaning and wrangling scenarios.

---

## 🗄 Data Loading

### SQL Server
- Tables created using `CREATE TABLE`
- Data loaded using `BULK INSERT`
- Schema-based table structure

### Pandas
- Data loaded using `pd.read_csv()`
- Column selection using `usecols`

This demonstrates **database-level ingestion vs in-memory processing**.

---

## 🔍 Column Selection & Filtering

### Covered Operations
- Selecting specific columns
- Filtering with single and multiple conditions
- Range filters (`BETWEEN`)
- Membership filters (`IN`)

SQL `SELECT` and `WHERE` clauses are mapped to:
- Pandas column indexing
- Boolean masking
- `query()`
- `isin()` and `between()`

---

## 🧹 Handling NULL Values

### Operations Demonstrated
- Identifying NULL and NOT NULL records
- Dropping rows with NULLs
- Filling missing values with defaults

SQL concepts such as:
- `IS NULL`, `IS NOT NULL`
- `DELETE`
- `COALESCE`

are mapped to Pandas methods:
- `isnull()`, `notnull()`
- `dropna()`
- `fillna()`

---

## 🔁 Sorting, Duplicates & Ranking

### Implemented Features
- Sorting records
- Finding duplicate rows
- Removing duplicates
- Ranking records

SQL window functions like `RANK()` are compared with
Pandas `rank()` and `duplicated()` functionality.

---

## ➕ Column Operations

### Demonstrated Actions
- Adding new columns
- Dropping columns
- Modifying column values

SQL `ALTER TABLE` operations are mapped to:
- Pandas column assignment
- `insert()`, `drop()`, `pop()`

---

## 🔗 Combining & Joining Data

### Covered Scenarios
- UNION vs UNION ALL
- Inner Join
- Left Join

SQL set operations and joins are compared with:
- `pd.concat()`
- `pd.merge()`

Data standardization steps are included before merging datasets.

---

## 🧩 Data Wrangling & Transformation

### Techniques Applied
- Handling missing values conditionally
- String cleanup and formatting
- Default value assignment
- Date standardization

SQL `CASE WHEN` logic is implemented using Pandas:
- `fillna()`
- `str.strip()`
- Column-level transformations

---

## 🛠 Tools & Technologies
- SQL Server
- Python
- Pandas
- Jupyter Notebook / Python environment
- Git & GitHub

---

---

## 🎯 Purpose of This Project
This project demonstrates:
- Strong SQL fundamentals
- Practical Pandas usage
- Ability to translate logic across tools
- Real-world data cleaning and manipulation skills

It is intended as a **reference guide and interview portfolio project**
for data analyst and data engineering roles.

---

## 👤 Author
**Chakpalli Srivathsav**


## 📁 Repository Structure
