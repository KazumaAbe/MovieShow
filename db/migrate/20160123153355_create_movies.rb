class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|

      t.string  :title
      t.string  :copy
      t.text    :concept
      t.integer :user_id

      t.timestamps
    end
  end
end
