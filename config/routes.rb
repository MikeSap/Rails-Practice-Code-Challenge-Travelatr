Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers, only: [:index, :new, :show, :create]
  resources :destinations, only: [:index, :new, :show, :create]
  resources :posts, only: [:new, :show, :create, :edit, :update]

  post '/posts/:id', to: 'posts#add_likes'
  
end
