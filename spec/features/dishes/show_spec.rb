require 'rails_helper'

RSpec.describe "When I visit a dish's show page" do
  it "I see a list of ingredients for that dish and the chef's name" do
    chef = Chef.create!(name: "Sir Shak Shuka")
    dish = chef.dishes.create!(name: "Shakshuka", description: "Eggs, tomatoes, and all the spiced goodness you could imagine.")
    ingredient_1 = dish.ingredients.create!(name: "Eggs", calories: 90)
    ingredient_2 = dish.ingredients.create!(name: "Tomatoes", calories: 50)
    ingredient_3 = dish.ingredients.create!(name: "Onions", calories: 30)
binding.pry
    visit dish_path(dish)

    dish.ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end

    expect(page).to have_content(chef.name)
  end
end
