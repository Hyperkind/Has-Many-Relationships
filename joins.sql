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
-- SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
--   FROM comments INNER JOIN posts ON (comments.posts_id = posts.id)
--   WHERE posts.created_at < '2015-01-01 00:00:00';

-- 9 Query to get all rows in comments table, showing post title
-- (aliased as post_title), post url (alias as post_url), and the
-- comment body (alias as comment_body) where the post was created after
-- 1/1/2015
-- SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
--   FROM comments INNER JOIN posts ON (comments.posts_id = posts.id)
--   WHERE posts.created_at > '2015-01-01 00:00:00';

-- 10 Query to get all the rows in the comments table, showing post title
-- (alias post_title), post url (alias post_url), comment body (alias comment_body)
-- where the comment body contains the word 'USB'
-- SELECT comments.*, posts.title AS "post_title", posts.url AS "post_url", comments.body AS "comment_body"
--   FROM comments INNER JOIN posts ON (comments.posts_id = posts.id)
--   WHERE body LIKE '%USB%';

-- 11 Query to get the post title (alias post_title), first name of the author
-- of the post, last name of the author of the post and comment body
-- (alias comment_body) where the comment body contains the word 'matrix'
-- should have 855 results
-- SELECT title, users.first_name, users.last_name, comments.body AS "comment_body"
--   FROM posts
--     INNER JOIN users ON posts.users_id = users.id
--     INNER JOIN comments ON users.id = comments.users_id
--   WHERE comments.body LIKE '%matrix%';

-- 12 Query to get the first name of the author of the comment, last name of the
-- author of the comment, and comment body (alias comment_body), where the comment
-- body contains the word 'SSL' and the post content contains the word 'dolorum'
-- SELECT first_name, last_name, comments.body AS "comment_body"
--   FROM users
--     INNER JOIN comments ON (users.id = comments.users_id)
--     INNER JOIN posts ON (users.id = posts.users_id)
--   WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

-- 13 Query to get the first name of the author of the post (alias post_author_first_name),
-- last name of the author (alias to post_author_last_name), post title (alias to post_title),
-- username of the author of the comment (alias to comment_author_username) and comment body
-- (alias to comment_body) where the comment body contains the word 'SSL' or 'firewall'
-- and the post content contains the word 'nemo'
-- SELECT first_name AS "post_author_first_name", last_name AS "post_author_last_name", posts.title AS "post_title", username AS "comment_author_username", comments.body AS "comment_body"
--   FROM users
--     INNER JOIN posts ON (users.id = posts.users_id)
--     INNER JOIN comments ON (users.id = comments.users_id)
--   WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%nemo%'
--     OR comments.body LIKE '%firewall%' AND posts.content LIKE '%nemo%';

-- ADDITIONAL!

-- 1 Find the post id, post title, user id of all posts where the author commented
-- on his/her own post
-- SELECT id, title, users.id
--   FROM posts
--     INNER JOIN users ON (posts.users_id = users.id)
--   WHERE