require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "methods" do
    it ".total_cals" do
      ingredient_1 = Ingredient.create!(name: "Eggs", calories: 90)
      ingredient_2 = Ingredient.create!(name: "Tomatoes", calories: 50)
      ingredient_3 = Ingredient.create!(name: "Onions", calories: 30)

      expect(Ingredient.total_cals).to eq(170)
    end
  end
end
