class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.page(params[:page])
  end

  def show
  end

  def new
    @tasks = Tasks.new
  end

  def create
    @tasks = Tasks.new(tasks_params)

    if @tasks.save
      flash[:success] = 'Tasks が正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Tasks が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @tasks.update(tasks_params)
      flash[:success] = 'Tasks は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Tasks は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasks.destroy

    flash[:success] = 'Tasks は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_tasks
    @tasks = Tasks.find(params[:id])
  end

  def tasks_params
    params.require(:tasks).permit(:content, :status)
  end
end