class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks.older
  end

  def show
    #@task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    #@task = current_user.tasks.find(params[:id])
  end

  def update
    # task = current_user.tasks.find(params[:id])
    @task.update!(task_params)
    redirect_to tasks_url, notice: "edit task #{@task.name}"
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to tasks_url, notice: "add task #{@task.name}"
    else
      render :new
    end
  end

  def destroy
    # task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "delete task #{@task.name}"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
