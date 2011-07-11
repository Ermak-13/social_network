class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.references :user
      t.string :video_content_type
      t.string :video_file_name
      t.integer :video_file_size
      t.string :state
      
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
