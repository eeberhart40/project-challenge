class Dog < ApplicationRecord
  has_many_attached :images

  has_many :likes, dependent: :destroy

  belongs_to :owner,
  class_name: :User,
  foreign_key: :user_id

end
