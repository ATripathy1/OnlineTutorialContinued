require 'spec_helper'

describe "StaticPages" do
	let(:base_title){"Online Tutorial"}
	describe "Home Page" do
		it "should have the content 'Welcome To Online Tutorial'" do
			# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/home'
			expect(page).to have_content('Welcome To Online Tutorial')
		end
	end
	describe "About" do
		it "should have the content 'A Little Something About Online Tutorial'" do
			# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/about'
			expect(page).to have_content("A Little Something About #{base_title}")
		end
	end

		describe "Contact" do
		it "should have the content 'This Where to Contact Online Tutorial'" do
			# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/contact'
			expect(page).to have_content("This Where to Contact #{base_title}")
		end
	end

		describe "Help" do
		it "should have the content 'Welcome To Online Tutorial Help Center'" do
			# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/help'
			expect(page).to have_content("Welcome To #{base_title} Help Center")
		end
	end

	describe "Programs" do
		it "should have the content 'Online Tutorial Programs'" do
			# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			visit '/static_pages/programs'
			expect(page).to have_content("#{base_title} Programs")
		end
	end
end
