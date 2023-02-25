Rails.application.routes.draw do
 
   # 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: 'public' do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :users, only: [:show, :edit, :cancel, :update]
    resources :institutions, only: [:new, :edit, :index, :update, :show, :create, :destroy]
  end
 
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
