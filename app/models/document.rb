class Document < ApplicationRecord
  has_one_attached :photo
  belongs_to :event
end
