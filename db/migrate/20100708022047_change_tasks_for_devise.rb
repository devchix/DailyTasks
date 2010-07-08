class ChangeTasksForDevise < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t| 
      t.remove :user_id
      t.string :user_email  
    end
  end

  def self.down
    change_table :tasks do |t| 
      t.remove :user_email
      t.integer :user_id
    end
  end
end
