class Design < ApplicationRecord
  belongs_to :garden
  has_one :user, through: :garden
  has_many :tiles, dependent: :destroy
  validates :garden_id, uniqueness: true

end
