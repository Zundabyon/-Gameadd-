class CreateMoodGames < ActiveRecord::Migration[8.1]
  def change
    create_table :mood_games do |t|
      t.string :mood
      t.string :game_name
      t.text :reason

      t.timestamps
    end
  end
end
