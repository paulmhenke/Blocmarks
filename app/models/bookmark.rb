class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :creator, class_name: "User" #? would calling this user cause problem with like model?
  has_many :likes, dependent: :destroy
end
