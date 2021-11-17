Rails.application.routes.draw do
  devise_for :users, skip: [:passwords,], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  devise_for :proposers, skip: [:passwords,], controllers: {
    registrations: "proposer/registrations",
    sessions: "proposer/sessions"
  }

  root 'homes#top'
  get 'homes/about' => 'homes#about'

  namespace :user do
    resources :users
    resources :tasks
    resources :ideas
    resources :funs
    post '/tasks/:id/toggle' => 'tasks#toggle'
  end

  namespace :proposer do
    resources :proposers
    resources :ideas
    resources :funs
  end

  end
