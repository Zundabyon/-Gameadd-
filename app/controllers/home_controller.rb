def index
  @mood_games = MoodGame.all
  @mood_games_json = @mood_games.as_json(only: [:mood, :game_name, :reason])
end