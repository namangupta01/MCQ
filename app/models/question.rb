class Question < ActiveRecord::Base
	has_many :user_responses
	belongs_to :contest
	belongs_to :user through: :contest
end
