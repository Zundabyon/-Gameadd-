class GamesController < ApplicationController
  # GET /games/result?mood=xxxx
  def result
    mood = params[:mood].to_s

    # とりあえず動作確認用の固定レスポンス（後で SQL に差し替え）
    game =
      case mood
      when "ガンガン行こうぜ"
        "モンスターハンター"
      when "いのちだいじに"
        "どうぶつの森"
      when "ばっちりがんばれ"
        "スプラトゥーン"
      when "じゅもんつかうな"
        "ゼルダ"
      when "おれにまかせろ"
        "ファイナルファンタジー"
      else
        "おすすめゲーム未設定"
      end

    render json: { result: game }
  rescue => e
    # エラーのときにログ出す（Railsログで原因把握しやすくする）
    Rails.logger.error("GamesController#result error: #{e.message}\n#{e.backtrace.join("\n")}")
    render json: { error: "internal error" }, status: 500
  end
end
