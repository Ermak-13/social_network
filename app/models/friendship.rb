class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  
  validates_uniqueness_of :user_id, :scope => [:friend_id]
  validates_presence_of :user_id, :friend_id
  
  after_create do |friendship|
    Friendship.create(:user_id => friendship.friend_id, 
                      :friend_id => friendship.user_id)
  end
  
  after_destroy do |friendship|
    Friendship.find_by_user_id_and_friend_id(friendship.user_id, friendship.friend_id).try(:destroy)
  end
end
