class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :creator, class_name: "User" 
  has_many :likes, dependent: :destroy
end
