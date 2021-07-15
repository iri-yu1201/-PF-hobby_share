# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
  has_many :items, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :following_follows, foreign_key: "follower_id", class_name: "Follow", dependent: :destroy
  has_many :followings, through: :following_follows
  has_many :follower_follows, foreign_key: "following_id", class_name: "Follow", dependent: :destroy
  has_many :followers, through: :follower_follows

  def already_favo?(item)
    self.favorites.exists?(item_id: item.id)
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def follow(other_user)
    self.following_follows.create(following_id: other_user.id)
  end
  
  def unfollow(other_user)
    self.following_follows.find_by(following_id: other_user.id).destroy
  end

end
