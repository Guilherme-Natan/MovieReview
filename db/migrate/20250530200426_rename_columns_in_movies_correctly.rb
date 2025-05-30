class RenameColumnsInMoviesCorrectly < ActiveRecord::Migration[7.2]
  def up
    rename_column :movies, :name, :title
    rename_column :movies, :release_date, :released_on
  end

  def down
    rename_column :movies, :title, :name
    rename_column :movies, :released_on, :release_date
  end
end
