class AddPhotoToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :photo, :string
  end
end
