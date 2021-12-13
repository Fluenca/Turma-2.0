class TravelDetail < ApplicationRecord
  has_one_attached :photo
  belongs_to :event
end
