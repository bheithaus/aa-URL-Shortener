class User < ActiveRecord::Base
  attr_accessible :username, :email
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  has_many :links #links that this user set up
  has_many :comments
  has_many :visits  #visits to links

  def leave_comment(link_id, body)
    Comment.create(:body => body, :user_id => self.id, :link_id => link_id)
  end

  def add_tag(link_id, tag_id)
    LinkTag.create(:link_id => link_id, :tag_id => tag_id)
  end

  # def self.make(username, email)
  #   user = User.create()
  #
  #
  #
  #   User.new(username, email).save
  # end
end