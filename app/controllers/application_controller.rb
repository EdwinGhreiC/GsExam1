class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_student

  def current_student
  	@current_student ||= session[:student_name] if session[:student_name]
  end

  def require_student
  	redirect_to '/login' unless current_student
  end

end
