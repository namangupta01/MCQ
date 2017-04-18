class AddAnswerToUserResponses < ActiveRecord::Migration
  def change
  	add_column :user_responses , :answer , :string
  end
end
