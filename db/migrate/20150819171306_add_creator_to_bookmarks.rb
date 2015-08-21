class AddCreatorToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :creator_id, :integer
    add_index :bookmarks, :creator_id
  end
end
