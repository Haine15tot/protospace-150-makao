Rails.application.routes.draw do
  root to:"prototypes#index"
  resources :protospaces
end
