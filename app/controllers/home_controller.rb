class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		byebug
	end

	def next
		question_id=Question.find_by_id(params["question_id"].to_i)
		user_response=UserResponse.create(question_id: question_id,user_id: current_user.id)
		redirect_to '/'
	end
end
