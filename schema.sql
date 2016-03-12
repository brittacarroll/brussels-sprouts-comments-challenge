

DROP TABLE IF EXISTS recipes CASCADE;
DROP TABLE if exists comments;

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment TEXT,
  recipe_id INT NOT NULL REFERENCES recipes
);
