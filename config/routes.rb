Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get 'users/index'
  get 'users/show'
  get 'likes/posts'
  get 'likes/users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create]
  end

  post '/posts/:id/comments', to: 'comments#create', as: 'post_comments'
  post '/posts/:post_id/likes', to: 'likes#create', as: 'post_likes'

  # Defines the root path route ("/")
  root to: 'users#index'
end
