class User < ActiveRecord::Base
   
    has_many :jokes
    has_secure_password


    validates_uniqueness_of(:username)
    validates :username, length: { in: 4..20 }
    validates :password, length: { in: 6..20 }
  end