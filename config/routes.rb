Rails.application.routes.draw do
  root to: 'sessions#new'

  resource :user, except: [:destroy] do
    resources :flashcards, except: [:index]
  end
  resources :flashcards, only: [:index]
  resource :session, only: [:new, :create, :destroy]

end
