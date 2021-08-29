class MyClient < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :soaps
end
