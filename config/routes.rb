Webcomic::Application.routes.draw do

  namespace :admin do
    resources :comics do
      collection do
        get 'first'
        get 'latest'
      end
    end
  end

  resources :comics do
    collection do
      get 'first'
      get 'latest'
      get 'random'
    end
  end
  
  get 'tags', to: 'tags#index', as: :tags
  get 'tags/:tag', to: 'comics#index', as: :tag
  get 'admin_tags/:tag', to: 'admin/comics#index', as: :admin_tag
  
  match '/feed' => 'comics#feed',
    :as => :feed,
    :defaults => { :format => 'atom' }

  devise_for :users

  root :to => "comics#latest"
  
end
