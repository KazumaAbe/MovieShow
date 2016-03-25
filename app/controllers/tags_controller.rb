class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @moveis = Movie.tagged_with(@tag.name).page(params[:page])
    render 'movie/index'
  end

end
