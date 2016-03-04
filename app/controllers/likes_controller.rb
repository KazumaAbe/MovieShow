class LikesController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    Like.create(like_params)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    like = Like.find_by(user_id: current_user.id, movie_id: params[:id])
    like.destroy if like.user_id == current_user.id
  end

  private
  def like_params
    params.permit(:movie_id).merge(user_id: current_user.id)
  end

end
