class Bookmark < ActiveRecord::Base
  attr_accessible :burl, :title
  has_many :bookmarks
end
