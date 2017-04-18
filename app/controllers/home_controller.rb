class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		byebug
	end

	def next
		question_id=params["question_id"].to_i
		question=Question.find_by_id(question_id)
		user_answer_option=params["answer_option"]
		user_question_response=UserResponse.where(user_id: current_user.id,question_id: question_id).first
		if user_question_response
			unless user_answer_option != user_question_response.answer
				if	user_answer_option == question.answer
					score=Score.where(user_id: current_user.id).first
					if score
						score.user_score = score.user_score + 1
					else
						score = Score.create(user_id: current_user.id , user_score: 1)
					end
				end	
			end
		else
			user_question_response=UserResponse.create(question_id: question_id, user_id: current_user.id, answer: user_answer_option)
			if user_answer_option == question.answer
				score=Score.where(user_id: current_user.id).first
				if score
					score.user_score = score.user_score + 1
				else
					score = Score.create(user_id: current_user.id , user_score: 1)
				end
		end
		user_response=UserResponse.create(question_id: question_id,user_id: current_user.id)
		redirect_to '/'
	end
end
