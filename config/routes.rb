Rails.application.routes.draw do
  root to: 'sessions#new'

  resource :user, only: [:new, :create, :show, :edit, :update]
  resource :session, only: [:new, :create, :destroy]

end
