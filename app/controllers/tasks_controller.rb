class TasksController < ApplicationController
  
  def index
    @tasks = Tasks.all
  end 
  
  def show
    set_tasks
  end 
  
  def new 
    @tasks = Tasks.new
  end 
  
  def create
    @tasks = Tasks.new(tasks_params)
    
    if @tasks.save
      flash[:success] = 'Tasks が正常に登録されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Tasks が登録されませんでした'
      render:new
    end
  end
  
  def edit
    set_tasks
  end 
  
  def update
    set_tasks
    if @tasks.update(tasks_params)
      flash[:success] = 'Tasks は更新できました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Tasks は更新できませんでした'
      render:edit
    end
  end 
  
  def destroy
    set_tasks
    @task.destroy
    
    flash[:success] ='Tasks は削除しました'
    redirect_to tasks_url
  end 

  
  private
  #Strong Parameter
  
  def set_tasks
    @tasks = Tasks.find(params[:id])
  end 
  def tasks_params
    params.require(:tasks).permit(:content)
  end  
end 