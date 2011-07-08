class AddStatusToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :status, :string
  end

  def self.down
    remove_column :profiles, :status
  end
end
