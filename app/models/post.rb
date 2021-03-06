class Post < ApplicationRecord
  include AlgoliaSearch

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :images, join_table: :posts_images
  has_and_belongs_to_many :foods, join_table: :posts_foods
  has_many :likes

  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  def like user
    likes.find_by user_id: user.id
  end

  algoliasearch do
    attribute :content, :restaurant, :address, :foods, :user
  end
end
