class Contest < ActiveRecord::Base
	has_many :questions
	belongs_to :user
end
