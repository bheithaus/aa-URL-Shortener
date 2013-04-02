class User < ActiveRecord::Base
  attr_accessible :username, :email

  has_many :links #links that this user set up
  has_many :comments
  has_many :visits  #visits to links

  # def self.make(username, email)
  #   user = User.create()
  #
  #
  #
  #   User.new(username, email).save
  # end
end