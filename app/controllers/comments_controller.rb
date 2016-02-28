class CommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:comment][:movie_id])

    @comment = Comment.create(comment_params) ?
    (redirect_to movie_path(@movie)) :
    (redirect_to :back)
  end

  private
  def comment_params
    params.require(:comment).permit(:movie_id, :text).merge(user_id: current_user.id)
  end
end
