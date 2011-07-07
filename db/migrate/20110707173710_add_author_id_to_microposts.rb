class AddAuthorIdToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :author_id, :integer
  end

  def self.down
    remove_column :microposts, :author_id
  end
end
