Rails.application.routes.draw do
  devise_for :users
  root to:"prototypes#index"
  resources :prototypes
  devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
