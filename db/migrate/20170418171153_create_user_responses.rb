class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
		t.references :user ,index:true,foreign_key:true
		t.references :question,index:true,foreign_key:true
		t.timestamps null: false
    end
  end
end
