class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.date :released

      t.timestamps
    end
  end
end
