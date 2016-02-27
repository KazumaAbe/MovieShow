class UserController < ApplicationController

  before_action :find_user, only: [:show]

  def show
    @movies = current_user.movies.order(created_at: :DESC)
  end

private

  def find_user
    @user = User.find(params[:id])
  end

end
