class MoodGamesController < ApplicationController
  before_action :set_mood_game, only: %i[ show edit update destroy ]

  # GET /mood_games or /mood_games.json
def index
  @mood_games = MoodGame.all
  @mood_games_json = @mood_games.as_json(only: [:mood, :game_name, :reason])
end
  # ここでページ読み込み時にJSONでデータを取得し、JavaScriptで利用できるようにしています。
  # これがないと、JavaScript側でデータが取得できず、エラーが発生します。

  # GET /mood_games/1 or /mood_games/1.json
  def show
  end

  # GET /mood_games/new
  def new
    @mood_game = MoodGame.new
  end

  # GET /mood_games/1/edit
  def edit
  end

  # POST /mood_games or /mood_games.json
  def create
    @mood_game = MoodGame.new(mood_game_params)

    respond_to do |format|
      if @mood_game.save
        format.html { redirect_to @mood_game, notice: "Mood game was successfully created." }
        format.json { render :show, status: :created, location: @mood_game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mood_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mood_games/1 or /mood_games/1.json
  def update
    respond_to do |format|
      if @mood_game.update(mood_game_params)
        format.html { redirect_to @mood_game, notice: "Mood game was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @mood_game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mood_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mood_games/1 or /mood_games/1.json
  def destroy
    @mood_game.destroy!

    respond_to do |format|
      format.html { redirect_to mood_games_path, notice: "Mood game was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood_game
      @mood_game = MoodGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mood_game_params
      params.fetch(:mood_game, {})
    end
end
