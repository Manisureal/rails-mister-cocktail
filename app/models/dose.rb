class Dose < ApplicationRecord
  #associations
  belongs_to :ingredient
  belongs_to :cocktail
  #validations
  validates :description, presence: :true
  validates :ingredient, uniqueness: { scope: :cocktail }

end
