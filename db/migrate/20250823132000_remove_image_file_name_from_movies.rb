class RemoveImageFileNameFromMovies < ActiveRecord::Migration[7.2]
  def change
    remove_column :movies, :image_file_name, :string
  end
end
