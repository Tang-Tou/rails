

module Hasher
  require 'digest'
  def self.encrypt(password)
    Digest::SHA1.hexdigest(password)
  end

  def self.salted(password, head = '123', tail = 'xx')
    "#{head}#{password}#{tail}" # => 加密前在使用者指定的密碼前後加入 123 跟 xx 再一起加密
  end
end

class User < ApplicationRecord

validates :email, presence: true,
                  uniqueness: true,
                  format: { with: /.+\@.+\..+/ }

validates :password, presence: true,
                    confirmation: true

before_create :encrypt_password

has_many :restaurants
has_many :comments

def self.login(params)
  email = params[:email]
  password = params[:password]

  salted_password = Hasher.salted(password)
  encrypted_password = Hasher.encrypt(salted_password)

  find_by(email: email, password: encrypted_password)
end

private
  def encrypt_password
    salted_pwd = Hasher.salted(password)
    self.password = Hasher.encrypt(salted_pwd)
  end
end
