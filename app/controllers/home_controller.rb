class HomeController < ApplicationController
	before_action :authenticate_user!
	before_action :test_completed? , except: [:submit]

	def index
	end

	def question
		@questions = Question.all
		@question = Question.find(params[:id])
		total_questions=@questions.length
		answered=current_user.user_responses.all.length
		@percentage=answered*100/total_questions
	end

	def submit_question
		question_id = params["question_id"].to_i
		user_answer_option=params["answer_option"]
	   	user_question_response = current_user.user_responses.find_by_question_id(question_id)

	   	if user_question_response
	   		user_question_response.update(:answer => user_answer_option)
	   	else
	   		current_user.user_responses.create(:question_id => question_id ,:answer => user_answer_option)	
    	end
	end

	def next_question
		question_id=params["question_id"].to_i
		@question=Question.where('id > ?',question_id).first
		# data=Hash.new
		# data["question"]=question
		# render json: data
	end

	def previous_question
		question_id=params["question_id"].to_i
		@question=Question.where('id < ?',question_id).last
				# data=Hash.new
		# data["question"]=question
		# render json: data
	end

	def test_completed?
		score = Score.find_by_user_id(current_user.id)
		if score
			return redirect_to '/submit'	
		end
	end


	def submit
		@score=0
		score = Score.find_by_user_id(current_user.id)
		if score
			@score = score	
		else
			user_all_responses=current_user.user_responses
			user_all_responses.each do |user_response|
				if user_response.answer == user_response.question.answer
					@score=@score+1
				end
			end

		@score = Score.create(:user_id => current_user.id, :user_score => @score)

		end
		
	end

	def start
		return redirect_to "/question/#{Question.first.id}"
	end
end
