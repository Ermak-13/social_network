class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "200x200>", :small => "100x100>" }

  def full_name
    "#{first_name} #{last_name}" 
  end
end
