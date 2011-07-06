class User < ActiveRecord::Base
  has_one :profile
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :banned, :first_name, :last_name,
                  :age, :sex, :country, :city, :phone, :university, :school
  
  def ban!
    self.update_attributes(:banned => true)
  end
  
  def unban!
    self.update_attributes(:banned => false)
  end
end
