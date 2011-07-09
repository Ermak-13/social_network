class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, :class_name => "User"
  
  validates_presence_of :user_id, :sender_id
  
  delegate :full_name, :to => :sender, :prefix => true
  
  scope :ordered, order("microposts.id DESC")
  default_scope ordered
end
