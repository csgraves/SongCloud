class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    #DB album creation, don't allow null inputs to chosen db
    create_table :albums do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.date :released, null: false

      t.timestamps
    end
  end
end
