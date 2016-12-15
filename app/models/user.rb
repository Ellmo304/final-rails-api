class User < ApplicationRecord
  has_secure_password
  has_many :gardens
  has_many :images, through: :gardens
  has_many :comments
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
end
