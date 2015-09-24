class SessionsController < ApplicationController

	def new
	end

	def create
		@student = Student.find_by_name(params[:session][:name])
		if @student && @student.authenticate(params[:session][:password])
			session[:student_id] = @student.id
			session[:student_name] = @student.name
			redirect_to '/exam'
		else
			redirect_to '/login'
		end
	end

	def destroy
		session[:student_id] = nil
		session[:student_name] = nil
		redirect_to '/login'
	end
end
