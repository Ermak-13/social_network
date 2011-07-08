class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => "User"
  
  validates_presence_of :user_id, :sender_id
  
  attr_accessible :content
end
