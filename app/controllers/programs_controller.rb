class ProgramsController < ApplicationController
  def index
  	#Show me all programs
  	@programs = Program.all
  	#try to find out how many data sets quickly
  	#puts @programs.count
  end
end
