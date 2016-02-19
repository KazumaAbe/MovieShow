class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @movies = current_user.movies.order(created_at: :DESC)
  end

end
