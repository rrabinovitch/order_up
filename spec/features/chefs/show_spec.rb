require 'rails_helper'

RSpec.describe "When I visit a chef's show page" do
  before :each do
    @chef = Chef.create!(name: "Sir Shak Shuka")

    @dish_1 = @chef.dishes.create!(name: "Shakshuka", description: "Eggs, tomatoes, and all the spiced goodness you could imagine.")
    @dish_2 = @chef.dishes.create!(name: "Frittata", description: "Imagine a big egg patty.")

    @ingredient_1 = Ingredient.create!(name: "Eggs", calories: 90)
    @ingredient_2 = Ingredient.create!(name: "Tomatoes", calories: 50)
    @ingredient_3 = Ingredient.create!(name: "Onions", calories: 30)
    @ingredient_4 = Ingredient.create!(name: "Cheese", calories: 45)
    @ingredient_5 = Ingredient.create!(name: "Potatoes", calories: 100)

    @dish1_ingredient1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    @dish1_ingredient2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    @dish1_ingredient3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)

    @dish2_ingredient1 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_1.id)
    @dish2_ingredient4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
    @dish2_ingredient5 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_5.id)
  end

  it "I see the chef's name
      and a link to view a list of all ingredients that this chef uses in their dishes,
      When I click on that link, I'm taken to that chef's ingredient index page
      and I can see a unique list of names of all the ingredients that this chef uses" do
    visit chef_path(@chef)
    click_on "See #{@chef.name}'s Ingredients List"
    expect(current_path).to eq(chef_ingredients_path(@chef))
    expect(page).to have_content("#{@chef.name}'s Ingredients List")
    expect(page).to have_content(@ingredient_1.name, count: 1)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_4.name)
    expect(page).to have_content(@ingredient_5.name)
  end
end
