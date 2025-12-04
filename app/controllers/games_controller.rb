class GamesController < ApplicationController
  def result
    mood = params[:mood]
    game = MoodGame.find_by(mood: mood)

    if game
      render json: { game: game.game_name, reason: game.reason }
    else
      render json: { game: "未対応", reason: "未対応の気分です" }
    end
  end
end
