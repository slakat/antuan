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

  root to: 'home#index'

end
