class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 5..20 }

  has_many :opinions, foreign_key: :author_id, dependent: :destroy

  has_many :favorites, foreign_key: :user_id, dependent: :destroy
  has_many :favorite_opinions, through: :favorites, source: :opinion

  has_many :followings, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :followings, source: :followed

  has_many :inverse_followings, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :inverse_followings, source: :follower

  has_one_attached :photo

  has_one_attached :cover_image

  def prof_pic_attached
    photo.attached? ? photo : 'prof-pic.jpg'
  end

  def cover_pic_attached
    cover_image.attached? ? cover_image : 'cover-img.jpg'
  end
end
