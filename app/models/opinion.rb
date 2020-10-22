class Opinion < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }

  belongs_to :author, class_name: 'User'
  has_many :favorites, foreign_key: :opinion_id, dependent: :destroy

  def favorites_count
    favorites.count
  end

  scope :most_favorites, lambda {
                           joins(:favorites).group('opinions.id')
                             .order('count(favorites.id) DESC, created_at DESC')
                         }
  scope :today_trend, -> { where(created_at: 1.day.ago..Time.now) }
  scope :week_trend, -> { where(created_at: 1.week.ago..Time.now) }
end
