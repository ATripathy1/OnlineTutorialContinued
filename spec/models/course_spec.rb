require 'spec_helper'

describe Course do
  #Add a course factory for self
  let(:course) {FactoryGirl.create(:course)}
  let(:program) {FactoryGirl.create(:program)}

  before do
  	@course =  program.courses.build(course_name:course.course_name, course_description:course.course_description )
  	# This was used for first tests
  	#Course.new(	course_name:course.course_name, course_description:course.course_description, program_id:program.program_id)
  end

  subject { @course }

  it {should respond_to(:course_name)}
  it {should respond_to(:course_description)}
  it {should respond_to(:program_id)}

  #show which program do I belong to
  it {should respond_to(:program)}

  its (:program) { should eq program}

  it {should be_valid}

  #First Add Test to show that there is no program_id associated since a course has to be offered on a program
  describe "When a program_id is not present" do
	 
	  before {@course.program_id = nil}

	  it {should_not be_valid}

  end
end
