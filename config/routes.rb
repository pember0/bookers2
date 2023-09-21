Rails.application.routes.draw do
  root to: "homes#top"  # Topページを設定
  devise_for :users
  get "/home/about" => "homes#about", as: "about"  # aboutをルートに追加

  # resourcesは、コントローラに紐づいたアクションをまとめて指定できる(仮で設定)
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
end
