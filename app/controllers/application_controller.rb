class ApplicationController < ActionController::Base
  protect_from_forgery

  
  before_filter :check_session
  
  def check_session
      #puts !logged_in? && controller_name.eql?("sessions") && action_name.eql?("new")
      if not controller_name.eql?("users") && action_name.eql?("create") 
       if !logged_in? && !controller_name.eql?("sessions") && !action_name.eql?("new")  
        redirect_to :controller => "sessions", :action => "new"
       end 
      end 
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !! session[:user_id]  
  end
  
  helper_method :current_user, :logged_in?
end
