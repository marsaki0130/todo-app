Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index' #タスク一覧の表示

  resources :boards do #crud機能の作成
    resources:tasks #中に入力すると boardsとtaskが紐づく
  end

  resources :tasks do
  end
end
