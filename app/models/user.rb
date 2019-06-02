class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :nullify
  has_many :comments, through: :posts, dependent: :nullify
end
