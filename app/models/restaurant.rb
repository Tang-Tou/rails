class Restaurant < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
