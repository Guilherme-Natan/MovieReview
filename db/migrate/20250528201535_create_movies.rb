class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :duration
      t.string :rating
      t.date :release_date
      t.decimal :total_gross

      t.timestamps
    end
  end
end
