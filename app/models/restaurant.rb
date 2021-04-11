class Restaurant < ApplicationRecord
  validates :title, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
