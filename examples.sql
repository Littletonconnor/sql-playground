-- Sub-queries
SELECT comment_id, user_id, LEFT(comment, 20) FROM comments WHERE user_id = (SELECT user_id FROM users WHERE full_name = 'Maynord Simonich');

-- Group by
select date(time) as date, count(*) as comment_count from comments group by date(time) order by min(time) desc;

SELECT time, count(*) as comment_count FROM comments WHERE board_id = 1 GROUP BY time ORDER BY time DESC

SELECT
  boards.board_name, COUNT(*) AS comment_count
FROM
  comments
INNER JOIN
  boards
ON
  boards.board_id = comments.board_id
GROUP BY
  boards.board_name
ORDER BY
  comment_count DESC
LIMIT 10;
