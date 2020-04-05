class User < ActiveRecord::Base
    has_secure_password
    has_many :meals
    validates :email, uniqueness: true
    validates :email, presence: true
end
