require "json"
require "rest-client"
# require_relative "../app/models/post"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(response)

i = 0
ingredients["drinks"].count.times do
  Ingredient.create(name: ingredients["drinks"][i]["strIngredient1"])
  i +=1
end

