# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/index' 
  
  root 'pages#index'

  resources :bank_accounts, only: [:show, :index]

end