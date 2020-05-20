Rails.application.routes.draw do
  devise_for :users
  #deviseを使用する際にURLとしてusersを含むことを示している
  root 'post_images#index'
  #ログイン認証が成功した後、投稿画像の一覧画面が表示されるように設定
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  #resourcesメソッドは、ルーティングを一括して自動生成してくれる。onlyは、生成するルーティングを限定するオプション。
  #画像投稿には、新規投稿、一覧、詳細機能しか使わないため不要なルーティングが実行されないようonlyを設定。
  #resouce単数形！単数形だとそのコントローラのidがリクエストに含まれなくなる。
  #今回コメントの詳細ページは作成しない。post_commentsのshowページが不要で、idの受け渡しも必要ないので、resourceになってる
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	end
  resources :users, only: [:show, :edit, :update]
end