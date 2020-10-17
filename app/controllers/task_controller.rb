class TaskController < ApplicationController
  def index
    @tasks = Task.order(id: :desc).page(params[:page]).per(25)
  end

  def show
  end

  def new
  end

  def create
  end
end
