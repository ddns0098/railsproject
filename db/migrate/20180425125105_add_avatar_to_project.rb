class AddAvatarToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :avatar_uid, :string
    add_column :projects, :avatar_name, :string
  end
end
