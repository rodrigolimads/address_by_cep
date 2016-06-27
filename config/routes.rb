Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end

  root 'queries#query'

  get 'query',      to: 'queries#query'
  get 'search_cep', to: 'queries#search_cep', as: :search_cep
end
