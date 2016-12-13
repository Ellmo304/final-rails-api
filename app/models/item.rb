class Item < ApplicationRecord
  has_and_belongs_to_many :gardens
  validates :name, presence: true
  validates :price, presence: true
  validates :item_type, presence: true
end
