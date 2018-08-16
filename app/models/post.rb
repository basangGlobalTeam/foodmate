class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :images, join_table: :posts_images
  has_and_belongs_to_many :foods

  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
end
