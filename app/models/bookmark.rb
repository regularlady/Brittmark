class Bookmark < ActiveRecord::Base
  attr_accessible :burl, :title, :tag_list
  acts_as_taggable
  belongs_to :user

  default_scope order('created_at DESC')

  validates :title, length: { minimum: 5 }, presence: true
  validates :burl, length: { minimum: 6 }, presence: true
  validates :user, presence: true
end
