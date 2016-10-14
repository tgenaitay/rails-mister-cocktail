class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
