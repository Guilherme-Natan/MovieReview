class AddDescriptionToMovies < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :description, :text
  end
end
