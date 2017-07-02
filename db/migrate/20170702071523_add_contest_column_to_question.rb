class AddContestColumnToQuestion < ActiveRecord::Migration
  def change
  	add_reference :questions,:contest,index: true
  end
end
