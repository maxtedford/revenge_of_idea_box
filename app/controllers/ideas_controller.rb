class IdeasController < ApplicationController
  before_action :all_ideas, only: [:index, :create]
  respond_to :html, :js
  
  def index
    @idea = Idea.new
  end
  
  def create
    idea = Idea.new(idea_params)
    if idea.save
      flash[:notice] = "idea created!"
    else
      flash[:error] = errors.full_messages.join(", ")
    end
  end
  
  private
  
  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end
  
  def all_ideas
    @ideas = Idea.all
  end
end
