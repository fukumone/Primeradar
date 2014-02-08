Hiyiyi::Application.routes.draw do
  root 'top#index'

  resources :top do
    collection do
      get :search_prime
      get :search_twins_prime
    end
  end

  resources :prime, only: [] do
    collection do
      get :introduction_prime
      get :history_prime
      get :twins_prime
      get :largest_prime
    end
  end
end
