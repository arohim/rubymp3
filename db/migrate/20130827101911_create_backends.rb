class CreateBackends < ActiveRecord::Migration
  def change
    create_table :backends do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.string :cover
      t.string :mp3file

      t.timestamps
    end
  end
end
