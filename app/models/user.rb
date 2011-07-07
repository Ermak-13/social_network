class User < ActiveRecord::Base
  before_save :initialize_product
  has_one :profile
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :banned

  def ban!
    self.update_attributes(:banned => true)
  end
  
  def unban!
    self.update_attributes(:banned => false)
  end
  
  private
    def initialize_product
      self.profile ||= Profile.create
    end
end
