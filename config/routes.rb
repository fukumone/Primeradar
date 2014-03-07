Primeradar::Application.routes.draw do
  root 'top#index'

  resources :top, only: [] do
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
      get :prime_triplet
      get :prime_quadruplet
      get :mersenne_number
      get :goldbachs_conjecture
      get :fermats_little_theorem
    end
  end
end
