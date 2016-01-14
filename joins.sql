-- Changes to the has_many_blogs database
\c has_many_blogs;

-- 1 Query to get all fields from users table
-- SELECT * from users;

-- 2 Query to get all fields from the posts table where the user_id is 100
-- SELECT *
--   FROM posts
--   WHERE users_id = 100;

-- 3 Query to get all posts fields, user's first and last name
-- from the posts table where user_id is 200
-- SELECT posts.*, users.first_name, users.last_name
--   FROM posts INNER JOIN users ON (posts.users_id = users.id)
--   WHERE users_id = 200;

-- 4 Create a query to get all posts fields and user's username
-- from the posts table where first name is 'Norene', last name 'Schmitt'
-- SELECT posts.*, users.username
--   FROM posts INNER JOIN users ON (posts.users_id = users.id)
--   WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- 5 Query to get usernames from users table where user has created a post
-- after 1/1/2015
SELECT username
  FROM users
  WHERE created_at >= '2015-01-01 00:00:00';

