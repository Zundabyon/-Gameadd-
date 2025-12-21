require "application_system_test_case"

class MoodGamesTest < ApplicationSystemTestCase
  setup do
    @mood_game = mood_games(:one)
  end

  test "visiting the index" do
    visit mood_games_url
    assert_selector "h1", text: "Mood games"
  end

  test "should create mood game" do
    visit mood_games_url
    click_on "New mood game"

    click_on "Create Mood game"

    assert_text "Mood game was successfully created"
    click_on "Back"
  end

  test "should update Mood game" do
    visit mood_game_url(@mood_game)
    click_on "Edit this mood game", match: :first

    click_on "Update Mood game"

    assert_text "Mood game was successfully updated"
    click_on "Back"
  end

  test "should destroy Mood game" do
    visit mood_game_url(@mood_game)
    click_on "Destroy this mood game", match: :first

    assert_text "Mood game was successfully destroyed"
  end
end
