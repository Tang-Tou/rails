Rails.application.routes.draw do
  # get '/restaurants', { to: 'a#b'}
  # get '/hello', { to: 'a#b'}
  # 多個對同一個hash也可以
  # get '/', to: 'a#b'
  get '/restaurants', { to: 'restaurants#index'}
  get '/new_restaurants', { to: 'restaurants#new'}
end
