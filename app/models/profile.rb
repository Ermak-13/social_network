class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "140x140>" }

  def full_name
    "#{first_name} #{last_name}" 
  end
end
