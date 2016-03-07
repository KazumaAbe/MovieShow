class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie, counter_cache: true

  def like_exists(a_movie_id, a_user_id)
    if user_signed_in?
      self.exists?(movie_id: a_movie_id, user_id: a_user_id)
    else
      return false
    end
  end

end
