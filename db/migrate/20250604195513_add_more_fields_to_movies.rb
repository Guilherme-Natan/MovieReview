class AddMoreFieldsToMovies < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :director, :string
    add_column :movies, :duration, :integer
    add_column :movies, :image_file_name, :string, default: "placeholder.png"
  end
end
