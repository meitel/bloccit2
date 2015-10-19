Rails.application.routes.draw do
resources :labels, only: [:show]

 resources :topics do
    resources :posts, except: [:index]
  end
  
 # #4
   resources :posts, only: [] do
 # #5
     resources :comments, only: [:create, :destroy]
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote

   end
   
 resources :users, only: [:new, :create]

 resources :sessions, only: [:new, :create, :destroy]

 get 'about' => 'welcome#about'
 post '/users/confirm' => 'users#confirm'
 post 'users/new' => 'users#new'
 
 root to: 'welcome#index'

end
