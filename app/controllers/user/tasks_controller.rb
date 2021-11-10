class User::TasksController < ApplicationController

  def new
    @task = Task.new
    @tasks = Task.all
  end

  def create
    task = Task.new(task_params)
    task.user_id = current_user.id
    task.save
    redirect_back(fallback_location: root_path)
  end

  private
  def task_params
    params.require(:task).permit(:content, :is_done)
  end
end
