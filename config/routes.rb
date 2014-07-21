Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :import, only: [:new, :update] do
        get :exmaple, to: 'import#example'
    end
    get :import, to: 'import#new'
  end
end
