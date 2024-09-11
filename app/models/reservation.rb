class Reservation < ApplicationRecord
    has_and_belongs_to_many :rooms
    belongs_to :room
end