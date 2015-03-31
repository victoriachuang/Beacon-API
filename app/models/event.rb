class Event < ActiveRecord::Base
  validates :title, :location, :date_start, :category, presence: true
end
