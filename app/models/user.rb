class User < ApplicationRecord
    has_secure_password
    has_many :notes
    validates :email, :username,  uniqueness: true
    validates :email, :username, presence: true
    validates :password, length: { in: 6..20 }
    validates :email, email: true
end
