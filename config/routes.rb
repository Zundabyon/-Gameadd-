Rails.application.routes.draw do
  resources :mood_games
  get "/games/result", to: "games#result"
  root "home#index"
end
