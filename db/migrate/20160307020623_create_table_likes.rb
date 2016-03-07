class CreateTableLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :movie
      t.timestamps
    end
  end
end
