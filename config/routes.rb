Rails.application.routes.draw do
  root "home#index"
  get "/games/result", to: "games#result"

end
