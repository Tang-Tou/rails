class RestaurantsController < ApplicationController
  # action
  def index
    @aa = 'hi'
    render html: 'hello'
  end
  # rails自動會去views找對應的檔案
  # action不做事情 = 沒有執行任何程式
  def new
  end
  
  def list
    # 寫入資料庫
    # redirect -> 列表頁
    # render html: "title is #{params[:title]}"
    # redirect_to '/restaurants'
    # p restaurants_path
    redirect_to restaurants_path
    # path是個方法
    
  end
end