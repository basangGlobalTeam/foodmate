class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  has_many :posts
  has_many :comments
  has_many :follows
  has_many :followers, class_name: Follow.name, foreign_key: :user_follow_id
end
