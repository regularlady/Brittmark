class Like < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user
  # attr_accessible :title, :body
end
