class AddScoresToScores < ActiveRecord::Migration
  def change
  	add_column :scores , :user_score , :integer
  end
end
