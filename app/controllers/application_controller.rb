class ApplicationController < ActionController::Base
  protect_from_forgery

  
  before_filter :check_session
  
  def check_session
    
      #puts controller_name
      #puts action_name
      
      #puts !logged_in? && controller_name.eql?("sessions") && action_name.eql?("new")
      if !logged_in? && !controller_name.eql?("sessions") && !action_name.eql?("new")  
        puts controller_name.eql?("sessions")
        puts action_name.eql?("new")
        redirect_to :controller => "sessions", :action => "new"
      end 

  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !! session[:user_id]  
  end
  
  helper_method :current_user, :logged_in?, :check_user
end
