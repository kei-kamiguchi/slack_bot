Rails.application.routes.draw do
  root 'chatbots#index'
  resources :chatbots
end
