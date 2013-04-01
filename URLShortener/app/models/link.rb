class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :long_url

  has_many :link_tags
  has_many :visits
  has_many :comments

  has_many :users, :through => :visits
  has_many :tags, :through => :link_tags


  def initialize(url)
    @url_long = url
    @url_short = shorten(url)
  end

  def shorten(url)


  end

end
