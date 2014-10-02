class SessionsController < ApplicationController
	def new
	end

	def create
		student = Student.find_by(email:params[:session][:email].downcase)
		if student && student.authenticate(params[:session][:password])
			sign_on student
			redirect_to student
		else
			#allowing errors to pass
			flash.now[:error] = 'Invalid email/password combination' 
			render 'new'
		end	
	end

  def destroy
    sign_off
    redirect_to root_url
  end
end
