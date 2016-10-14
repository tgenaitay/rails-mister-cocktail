class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  before_validation :update_description



  private

  def update_description
      url = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{self.name}"
      result = JSON.parse(open(url).read)
      data = result.first[1][0]['strInstructions']
      self.description = data
  end


end
