Rails.application.routes.draw do
  resources :projects
  resources :teams
  resources :apprentices
  devise_for :admins, controllers: {
      sessions: 'admins/sessions'
  }
  root 'main#index'
  get '/admin' => 'admins#index'
end
