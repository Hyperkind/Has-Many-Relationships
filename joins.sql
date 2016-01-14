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
-- SELECT username
--   FROM users
--   WHERE created_at > '2015-01-01 00:00:00';

-- 6 Query to get the post title, post content, user's username where
-- the user who created the post joined before 1/1/2015
-- SELECT posts.title, posts.content, users.username
--   FROM posts INNER JOIN users ON (posts.users_id = users.id)
--   WHERE users.created_at < '2015-01-01 00:00:00';

-- 7 Query to get all rows in the comments table, showing post title
-- (aliased as 'Post Title') and all the comment's fields
-- SELECT comments.*, posts.title AS "Post Title"
--   FROM comments INNER JOIN posts ON (comments.posts_id = posts.id)


-- 8 Query to get all rows in the comments table, showing post title
-- (aliased as post_title), post url (aliased as post_url), and the
-- comment body (aliased as comment_body) where the post was created
-- before 1/1/2015
SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
  FROM comments INNER JOIN posts ON (comments.posts_id = posts.id)
  WHERE posts.created_at < '2015-01-01 00:00:00';