class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def question
		@questions = Question.all
		@question = Question.find(params[:id])
	end

	def next

		question_id = params["question_id"].to_i
		user_answer_option=params["answer_option"]
	   	user_question_response = current_user.user_responses.find_by_question_id(question_id)

	   	if user_question_response
	   		user_question_response.update(:answer => user_answer_option)
	   	else
	   		current_user.user_responses.create(:question_id => question_id ,:answer => user_answer_option)
	   	end

	   	respond_to do |format|
	      	format.js{

	      	}	
    	end

	end


	def submit 
		@score=0
		user_all_responses=current_user.user_responses
		user_all_responses.each do |user_response|
			if user_response.answer == user_response.question.answer
				@score=@score+1
			end
		end

		@score = current_user.Score.create(:user_score => @score)

	end

	def start
		@questions = Question.all
	end

end
