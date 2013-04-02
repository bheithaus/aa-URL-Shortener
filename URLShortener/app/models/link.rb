require 'securerandom'

class Link < ActiveRecord::Base
  attr_accessible :user_id, :long_url_id, :url_short

  belongs_to :user
  belongs_to :long_url

  has_many :link_tags
  has_many :visits
  has_many :comments

  has_many :users, :through => :visits
  has_many :tags, :through => :link_tags

  def self.make(user, url)
    if user.links.any? { |link| link.long_url.url == url }
      raise 'You already entered this url.'
    else ##shortcut?
      new_long_id = LongUrl.create(:url => url).id
      new_short = generate_short
      return Link.create(:long_url_id => new_long_id, :user_id => user.id,
                          :url_short => new_short)
    end
  end

  def self.generate_short
    SecureRandom.urlsafe_base64(3)
  end

  def get_url(user_id)
    Visit.create(:user_id => user_id, :link_id => self.id)

    self.long_url.url
  end

  def visit_count(t = nil)
    unless t
      return Visit.where(:link_id => self.id).count
    else
      return Visit.where('link_id = ? AND created_at > ?', self.id, (Time.now) - t*60).count
    end
  end

  def uniques
    Visit.select("DISTINCT user_id").where(:link_id => self.id).count
  end

  # def ten_min_count
  #   Visit.where(:link_id => self.id).where('created_at > ?', (Time.now) - 40*60).count
  # end

end
