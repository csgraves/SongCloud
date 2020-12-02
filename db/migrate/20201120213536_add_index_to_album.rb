class AddIndexToAlbum < ActiveRecord::Migration[5.2]
  def change
    #all titles are unique
    add_index :albums, :title, unique: true
  end
end
