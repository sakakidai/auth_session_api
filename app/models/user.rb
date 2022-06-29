class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 30, allow_blank: true }
  validates :email, presence: true, email: { allow_blank: true }
end
