class Event < ApplicationRecord
 belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
 has_many :attendees, inverse_of: :attended_event
end
