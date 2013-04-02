class LongUrl < ActiveRecord::Base
  attr_accessible :url

  has_many :links
end
