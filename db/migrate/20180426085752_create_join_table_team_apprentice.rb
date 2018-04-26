class CreateJoinTableTeamApprentice < ActiveRecord::Migration[5.1]
  def change
    create_join_table :teams, :apprentices do |t|
       t.index [:team_id, :apprentice_id]
       t.index [:apprentice_id, :team_id]
    end
  end
end
