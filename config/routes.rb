
Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :books do
    resources :book_comments,only: [:create, :destroy]
    resource :favorites,only: [:create, :destroy]
  end
end






# Rails.application.routes.draw do
#   devise_for :users
#   root 'homes#top'
#   get 'home/about' => 'homes#about'
#   resources :users,only: [:show,:index,:edit,:update]
#   resources :books do
#     resources :book_comments,only: [:create, :destroy]
#     resource :favorites,only: [:create, :destroy]
#     resources :users, only: [:index, :show, :edit, :update] do
# # ——————————————— ここから ———————————————
#   resource :relationships, only: [:create, :destroy]
#   get 'followings' => 'relationships#followings', as: 'followings'
#   get 'followers' => 'relationships#followers', as: 'followers'
# # ——————————— ここまでネストさせる ———————————
#   end
# end
# end