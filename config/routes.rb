Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"

  resources :users, :only => [:index, :destroy] do
    resources :questions
  end

  resources :questions, :only => [:show] do
    resources :answers
  end
end
