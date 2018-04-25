class CreateDragonflyImages < ActiveRecord::Migration[5.1]
  def change
    create_table :dragonfly_images do |t|
      t.string :avatar_uid
      t.string :avatar_name
      t.timestamps
    end
  end
end
