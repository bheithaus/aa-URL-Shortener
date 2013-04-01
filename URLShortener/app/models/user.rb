class User < ActiveRecord::Base
  has_many :links
  has_many :comments
  has_many :visits
end