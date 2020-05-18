Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'poll#new'
  get  'poll/new'
  post 'poll/create'
  get  'poll/create', to: 'poll#new'
  get  'poll/index'
end
