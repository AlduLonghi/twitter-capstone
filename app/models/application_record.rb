class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :most_recent_opinions, -> { order(created_at: :desc) }
end
