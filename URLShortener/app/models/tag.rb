class Tag < ActiveRecord::Base
  has_many :link_tags
  has_many :links, :through => :link_tags

  def most_popular(n = 3)
    ## get the top n links with this tag that have the most visits
    link_ids = LinkTag.where(:tag_id => self.id).map { |lt| lt.link_id}
    print link_ids
    link_ids.sort! { |id1, id2| Link.find(id1).visit_count <=> Link.find(id2).visit_count }
    print link_ids
    link_ids[0..n].map { |id| Link.find(id) }
  end
end
