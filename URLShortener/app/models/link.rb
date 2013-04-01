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

  def self.create(user, url)
    if user.links.any? { |link| link.long_url.url == url }
      raise 'You already entered this url.'
    else ##shortcut?
      new_long = LongUrl.create(url)
      new_short = Link.new
      new_short.user_id = user.id
      new_short.long_url_id = new_long.id
      new_short.url_short = new_short.generate_short
      new_short.save

      new_short
    end
  end

  def generate_short
    SecureRandom.urlsafe_base64(3)
  end

end
