# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

result = JSON.parse(open(url).read)

result["drinks"].each do |ingredient|
  ingredient_name = ingredient["strIngredient1"]
  Ingredient.create(name: ingredient_name)
end

clean = Ingredient.find_by name: '151 proof rum'
clean.delete

clean = Ingredient.find_by name: '7-Up'
clean.delete

