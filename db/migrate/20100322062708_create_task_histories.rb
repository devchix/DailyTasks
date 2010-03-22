class CreateTaskHistories < ActiveRecord::Migration
  def self.up
    create_table :task_histories do |t|
      t.date :completionDate
      t.integer :task_id

      t.timestamps
    end
  end

  def self.down
    drop_table :task_histories
  end
end
