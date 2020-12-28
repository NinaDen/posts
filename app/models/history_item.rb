class HistoryItem < ApplicationRecord
  validates :history_type, presence: true
  belongs_to :user
  belongs_to :target, polymorphic: true
end
