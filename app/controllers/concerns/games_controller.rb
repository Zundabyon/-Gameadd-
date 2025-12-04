class GamesController < ApplicationController
  def result
    mood = params[:mood].to_s.strip

    Rails.logger.debug "受け取ったmood => #{mood}"

    mood_map = {
      "ガンガン行こうぜ" => "モンスターハンター",
      "ばっちりがんばれ" => "スプラトゥーン",
      "いのちだいじに"   => "どうぶつの森",
      "じゅもんつかうな" => "ゼルダの伝説",
      "おれにまかせろ"   => "ファイナルファンタジー"
    }

    game = mood_map[mood]

    if game.nil?
      render json: { result: "⚠ 未対応の気分: #{mood}" }
    else
      render json: { result: game }
    end
  end
end
