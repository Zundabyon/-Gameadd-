require "test_helper"

class MoodGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mood_game = mood_games(:one)
  end

  test "should get index" do
    get mood_games_url
    assert_response :success
  end

  test "should get new" do
    get new_mood_game_url
    assert_response :success
  end

  test "should create mood_game" do
    assert_difference("MoodGame.count") do
      post mood_games_url, params: { mood_game: {} }
    end

    assert_redirected_to mood_game_url(MoodGame.last)
  end

  test "should show mood_game" do
    get mood_game_url(@mood_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_mood_game_url(@mood_game)
    assert_response :success
  end

  test "should update mood_game" do
    patch mood_game_url(@mood_game), params: { mood_game: {} }
    assert_redirected_to mood_game_url(@mood_game)
  end

  test "should destroy mood_game" do
    assert_difference("MoodGame.count", -1) do
      delete mood_game_url(@mood_game)
    end

    assert_redirected_to mood_games_url
  end
end
