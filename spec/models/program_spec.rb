require 'spec_helper'


#Program Model
# Will be adding more this model to make sure I understand how rspec and cucumber work
# Adding more of this line to make sure my changes on master works. Test
describe Program do
  #Add a factory for programs
  let(:program) {FactoryGirl.create(:program)}

  before do
  	@program = Program.new(program_name:program.program_name, 
  		                   program_description:program.program_description, 
  		                   course_id:program.course_id)
  end

  subject {@program}

  it {should respond_to(:program_name)}
  it {should respond_to(:program_description)}
  it {should respond_to(:course_id)}
  it { should respond_to(:courses)}
end
