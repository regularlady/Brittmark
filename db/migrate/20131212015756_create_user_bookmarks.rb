class CreateUserBookmarks < ActiveRecord::Migration
  def change
    create_table :user_bookmarks do |t|
      t.references :bookmark
      t.references :user
      t.timestamps
    end
  end
end
