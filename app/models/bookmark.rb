class Bookmark < ActiveRecord::Base
  attr_accessible :burl, :title, :tag_list
  acts_as_taggable
  has_many :users, through: :user_bookmarks
  has_many :user_bookmarks

  default_scope order('created_at DESC')

  validates :title, length: { minimum: 5 }, presence: true
  validates :burl, length: { maximum: 100 }, length: { minimum: 10 }, presence: true
end
