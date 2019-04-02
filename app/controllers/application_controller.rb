class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
 def require_task_logged_in
    unless logged_in?
      redirect_to login_url
    end
 end
  
 def counts(task)
    @count_microposts = user.microposts.count
 end
end