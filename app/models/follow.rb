class Follow < ApplicationRecord
  belongs_to :user, foreign_key: :user_follow_id
  belongs_to :follower, foreign_key: :user_id, class_name: User.name
end
