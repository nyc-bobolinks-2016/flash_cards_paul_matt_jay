class User < ActiveRecord::Base

  has_many :rounds
  has_many :decks, through: :rounds
  has_secure_password

  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

end
