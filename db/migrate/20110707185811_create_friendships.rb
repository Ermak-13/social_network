class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
    add_index :friendships, :user_id 
    add_index :friendships, :friend_id
  end

  def self.down
    remove_index :friendships, :user_id
    remove_index :friendships, :friend_id
    drop_table :friendships
  end
end
