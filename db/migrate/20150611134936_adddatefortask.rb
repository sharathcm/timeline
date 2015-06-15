class Adddatefortask < ActiveRecord::Migration
  def change
  	add_column :tasks, :task_date, :date
  end
end
