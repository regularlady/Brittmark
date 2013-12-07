class UserBookmarks < ActiveRecord::Migration
  def change
    add_column :user_id, :bookmark_id
    add_index :user_id, :bookmark_id
  end
end
