Rails.application.routes.draw do
  get 'kittens/index'
  root "api/kittens#index"
  namespace 'api' do
    resources :kittens
  end
end