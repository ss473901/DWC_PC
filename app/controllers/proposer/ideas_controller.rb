class Proposer::IdeasController < ApplicationController

  def new
    @idea = Idea.new
    @fun = Fun.new
    @ideas = Idea.all
    @funs = Fun.all
  end

  def create
    idea = Idea.new(idea_params)
    idea.proposer_id = current_proposer.id
    idea.save!
    redirect_back(fallback_location: root_path)
  end

  def index
    @ideas = Idea.all
    @funs = Fun.all
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    idea = Idea.find(params[:id])
    idea.update(idea_params)
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def idea_params
      params.require(:idea).permit(:content)
    end
end
