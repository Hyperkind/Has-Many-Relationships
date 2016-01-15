\c has_many_blogs;

-- Drops the users table
DROP TABLE IF EXISTS users;

-- Creates the users table
CREATE TABLE users(
  id serial PRIMARY KEY NOT NULL,
  username character varying(90) NOT NULL,
  first_name character varying(90) default NULL,
  last_name character varying(90) default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now()
);

-- Drops the posts table
DROP TABLE IF EXISTS posts;

-- Creates the posts table
CREATE TABLE posts(
  id serial PRIMARY KEY NOT NULL,
  title character varying(180) default NULL,
  url character varying(510) default NULL,
  content text default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now(),
  users_id integer REFERENCES users(id)
);

-- Drops the comments table
DROP TABLE IF EXISTS comments;

-- Creates the comments table
CREATE TABLE comments(
  id serial PRIMARY KEY NOT NULL,
  body character varying(510) default NULL,
  created_at timestamp with time zone NOT NULL default now(),
  updated_at timestamp with time zone NOT NULL default now(),
  users_id integer REFERENCES users(id),
  posts_id integer REFERENCES posts(id)
);