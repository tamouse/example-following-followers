class User < ActiveRecord::Base
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships

  def follow(other)
    active_relationships.create(followed: other)
  end

  def unfollow(other)
    active_relationships.find_by(followed: other).destroy
  end
end
