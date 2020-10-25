class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only:  [:show,:edit,:update,:destroy]
 
  
  
  def index
    @tasks = current_user.tasks
  end

  def show 
    current_user.tasks 
  end

  def new
    @task = Task.new 
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = "Task が追加されました"
      redirect_to @task
    else
      flash[:danger] = "Task が追加されません"
      render :new
    end
  end

  def edit
    current_user.tasks 
  end

  def update
    if @task.update(task_params) 
      flash[:success] = "タスクが編集されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクが編集されませんでした"
      render :new
    end
  end

  def destroy
    @task.destroy
    
    flash[:sucess] = "タスクが削除されました"
    redirect_to tasks_url 
  end
  
  private
  

  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end