class Event < ApplicationRecord
	belongs_to :creator, class_name: "User", foreign_key: "creator_id"

	has_many :invites, foreign_key: "attended_event"
	has_many :attendees, through: :invites

	scope :upcoming, -> { where('date >= ?', DateTime.now).order('Date ASC') }
	scope :past, -> { where('date < ?', DateTime.now).order('Date DESC') }
end