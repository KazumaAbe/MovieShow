class RemoveCommentsCountFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :comments_count, :integer
  end
end
