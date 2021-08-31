class User < ApplicationRecord
 has_secure_password
 has_many :my_clients
 has_many :clients, through: :my_clients
 validates :email, uniqueness: true
 validates :license_number, uniqueness: true

end
