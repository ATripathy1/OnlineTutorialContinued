class Course < ActiveRecord::Base
	belongs_to :program
	validates :program_id, presence:true
end
