Rails.application.routes.draw do
  root 'queries#query'

  get 'query',      to: 'queries#query'
  get 'search_cep', to: 'queries#search_cep', as: :search_cep
end
