class IdeasController < ApplicationController
  respond_to :json
  
  def index
    @ideas = Idea.order(updated_at: :desc)
  end
  
  def create
    @idea = Idea.create(title: params[:title], body: params[:body])
    respond_with @idea
  end
  
  def edit
    @idea = Idea.find(params[:id])
  end
  
  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)
    redirect_to root_path
  end
  
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    respond_with ""
  end
  
  def increasequal
    @idea = Idea.find(params[:id])
    @idea.update_attributes(quality: @idea.increase_quality)
    respond_with @idea
  end
  
  def decreasequal
    @idea = Idea.find(params[:id])
    @idea.update_attributes(quality: @idea.decrease_quality)
    respond_with @idea
  end
  
  private
  
  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
