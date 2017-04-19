class Question < ActiveRecord::Base
	has_many :user_responses
end
