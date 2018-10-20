Rails.application.routes.draw do
  resources :workers do
    resources :work_tables
    post '/work_tables/all', to:'work_tables#createAll'
    patch '/work_tables/', to:'work_tables#update'
  end

  get '/keyboard', to: 'kakaobot#keyboard'
  post '/message', to: 'kakaobot#message'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
