class Opinion < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }

  belongs_to :author, class_name: 'User'
  has_many :favorites, foreign_key: :opinion_id, dependent: :destroy
end
