require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = open(url).read
ingredients = JSON.parse(drinks)

puts ingredients["drinks"]

Ingredient.destroy_all

ingredients["drinks"].each do |ing|
  ingr = Ingredient.create(name: ing["strIngredient1"])
  puts "created #{ingr.name}"
end
