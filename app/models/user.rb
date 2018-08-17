class User < ApplicationRecord
  enum sex: [:female, :male]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :name, presence: true
         validates :sex, presence: true
         validates :date_of_birth, presence: true         
  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader

  has_many :posts
  has_many :comments
  has_many :follows
  has_many :followers, class_name: Follow.name, foreign_key: :user_follow_id
  has_many :images
  has_many :likes

  def like? post
    like = likes.find_by post_id: post.id
    like.present?
  end

  def following? user
    user = follows.find_by user_follow_id: user.id
    user.present?
  end

  def follow user
    follows.find_by user_follow_id: user.id
  end

  def newfeeds
    f_ids = follows.pluck :user_follow_id
    Post.where("user_id IN (?) OR user_id = ?", f_ids, id).order(id: :desc)
  end
end
