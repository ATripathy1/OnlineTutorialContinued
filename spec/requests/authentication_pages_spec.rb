require 'spec_helper'

#Adding Authentication Test, generated after creation of my Sessions Controllers
describe "Authentication" do
	
	subject {page}
	
	#Simply Check for A Sign On Page with some content
	describe "Sign On Page" do
		before {visit signon_path}

		it {should have_content('Sign On')}
		it {should have_content('Sign On')}
	end

	#Check for A button Sign On and Check for Invalid Information Used
	describe "Sign On" do
    	
      before { visit signon_path }

    	describe "with invalid information" do
      		
          before { click_button "Sign On" }

      		it { should have_title('Sign On') }
      		it { should have_selector('div.alert.alert-error') }

    			describe "after visiting another page" do
    				before { click_link "Home" }
    				it { should_not have_selector('div.alert.alert-error') }
    			end
    	end
  end

	#Check For A Valid Information
	#factory girl failed tests on student registration wondering if it passes here
  describe "with valid information" do
    before { visit signon_path }
    let(:student) { FactoryGirl.create(:student) }
    before do
      #These fill_in names are extremely case sensitive
      fill_in "session[email]",    	   with: student.email.upcase
      fill_in "session[password]", 	   with: student.password
      click_button "Sign On"
    end

    it { should have_title(student.first_name) }
    #profile_link in your _header.html.erb
    it { should have_link('Profile',     href: student_path(student)) }
    #edit_link in your _header.html.erb
    it { should have_link('Settings',    href: edit_student_path(student)) }
    it { should have_link('Sign Off',    href: signoff_path) }
    it { should_not have_link('Sign On', href: signon_path) }

    describe "Sign Out Valid User" do
      before { click_link "Sign Off" }
      it { should have_link('Sign On') }
    end
  end
end
