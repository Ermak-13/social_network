class Profile < ActiveRecord::Base
  belongs_to :user
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :first_name, :last_name, :date_of_birthday, :sex, :country, :city, :phone
end
