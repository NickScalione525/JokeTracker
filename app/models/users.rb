class User < ActiveRecord::Base
    has_many :jokes
    has_secure_password
  end