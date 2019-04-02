class TasksController < ApplicationController
  before_action :require_task_logged_in, only: [:index, :show]

  def index
    @tasks = Task.all.page(params[:page])
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
     if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @task
      email = params[:session][:email].downcase
      password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end 
     end
  end

  def edit
    set_task
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    session[:task_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
    
    flash[:success] = 'Task は正常に削除されました'
    redirect_to task_url
  end
  
  private
  
  def login(email, password)
   @user = User.find_by(email: email)
   if @user && @user.authenticate(password)
     # ログイン成功
     session[:user_id] = @user.id
     return true
   else
     # ログイン失敗
     return false
   end
 
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status, :name, :email, :password, :password_confirmation)
  end
  end 
end