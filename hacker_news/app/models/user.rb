class User < ActiveRecord::Base

  has_secure_password
  has_many :posts
  has_many :comments

  validates :username, presence: true, uniqueness:true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true

end
