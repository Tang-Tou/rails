class RestaurantsController < ApplicationController
  # action
  def index
    # @aa = 'hi'
    # render html: 'hello'
    @restaurants = Restaurant.all.order(id: :desc) # 正向排序:asc 反向排序:desc
  end
  # rails自動會去views找對應的檔案
  # action不做事情 = 沒有執行任何程式
  # 如果有render就不會去找view
  def show
    begin
      @restaurant = Restaurant.find(params[:id])  
      # 使用find_by會錯誤 => 回傳nil
    rescue

      redirect_to error_restaurant_path
    end
  end 

  def error
    @restaurant = Restaurant.find_by(id: params[:id])
    # redirect_to restaurants_path
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path(@restaurant), notice: '成功'
    else
      render :new
    end
    # 寫入資料庫
    # redirect -> 列表頁
    # render html: "title is #{params[:title]}"
             #html:為格式，讓瀏覽器認知這是一段html，也可以使用json:，但就會被認為是json的格式
    # redirect_to '/restaurants'
    # p restaurants_path
    
    # path是個方法
  end

  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: '編輯成功'
    else
      render :edit  
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, notice: '刪除成功'
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:title, :address, :tel, :email, :description)
    end

end