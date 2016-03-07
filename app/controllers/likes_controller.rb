class LikesController < ApplicationController

  before_action :find_movie, only: [:create, :destroy]

  def create
    Like.create(like_params)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, movie_id: params[:id])
    like.destroy if like.user_id == current_user.id
  end

  private
  def like_params
    params.permit(:movie_id).merge(user_id: current_user.id)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

end
