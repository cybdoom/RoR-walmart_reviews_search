Rails.application.routes.draw do
  get 'reviews/search', to: 'reviews#form'
  post 'reviews/search', to: 'reviews#search'

  root 'reviews#form'
end
