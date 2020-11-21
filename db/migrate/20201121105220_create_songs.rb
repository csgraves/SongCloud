class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.belongs_to :album, foreign_key: true, null: false
      t.string :title, null: false
      t.string :artist
      t.string :genre
      t.boolean :favourite

      t.timestamps
    end
  end
end
