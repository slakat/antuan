Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :workers do
    collection do
      post :import
      post :validate
      post :survey
      get  :export
    end
  end

  resources :roles do
    collection do
      post :import
      post :coding
    end
  end

  resources :pieces do
    collection do
      post :import
    end
  end


  resources :sizes do
    collection do
      post :import
    end
  end


  root to: 'home#index'

end
