class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render :index
  end

  def show
    @task = Task.find(params[:id])
    render :show
  end

  def create
    @task = Task.create!(task_params)
    render :show
  end

  def update
    @task = Task.find(params[:id])
    @task.update!(task_params)
    render :show
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.permit(:title, :due_at, :category, :auto_remind, :user_id)
  end
end
