class UserBookmark < ActiveRecord::Base
  attr_accessible :bookmark_id, :user_id
  belongs_to :user
  belongs_to :bookmark
end
