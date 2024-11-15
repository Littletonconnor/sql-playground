# Running

An easy to setup database environment for learning and testing! :tada:

```bash
./run.sh mysecretpassword ./seed.sql
```

## Tables

### Boards

| Column            | Type                  | Collation | Nullable | Default                      |
| ----------------- | --------------------- | --------- | -------- | ---------------------------- |
| board_id          | integer               |           | not null | generated always as identity |
| board_name        | character varying(50) |           | not null |                              |
| board_description | text                  |           | not null |                              |

### Comments

| Column     | Type                       | Collation | Nullable | Default                      |
|------------|----------------------------|-----------|----------|------------------------------|
| comment_id | integer                    |           | not null | generated always as identity |
| user_id    | integer                    |           |          |                              |
| board_id   | integer                    |           |          |                              |
| comment    | text                       |           | not null |                              |
| time       | timestamp without time zone|           |          |                              |

### Rich Content

| Column     | Type       | Collation | Nullable | Default                      |
|------------|------------|-----------|----------|------------------------------|
| content_id | integer    |           | not null | generated always as identity |
| comment_id | integer    |           |          |                              |
| content    | jsonb      |           | not null |                              |

### Users

| Column     | Type                  | Collation | Nullable | Default                      |
|------------|-----------------------|-----------|----------|------------------------------|
| user_id    | integer               |           | not null | generated always as identity |
| username   | character varying(25) |           | not null |                              |
| email      | character varying(50) |           | not null |                              |
| full_name  | character varying(100)|           | not null |                              |
| last_login | timestamp without time zone |      |          |                              |
| created_on | timestamp without time zone |      | not null |                              |

Checkout examples.sql for some common queries.

## Requirements

- Docker

# Beginner's Guide to Databases

## Introduction
Databases are organized collections of data that can be easily accessed, managed, and updated. They are fundamental to most applications, powering everything from simple blogs to complex enterprise systems. This guide will cover the fundamentals of databases, including core concepts such as data storage, retrieval, indexes, and more.

## 1. Types of Databases
- **Relational Databases (RDBMS)**: These use a structured format with tables and are based on SQL (Structured Query Language). Examples: MySQL, PostgreSQL, SQLite.
- **NoSQL Databases**: These are more flexible, designed for unstructured or semi-structured data. Examples include MongoDB (document store), Redis (key-value store), and Cassandra (wide-column store).
- **NewSQL Databases**: Combine the benefits of traditional RDBMS and NoSQL systems for scalability and consistency. Examples: CockroachDB, Google Spanner.
- **Graph Databases**: Store data in graph structures with nodes, edges, and properties. Example: Neo4j.

## 2. Data Storage and Retrieval
- **Tables and Rows (RDBMS)**: Data is stored in tables, with rows representing individual records and columns representing attributes of the data.
- **Documents (NoSQL)**: Data is stored as JSON-like documents, allowing nested structures.
- **Key-Value Pairs (NoSQL)**: Data is stored as simple key-value pairs, suitable for fast lookups.
- **Graph Structures**: Data is represented as nodes (entities) and edges (relationships).

### Data Retrieval
- **SQL Queries**: Used in RDBMS for operations such as `SELECT`, `INSERT`, `UPDATE`, and `DELETE`. Example:
  ```sql
  SELECT * FROM users WHERE age > 21;
  ```
- **NoSQL Methods**: Typically involve API calls or query languages specific to the database (e.g., MongoDB uses BSON queries).

## 3. Indexes
Indexes are special data structures that improve the speed of data retrieval. They work like the index at the back of a book, allowing you to quickly find rows without scanning the entire table.

### Types of Indexes
- **Primary Index**: Automatically created with the primary key, ensuring unique identifiers for each record.
- **Secondary Index**: Created on non-primary key columns to speed up lookups based on those columns.
- **Composite Index**: An index on multiple columns, useful for complex queries involving multiple conditions.

### How Indexes Work
Indexes use structures such as B-Trees or hash maps:
- **B-Trees**: Balanced tree structures that allow O(log n) search time.
- **Hash Indexes**: Use a hash map for faster lookups but are limited to exact matches.

**Note**: While indexes speed up reads, they can slow down write operations due to the overhead of updating the index.

## 4. Data Relationships
- **One-to-One**: Each record in a table relates to one record in another table. Example: A user profile linked to a user account.
- **One-to-Many**: A single record relates to multiple records in another table. Example: A user with multiple orders.
- **Many-to-Many**: Requires a junction table to manage complex relationships. Example: Students enrolled in multiple courses.

## 5. Normalization and Denormalization
- **Normalization**: The process of structuring a database to reduce redundancy and dependency. This often involves breaking down large tables into smaller, related tables.
- **Denormalization**: Combines tables to improve read performance at the cost of data redundancy.

**Common Normal Forms**:
- **1NF (First Normal Form)**: No repeating groups or arrays. Each column holds atomic values.
- **2NF (Second Normal Form)**: Meets 1NF and every non-primary key column is fully dependent on the primary key.
- **3NF (Third Normal Form)**: Meets 2NF and has no transitive dependencies (columns not dependent on the primary key).

## 6. Transactions and ACID Properties
Transactions ensure that a series of operations are executed as a single unit. They must have the following ACID properties:
- **Atomicity**: All operations complete successfully or none do.
- **Consistency**: Ensures that a transaction takes the database from one valid state to another.
- **Isolation**: Ensures that transactions do not interfere with each other.
- **Durability**: Ensures that once a transaction is committed, it is permanently saved.

## 7. SQL vs. NoSQL
- **SQL Databases**: Best for structured data and complex queries. Provide ACID compliance.
- **NoSQL Databases**: Offer flexibility and scalability for unstructured data. Use cases include real-time data and large-scale applications.

## 8. Best Practices
- **Use Indexes Wisely**: Only create indexes on columns used frequently in query filters.
- **Normalize to Start**: Reduce redundancy in the initial design, then denormalize as needed for performance.
- **Backup Regularly**: Ensure data can be restored in case of a failure.
- **Monitor Performance**: Use database monitoring tools to identify slow queries and optimize them.

## Conclusion
Understanding database fundamentals such as data storage, retrieval, indexing, and ACID properties is essential for developing efficient and reliable applications. Whether working with SQL or NoSQL databases, choosing the right type and structure can make a significant difference in your application's performance and scalability.

