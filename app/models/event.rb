class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendees, inverse_of: :attended_event, dependent: :destroy
  scope :past_event, -> { where('date < ?', Date.current) }
  scope :upcoming_event, -> { where('date >= ?', Date.current) }
end
