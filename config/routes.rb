# frozen_string_literal: true

Rails.application.routes.draw do
  # #get 'pages/index'

  root 'pages#index'

  resources :bank_accounts, only: %i[show index]

  namespace :api do
    namespace :v1 do
      post 'bank_accounts/new_transaction', to: 'bank_accounts#new_transaction'
    end
  end
end
