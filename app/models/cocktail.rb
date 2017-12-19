class Cocktail < ApplicationRecord
  #associations
  has_many :doses, dependent: :destroy
  # has_many :ingredients
  has_many :ingredients, through: :doses
  #validations
  validates :name, presence: :true, uniqueness: :true
  #enable photo uploader
  mount_uploader :photo, PhotoUploader
end
