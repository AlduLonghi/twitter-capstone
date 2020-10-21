class Opinion < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }

  scope :most_recent_opinions, -> { order(created_at: :desc) }
  belongs_to :author, class_name: 'User'
  has_many :favorites, foreign_key: :opinion_id, dependent: :destroy
end
