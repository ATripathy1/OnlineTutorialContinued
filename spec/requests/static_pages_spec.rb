require 'spec_helper'

describe "StaticPages" do
	let(:substitute){"Online Tutorial"}
	subject { page }

	describe "Home page" do
	before { visit root_path }

	it { should have_content("Welcome To #{substitute}") }
	it { should have_title(full_title('')) }
	it { should_not have_title('| Home') }
	end


	describe "About page" do
	before { visit about_path }

	it { should have_content("In Detail!") }
	it { should_not have_title(full_title('| About Us')) }
	end

	describe "Contact page" do
	before { visit contact_path }

	it { should have_content("Contacting Us?") }
	it { should_not have_title(full_title('| Contact')) }
	end

	describe "Help page" do
	before { visit help_path }

	it { should have_content("Help Center") }
	it { should_not have_title(full_title('| Help')) }
	end

	describe "Programs" do
		
	before { visit programs_path }

	it { should have_content("All Programs") }
	it { should_not have_title(full_title('| Programs')) }
	end		

end


require 'spec_helper'

describe "Static pages" do

  
end