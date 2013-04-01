class LongUrl < ActiveRecord::Base
  has_many :links
  attr_accessible :url

  def self.create(long_url)
    long = LongUrl.new
    long.url = long_url
    long.save

    long
  end

end
