-- Basic queries
SELECT * FROM boards;
SELECT * FROM comments;
SELECT * FROM rich_content;
SELECT * FROM users;

-- Joins
SELECT * FROM boards INNER JOIN comments ON boards.board_id = comments.board_id;
SELECT * FROM boards INNER JOIN comments ON boards.board_id = comments.board_id WHERE comments.comment_id = 1;
SELECT * FROM boards INNER JOIN comments ON boards.board_id = comments.board_id WHERE comments.comment_id IN (1, 2, 3);
SELECT * FROM boards INNER JOIN comments ON boards.board_id = comments.board_id WHERE comments.comment_id IN (SELECT comment_id FROM comments WHERE comment_id = 1);

-- Sub-queries
SELECT * FROM boards WHERE board_id IN (SELECT board_id FROM comments WHERE comment_id = 1);
SELECT * FROM boards WHERE board_id IN (SELECT board_id FROM comments WHERE comment_id IN (SELECT comment_id FROM comments WHERE comment_id = 1));
SELECT * FROM boards WHERE board_id IN (SELECT board_id FROM comments WHERE comment_id IN (SELECT comment_id FROM comments WHERE comment_id IN (SELECT comment_id FROM comments WHERE comment_id = 1)));

-- Group by
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC;

-- Having
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) HAVING count(*) > 10 ORDER BY min(time) DESC;

-- Order by
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC;

-- Limit
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC LIMIT 10;

-- Date functions
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC;
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) HAVING count(*) > 10 ORDER BY min(time) DESC;
SELECT date(time) as date, count(*) as comment_count FROM comments GROUP BY date(time) ORDER BY min(time) DESC;

SELECT user_id, username, last_login
FROM users
WHERE last_login >= CURRENT_DATE - INTERVAL '7 days';
