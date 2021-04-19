Rails.application.routes.draw do
  resources :restaurants do
    member do
      post :vote
    end
    collection do
      get :error
    end
  end

  resources :users, only: [:create] do 
    collection do
      # get :sign_up,controller: 'restaurants' action: 'new'
      # 可以在後方指定他要去的controller跟action
      get :sign_up, action: 'new'
    end
  end

  resources :sessions, path: 'users', only: [] do
    collection do
      get :sign_in, action: 'new'
      post :sign_in, action: 'create'
      delete :sign_out, action: 'destroy'
    end
  end

  root 'restaurants#index'


  # 以下為手刻
  # get '/restaurants', { to: 'a#b'}
  # get '/hello', { to: 'a#b'}
  # 多個對同一個hash ( controller名  action 名 ) 也可以
  # get '/', to: 'a#b'
  # get '/restaurants', { to: 'restaurants#index'}
  # get '/new_restaurants', { to: 'restaurants#new'}
  # post '/restaurant_list', to: 'restaurants#list'
  # 可將:restaurant_list看做path: 這個 key 的預設value值，而後面補上path:的value，就會以後面的為主
  # post :restaurant_list, to: 'restaurants#list', path: '/ccc'
  # 得到路徑 指向 叫做rs的c裡面ㄉ叫做index的action 然後
  # path這個方法代表的是他指向的路徑

  # post :restaurant_list, to: 'restaurants#list', path: id: params[:id]
end
