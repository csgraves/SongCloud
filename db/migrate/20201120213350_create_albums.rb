class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.date :released, null: false

      t.timestamps
    end
  end
end
