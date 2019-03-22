Rails.application.routes.draw do
  root "pages#index"

  devise_for :users, controllers: {
    confirmations: "user/confirmations",
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
    unlocks: "users/unlocks"
  }

  resources :chat_rooms
end
