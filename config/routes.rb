Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # mount Ckeditor::Engine => '/ckeditor'
  get    'signup',    to: 'users#new'
  get    'about',     to: 'pages#about'
  get    'login',     to: 'sessions#new'
  post   'login',     to: 'sessions#create'
  delete 'logout',    to: 'sessions#destroy'

  root 'collections#index'

  resources :collections, shallow: true do
    resources :articles, except: [:index] do
      resources :comments
    end
  end

  resources :users, except: [:index]
end
