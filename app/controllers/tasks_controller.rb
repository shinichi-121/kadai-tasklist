class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show 
    set_task 
  end

  def new
    @task = Task.new 
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = "Task が投稿されました"
      redirect_to @task
    else
      flash[:danger] = "Task が投稿されません"
      render :new
    end
  end

  def edit
    set_task
  end

  def update
     set_task 
     
    if @task.update(task_params)
      flash[:success] = "タスクが編集されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクが編集されませんでした"
      render :new
    end
  end

  def destroy
    set_task
    @task.destroy
    
    flash[:sucess] = "タスクが削除されました"
    redirect_to tasks_url 
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end 

  def task_params
    params.require(:task).permit(:content)
  end
  
end








  

