#Eric helped me with this a loti
require 'pg'
require 'faker'
require 'pry'

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

#WRITE CODE TO SEED YOUR DATABASE AND TABLES HERE
def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

def insert_recipes
  split_titles = []
  db_connection do |conn|
    sql_query = "INSERT INTO recipes (name) VALUES ($1);"
    data = [TITLES.sample]
    conn.exec_params(sql_query, data)
  end
end

def insert_comments
  db_connection do |conn|
    sql_query = "INSERT INTO comments (comment, recipe_id) VALUES ($1, $2);"
    data = [Faker::Lorem.sentence, (rand(TITLES.length) + 1)]
    conn.exec_params(sql_query, data)
  end
end

def insert_into_tables
  db_connection do |conn|
    TITLES.length.times { insert_recipes }
    20.times { insert_comments }
  end
end
