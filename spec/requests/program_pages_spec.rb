require 'spec_helper'

describe "Program Pages" do
  
	subject {page}

	describe "Show All Programs Pages" do

		before { visit programs_path}
		
		it { should have_content {' All Programs'}}
		it { should_not have_title(full_title('| Programs')) }

		#background do
		#	3.times do |n|  
		#		Program.new(program_name: "Program Name #{n}")
		#	end
		#end
		#it { should have_content(program.program_name)}
	end

	describe "check for programs" do
    let!(:program) { FactoryGirl.create(:program) }
    let!(:program2) { FactoryGirl.create(:program) }
    
  
    before { visit programs_path}

    describe "programs" do
	  	it { should have_content(program.program_name) }
	  	it { should have_content(program.program_description) }
	  	it { should have_content(program2.program_name) }
	  	it { should have_content(program2.program_description) }
  	end

	end
end

#feature "Should show me a list of programs" do
	
#	background do
#		3.times do |n|  
#			Program.new(program_name: "Program Name #{n}", program_description:"Project Description")
#		end
#	end
	#let(:program){FactoryGirl.create(:program)}
#	scenario "Do something here" do
#		visit programs_path
#		expect(current_path).to eq programs_path
#		expect(page).to have_content "Program Name 1"
#		expect(page).to have_content 'Program Name 2'
#		expect(page).to have_content 'Program Name 3'
#	end
#end
