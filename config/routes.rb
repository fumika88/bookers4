Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
  }

  scope module: :users do
  root to: 'homes#top'
  resources :posts #postsコントローラー作成後記入
  resources :hashtags, only: [:index, :show] #hashtagsコントローラー作成後記入
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
