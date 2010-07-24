class CreateWhitelist < ActiveRecord::Migration
  def self.up
     create_table :whitelist_entries do |t|
        t.string :email
      
      end
  end

  def self.down
    drop_table :whitelist_entries
  end
end
