Rails.application.routes.draw do
  root 'home#index'
  get '/confirmados', action: 'confirmed', controller: 'home'
  get '/recuperados', action: 'recovered', controller: 'home'
  get '/mortos', action: 'deaths', controller: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
