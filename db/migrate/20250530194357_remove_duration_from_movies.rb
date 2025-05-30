class RemoveDurationFromMovies < ActiveRecord::Migration[7.2]
  def change
    remove_column :movies, :duration, :integer
  end
end
