class User < ActiveRecord::Base
  has_many :links #links that this user set up
  has_many :comments
  has_many :visits  #visits to links

  def self.create(username, email)
    User.new(username, email).save
  end

  def initialize(username, email)
    @username = username
    @email = email
  end

end