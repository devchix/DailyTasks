class ChangeCompleteFieldToConventionHistory < ActiveRecord::Migration
  def self.up
    rename_column :task_histories, :completionDate, :completed_on
  end

  def self.down
    rename_column :task_histories, :completed_on, :completionDate
  end
end
