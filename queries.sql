# # * How many recipes are there in total?
SELECT COUNT(*) FROM recipes
# # * How many comments are there in total?
SELECT COUNT(*) FROM comments
# # * How would you find out how many comments each of the recipes have?
SELECT COUNT(*) FROM recipes
  LEFT JOIN comments ON recipes.id = comments.recipe_id
  WHERE recipes.id = comments.recipe_id

# * What is the name of the recipe that is associated with a specific comment?
 SELECT recipes.name FROM recipes
  LEFT JOIN comments ON recipes.id = comments.recipe_id
  WHERE comments.comment LIKE '%good when fried%'

# * Add a new recipe titled `Brussels Sprouts with Goat Cheese`. Add two comments to it.
db_connection do |conn|
  sql_query = "INSERT INTO recipes (name) VALUES ($1)"
  data = ["Brussles Sprouts with Goat Cheese"]
  conn.exec_params(sql_query, data)
end

db_connection do |conn|
  sql_query = "INSERT INTO comments (comment, recipe_id) VALUES ($1, $2)"
  data = ["good with mayonnaise", 2]
  conn.exec_params(sql_query, data)
end
