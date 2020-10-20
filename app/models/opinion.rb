class Opinion < ApplicationRecord
  validates :content, presence: true

  scope :most_recent_opinions, -> { order(created_at: :desc) }
  belongs_to :author, class_name: 'User'
end
