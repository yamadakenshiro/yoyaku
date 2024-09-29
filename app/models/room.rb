class Room < ApplicationRecord
    has_one_attached :room_image
    belongs_to :user
    has_many :reservations, dependent: :destroy
end
