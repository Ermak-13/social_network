class AddSenderToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :sender_id, :integer
  end

  def self.down
    remove_column :microposts, :sender_id
  end
end
