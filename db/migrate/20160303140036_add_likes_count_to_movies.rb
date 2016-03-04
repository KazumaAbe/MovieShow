class AddLikesCountToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :likes_count, :integer
  end
end
