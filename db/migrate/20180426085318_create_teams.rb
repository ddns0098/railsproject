class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :avatar_uid
      t.string :avatar_name
      t.string :name

      t.timestamps
    end
  end
end
