class LongUrl < ActiveRecord::Base
  attr_accessible :url

  has_many :links

  validates :url, :presence => true, :length => { :maximum => 1024 }
end
