/*
  This SQL file includes examples demonstrating various types of queries,
  including SELECTs, JOINs, sub-queries, GROUP BY, and more.
  
  Types of JOINs explained:
  - INNER JOIN: Returns only rows where there is a match in both tables.
  - LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table, 
    with matching rows from the right table or NULL if no match.
  - RIGHT JOIN (RIGHT OUTER JOIN): Returns all rows from the right table,
    with matching rows from the left table or NULL if no match.
  - FULL JOIN (FULL OUTER JOIN): Returns all rows when there is a match 
    in either table, with NULLs for non-matching rows.
  - CROSS JOIN: Returns the Cartesian product of both tables, combining 
    every row from the first table with every row from the second table.
  - SELF JOIN: Joins a table to itself, useful for comparing rows within 
    the same table or finding hierarchical relationships.
*/

-- Basic queries: Select all rows from the boards table
SELECT * FROM boards;

-- Basic queries: Select all rows from the comments table
SELECT * FROM comments;

-- Basic queries: Select all rows from the rich_content table
SELECT * FROM rich_content;

-- Basic queries: Select all rows from the users table
SELECT * FROM users;

-- Select specific columns: Get board names and descriptions
SELECT board_name, board_description FROM boards;

-- Select specific columns: Get usernames and their emails
SELECT username, email FROM users;

-- Joins: Get all board information and their related comments
SELECT * FROM boards INNER JOIN comments ON boards.board_id = comments.board_id;

-- Joins: Get board information for a specific comment
SELECT * FROM boards INNER JOIN comments ON boards.board_id = comments.board_id WHERE comments.comment_id = 1;

-- Joins: Get board information for a set of specific comments
SELECT * FROM boards INNER JOIN comments ON boards.board_id = comments.board_id WHERE comments.comment_id IN (1, 2, 3);

-- Joins: Get board information using a sub-query to filter comments
SELECT * FROM boards INNER JOIN comments ON boards.board_id = comments.board_id WHERE comments.comment_id IN (SELECT comment_id FROM comments WHERE comment_id = 1);

-- Joins: Get comments and the usernames of the users who made them
SELECT comments.comment, users.username 
FROM comments 
JOIN users ON comments.user_id = users.user_id;

-- Joins with multiple tables: Get board names, comments, and usernames
SELECT b.board_name, c.comment, u.username
FROM boards b
JOIN comments c ON b.board_id = c.board_id
JOIN users u ON c.user_id = u.user_id;

-- Joins with multiple tables: Get comments and their rich content
SELECT c.comment, rc.content 
FROM comments c 
JOIN rich_content rc ON c.comment_id = rc.comment_id;

-- Sub-queries: Get boards that have comments with a specific comment ID
SELECT * FROM boards WHERE board_id IN (SELECT board_id FROM comments WHERE comment_id = 1);

-- Sub-queries: Get boards with comments that match a nested sub-query filter
SELECT * FROM boards WHERE board_id IN (SELECT board_id FROM comments WHERE comment_id IN (SELECT comment_id FROM comments WHERE comment_id = 1));

-- Sub-queries: Get boards with comments that match a multi-level sub-query filter
SELECT * FROM boards WHERE board_id IN (SELECT board_id FROM comments WHERE comment_id IN (SELECT comment_id FROM comments WHERE comment_id IN (SELECT comment_id FROM comments WHERE comment_id = 1)));

-- Sub-queries: Get usernames who made a specific comment
SELECT username FROM users WHERE user_id IN (SELECT user_id FROM comments WHERE comment_id = 1);

-- Group by: Count comments by date
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC;

-- Group by: Count the total number of comments each user made
SELECT user_id, COUNT(*) AS total_comments FROM comments GROUP BY user_id ORDER BY total_comments DESC;

-- Group by with HAVING: Get board IDs with more than 5 comments
SELECT board_id, COUNT(comment_id) AS num_comments FROM comments GROUP BY board_id HAVING COUNT(comment_id) > 5;

-- Having: Count comments by date only if the total count is more than 10
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) HAVING count(*) > 10 ORDER BY min(time) DESC;

-- Order by: Get comment counts by date ordered by the earliest comment date
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC;

-- Order by: List all users sorted by their last login date
SELECT * FROM users ORDER BY last_login DESC;

-- Limit: Get the top 10 most recent comment counts by date
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC LIMIT 10;

-- Limit: Get the 5 most recently created users
SELECT * FROM users ORDER BY created_on DESC LIMIT 5;

-- Date functions: Count comments by date
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC;

-- Date functions: Count comments only on days with more than 10 comments
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) HAVING count(*) > 10 ORDER BY min(time) DESC;

-- Date functions: Get user details with last login in the past 7 days
SELECT user_id, username, last_login
FROM users
WHERE last_login >= CURRENT_DATE - INTERVAL '7 days';

-- Advanced queries: Get the top 3 users with the most comments
SELECT u.username, COUNT(c.comment_id) AS comment_count
FROM users u
JOIN comments c ON u.user_id = c.user_id
GROUP BY u.user_id
O

