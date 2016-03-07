class CreateTableLikes < ActiveRecord::Migration
  def change
    create_table :table_likes do |t|
      t.references :user
      t.references :movie
      t.timestamps
    end
  end
end
