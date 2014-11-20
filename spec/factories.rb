FactoryGirl.define do
  factory :student do
    first_name     			"Aron"
    last_name				"Flockhart"
    email    				"aflockhart@example.com"
    password 				"xtreme"
    password_confirmation 	"xtreme"
  end

  factory :program do
  	program_name			"Project Management"
  	program_description		"Description of the Program"
  	course_id				2
  end

  factory :program2 do
    program_name      "Project Management"
    program_description   "Description of the Program"
    course_id       3
  end

  factory :course do
  	course_name				"Introduction to Project Management"
  	course_description		"An Introductory Course that gives students a preliminary background on basic principles of PM."
  	program
  end
end