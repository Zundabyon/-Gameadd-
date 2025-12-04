Rails.application.routes.draw do
  get "/games/result", to: "games#result"
  root "home#index"
end
