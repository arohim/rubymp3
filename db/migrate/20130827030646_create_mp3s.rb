class CreateMp3s < ActiveRecord::Migration
  def change
    create_table :mp3s do |t|
      t.string :title

      t.timestamps
    end
  end
end
