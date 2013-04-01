class User < ActiveRecord::Base
  has_many :links #links that this user set up
  has_many :comments
  has_many :visits  #visits to links

end