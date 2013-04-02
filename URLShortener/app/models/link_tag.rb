class LinkTag < ActiveRecord::Base
  attr_accessible :link_id, :tag_id

  belongs_to :link
  belongs_to :tag
end