class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :question_content ,null: false
    	t.string :option_a
    	t.string :option_b
    	t.string :option_c
    	t.string :option_d
    	t.string :answer, null: false
		t.timestamps null: false

    end
  end
end
