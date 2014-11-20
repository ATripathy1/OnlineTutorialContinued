require 'spec_helper'

#student models
#change on branch
describe Student do
  before { 
  	@student = Student.new(first_name: "Aron", last_name:"flockhart", 
  	                       email: "aflockhart@acb.com", password:"xtreme", 
  	                       password_confirmation:"xtreme") 
  }

  subject { @student }

	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }
	
	#student should be authenticated on my system
	it { should respond_to(:authenticate)}

  #student name should not be empty
  it { should be_valid }

  describe "when student name is not present" do
    before { @student.first_name = " " }
    before { @student.last_name = " " }
    it { should_not be_valid }
  end

  	#student first and last name should have a maximum length on them
	describe "when name is too long" do
		before { @student.first_name = "a" * 51 }
		before { @student.last_name = "a" * 51 }
		it { should_not be_valid }
	end

	#student email addresss is downcased in this test
	describe "email address with mixed case" do
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

		it "should be saved as all lower-case" do
		  @student.email = mixed_case_email
		  @student.save
		  expect(@student.reload.email).to eq mixed_case_email.downcase
		end
	end

	#student email address is invalid format
	describe "when email format is invalid" do
		it "should be invalid" do
		  addresses = %w[student@wherever,com student.org example.user@wherever.
		                 student@bar_baz.com student@bar+baz.com]
		  addresses.each do |invalid_address|
		    @student.email = invalid_address
		    expect(@student).not_to be_valid
		  end
		end
	end

	#student email address is valid format
	describe "when email format is valid" do
		it "should be valid" do
		  addresses = %w[student@wherever.COM A_US-ER@f.b.org frst.lst@wherever.jp a+b@baz.cn]
		  addresses.each do |valid_address|
		    @student.email = valid_address
		    expect(@student).to be_valid
		  end
		end
	end

	#student email already used as for registration
	describe "when email address is already used for registration" do
    before do
      student_with_same_email = @student.dup
      student_with_same_email.save
    end

    it { should_not be_valid }
  end




  #Password field is left empty
	describe "when password is not present" do
	  before do
	    @student = Student.new(first_name: "First", last_name:"Last",email: "user@example.com",
	                     password: " ", password_confirmation: " ")
	  end
	  it { should_not be_valid }
	end

  #Password check check!
	describe "when password doesn't match confirmation" do
	before { @student.password_confirmation = "mismatch" }
	it { should_not be_valid }
	end

	#Student Authentication
	describe "with a password that's too short" do
	  before { @student.password = @student.password_confirmation = "a" * 5 }
	  it { should be_invalid }
	end

	describe "return value of authenticate method" do
	  before { @student.save }
	  let(:found_student) { Student.find_by(email: @student.email) }

	  describe "with valid password" do
	    it { should eq found_student.authenticate(@student.password) }
	  end

	  describe "with invalid password" do
	    let(:student_for_invalid_password) { found_student.authenticate("invalid") }

	    it { should_not eq student_for_invalid_password }
	    specify { expect(student_for_invalid_password).to be_false }
	  end
	end

    #remember my token for authentication session
    describe "remember token" do
		before { @student.save }
		its(:remember_token) { should_not be_blank }
	end

end
