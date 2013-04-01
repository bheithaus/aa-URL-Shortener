class Link < ActiveRecord::Base
  belongs_to :user

  has_many :users, :through => :visits
  has_many :comments
  has_many :tags, :through => :link_tags
end
