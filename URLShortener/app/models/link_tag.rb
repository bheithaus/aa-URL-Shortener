class LinkTag < ActiveRecord::Base
  belongs_to :links
  belongs_to :tags
end