Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :import, only: [:new, :create] do
        get :exmaple, to: 'imports#example'
    end
    get :import, to: 'imports#new'
  end
end
