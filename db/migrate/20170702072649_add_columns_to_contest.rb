class AddColumnsToContest < ActiveRecord::Migration
  def change
  	add_column :contests , :name , :string
  	add_reference :contests, :user , index:true
  	add_column :contests,:detail,:string
  	add_column :contests,:start_date,:string
  	add_column :contests,:end_date,:string
  end
end
