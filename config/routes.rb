Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'poll#new'
  get 'poll/new'
  get 'poll/create'
  get 'poll/index'
end
