class Design < ApplicationRecord
  belongs_to :garden
  has_many :tiles, dependent: :destroy
end
