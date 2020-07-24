class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    all_ingredients = dishes.select('dishes.*, ingredients.*').joins(:ingredients)
    unique_ingredients = all_ingredients.pluck(:name).uniq
  end
end
