class User::TasksController < ApplicationController

  def new
    @task = Task.new
    @tasks = Task.all
    @ideas = Idea.all
  end

  def create
    task = Task.new(task_params)
    task.user_id = current_user.id
    task.save!
    redirect_back(fallback_location: root_path)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to new_user_task_path(task)
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_back(fallback_location: root_path)
  end

  def toggle
    head :no_content
    @task = Task.find(params[:id])
    @task.is_done = !@task.is_done
    @task.save
  end


  private
  def task_params
    params.require(:task).permit(:content)
  end
end
