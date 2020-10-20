class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :opinions, foreign_key: :author_id, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :followings, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :followings, source: :followed
  has_many :inverse_followings, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :inverse_followings, source: :follower
end
