class AddLastCompletedOnToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :last_completed_on, :date
  end

  def self.down
    remove_column :tasks, :last_completed_on
  end
end
