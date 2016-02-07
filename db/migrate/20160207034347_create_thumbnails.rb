class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|

      t.string  :title
      t.integer :movie_id
      t.integer :status, null: false

      t.timestamps
    end

    add_index :thumbnails, :status

  end
end
