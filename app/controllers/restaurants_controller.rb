class RestaurantsController < ApplicationController
before_action :find_restaurant, only: [:edit, :update, :destroy]
before_action :check_user!, except: [:index, :show]

  # action
  def index
    # @aa = 'hi'
    # render html: 'hello'
    @restaurants = Restaurant.all # 正向排序:asc 反向排序:desc
    #挑選出沒有標記刪除時間的檔案並做反向排列
    # @restaurants = Restaurant.where(deleted_at: nil).order(id: :desc) 
    # @restaurants = Restaurant.deleted
  end
  # rails自動會去views找對應的檔案
  # action不做事情 = 沒有執行任何程式
  # 如果有render就不會去找view
  def show
    begin
      @restaurant = Restaurant.find(params[:id]) 
      # @restaurant = Restaurant.find_by(id: params[:id]) 會回傳nil 不算錯誤
       
      # 使用find_by會錯誤 => why
    rescue

      redirect_to error_restaurants_path
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
    # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.user = current_user
    # @restaurant = Restaurant.new(restaurant_params)
    @restaurant = current_user.restaurants.new(restaurant_params)

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

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: '編輯成功'
    else
      render :edit  
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.fake_destroy
    # @restaurant.update(deleted_at: Time.now), 
    # 在model裡建立一個destory的方法做軟刪除, destroy這個方法在上一層找到就不會再往上找到rails內建的刪除方法
    redirect_to restaurants_path, notice: '刪除成功'
  end

  def really_destroy!
    @restaurant = Restaurant.find_by(id: params[:id])  
    @restaurant.destroy
  end

  def vote
     
  end

  private

    def find_restaurant
      #作法一
      #@restaurant = Restaurant.find_by!(
      #  id: params[:id], 
      #  user_id: current_user.id
      #)

      #作法二 從使用者的角度去找餐廳
      @restaurant = current_user.restaurants.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:title, :address, :tel, :email, :description)
    end

    

end