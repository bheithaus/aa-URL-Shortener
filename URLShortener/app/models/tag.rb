class Tag < ActiveRecord::Base
  has_many :links, :through => :link_tags
end
