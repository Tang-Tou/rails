Rails.application.routes.draw do
  # get '/restaurants', { to: 'a#b'}
  # get '/hello', { to: 'a#b'}
  # 多個對同一個hash ( controller名  action 名 ) 也可以
  # get '/', to: 'a#b'
  get '/restaurants', { to: 'restaurants#index'}
  get '/new_restaurants', { to: 'restaurants#new'}
  # post '/restaurant_list', to: 'restaurants#list'
  post :restaurant_list, to: 'restaurants#list', path: '/ccc'
  # 得到路徑 指向 叫做rs的c裡面ㄉ叫做index的action 然後
  # path這個方法代表的是他指向的路徑
end
