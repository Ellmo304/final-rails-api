class Image < ApplicationRecord
  belongs_to :garden
  validates :url, presence: true, uniqueness: true
end
