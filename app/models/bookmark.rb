class Bookmark < ActiveRecord::Base
  attr_accessible :burl, :title
  belongs_to :user

  default_scope order('created_at DESC')
end
