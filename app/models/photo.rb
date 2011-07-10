class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :small => "140x140>" }
end
