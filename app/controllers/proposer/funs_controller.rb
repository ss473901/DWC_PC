class Proposer::FunsController < ApplicationController
  def create
    fun = Fun.new(fun_params)
    fun.proposer_id = current_proposer.id
    fun.save!
    redirect_back(fallback_location: root_path)
  end

  def edit
    @fun = Fun.find(params[:id])
  end

  def update
    fun = Fun.find(params[:id])
    fun.update(fun_params)
    redirect_to  proposer_ideas_path(fun)
  end

  def destroy
    fun = Fun.find(params[:id])
    fun.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def fun_params
      params.require(:fun).permit(:content)
    end
end
