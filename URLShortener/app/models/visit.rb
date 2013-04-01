class Visit < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  def self.create(user_id, link_id)
    new_visit = Visit.new
    new_visit.user_id = user_id
    new_visit.link_id = link_id
    new_visit.save
  end

end
