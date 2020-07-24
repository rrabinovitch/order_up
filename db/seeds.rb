# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DishIngredient.destroy_all
Ingredient.destroy_all
Dish.destroy_all
Chef.destroy_all

sir_shak = Chef.create!(name: "Sir Shak Shuka")
shakshuka = sir_shak.dishes.create!(name: "Shakshuka", description: "Eggs, tomatoes, and all the spiced goodness you could imagine.")
eggs = Ingredient.create!(name: "Eggs", calories: 90)
tomatoes = Ingredient.create!(name: "Tomatoes", calories: 50)
onions = Ingredient.create!(name: "Onions", calories: 30)
shakshuka_eggs = DishIngredient.create!(dish_id: shakshuka.id, ingredient_id: eggs.id)
shakshuka_tomatoes = DishIngredient.create!(dish_id: shakshuka.id, ingredient_id: tomatoes.id)
shakshuka_onions = DishIngredient.create!(dish_id: shakshuka.id, ingredient_id: onions.id)
