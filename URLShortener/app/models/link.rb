class Link < ActiveRecord::Base
  belongs_to :user

  has_many :visits
  has_many :comments
  has_many :tags
end
