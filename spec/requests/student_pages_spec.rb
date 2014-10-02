require 'spec_helper'

describe "Student Pages" do
	subject { page }

	#tests for student description page
	describe "student profile page" do
		let(:student) { FactoryGirl.create(:student) }
		
		before { visit student_path(student) }

		it { should have_content(student.first_name) }
		it { should have_content(student.last_name) }
		it { should have_content(student.email) }
		it { should have_title(student.first_name) }
	end

	#tests for register page
	describe "register page" do
	  before { visit register_path }

	  it { should have_content('Register') }
	  it { should have_field ('student_first_name')}
	  it { should_not have_title(full_title('| Register')) }
	end

	#tests for actual registration of students process (testing behavior)
	describe "register" do
		before { visit register_path }

		let(:submit){"Create Student Account"}

		#Student Should not be created
		describe "Register with Invalid information" do
			it "Should Not Be Created" do
				expect {click_button submit}.not_to change(Student, :count).by(1)
			end
		end

		#Student Should Get Create With Valid Information
		describe "Register with Valid Information" do
			let(:student) { FactoryGirl.create(:student) }
			before do
				fill_in "student[first_name]",				with:"Aron"
				fill_in "student[last_name]",				with:"Flockhart"
				fill_in "student[email]",					with:"aflockhart@host.com"
				fill_in "student[password]",				with:"extreme"
				fill_in "student[password_confirmation]",	with:"extreme"
			end

			it "Should Create A student" do
				expect {click_button submit}.to change(Student, :count).by(1)
			end

			describe "Student Saved" do
				before { click_button submit }
				let(:student) { Student.find_by(email: 'aflockhart@host.com') }

				it { should have_link('Sign Off') }
				it { should have_title(student.first_name) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
			end

		end
	end
end
