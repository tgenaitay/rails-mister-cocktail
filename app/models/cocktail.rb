class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  after_create :update_description



  private

  def update_description
      url = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{self.name}"
      result = JSON.parse(open(url).read)
      self.update(description: result.first[1][0]['strInstructions'])
  end


end
