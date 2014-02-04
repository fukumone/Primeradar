Hiyiyi::Application.routes.draw do
  root 'top#index'

  resources :top do
    collection do
      get :search
      get :search_prime
      get :search_twins_prime
    end
  end

end
