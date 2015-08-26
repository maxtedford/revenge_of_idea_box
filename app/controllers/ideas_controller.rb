class IdeasController < ApplicationController
  respond_to :json
  
  def index
    @ideas = Idea.all
  end
  
  def create
    @idea = Idea.create(title: params[:title], body: params[:body])
    respond_with @idea, status: 201
  end
  
  private
  
  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
