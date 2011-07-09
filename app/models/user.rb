class User < ActiveRecord::Base
  has_one :profile
  has_many :photos
  has_many :microposts
  has_many :friendships
  has_many :friends, :through => :friendships, :foreign_key => "friend_id"
  
  before_create :create_profile
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :banned, :profile_attributes
  accepts_nested_attributes_for :profile
  
  scope :with_microposts, includes(:microposts)
  scope :with_profile, includes(:profile)
  
  delegate :full_name, :to => :profile
  
  def ban!
    self.update_attributes(:banned => true)
  end
  
  def unban!
    self.update_attributes(:banned => false)
  end
end
