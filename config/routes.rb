Rails.application.routes.draw do
  #ゲストログイン
  devise_scope :user do
    post "public/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
 
  

   # 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
}

  scope module: 'public' do
    root to: "homes#top"
    get "about" => "homes#about"
    get "users/cancel" => "users#cancel"
    resources :users, only: [:show, :edit, :update]
    resources :institutions, except: [:index] do
    resource :bookmarks, only: [:create, :destroy]
  end
  
    get "search" => "institutions#search"
    get "area" => "institutions#area"
    
    
    resources :institutions, only: [:new, :edit, :index, :update, :show, :create, :destroy] do 
     
      resources :reviews, only: [:new, :show, :create, :destroy, :edit, :update] do
        resources :comments, only: [:create, :destroy]
      end
    end  
  end
 
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
   resources :users, only: [:index, :show, :edit, :update]
   resources :reviews, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
