class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :bookmark
      t.references :user

      t.timestamps
    end
    add_index :likes, :bookmark_id
    add_index :likes, :user_id
  end
end
