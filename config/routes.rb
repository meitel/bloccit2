Rails.application.routes.draw do
 resources :topics do
    resources :posts, except: [:index]
  end
 
 resources :users, only: [:new, :create]
 post "users/confirm" => "users#confirm", :as => :confirm

 get 'about' => 'welcome#about'
 root to: 'welcome#index'

end
