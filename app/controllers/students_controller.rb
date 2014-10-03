class StudentsController < ApplicationController
	def show
		@student = Student.find(params[:id])
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			sign_on @student
			flash[:success] = "Welcome to the Online E Tutorial!"
      		redirect_to @student
		else
			# undo this comment to see errors within your student model structure
			# puts @student.errors.inspect
			render 'new'
		end
	end

	def new
		@student = Student.new
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])

		if @student.update_attributes(student_params)
			#Add Successful update code here
			flash[:success] = "Your Profile Has Been Updated"
            redirect_to @student
		else
			render 'edit'
		end
	end


private
	def student_params
      params.require(:student).permit(	:first_name, 
      									:last_name, 
      									:email, 
      									:password,
                                   		:password_confirmation)
    end
end
