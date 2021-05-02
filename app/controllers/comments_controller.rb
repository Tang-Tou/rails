class CommentsController < ApplicationController
  before_action :check_user!
  # 在上層

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.new(comment_params)
    # @comment.user = current_user

    if @comment.save
      # redirect_to restaurant_path(@restaurant)  # 餐廳的 show, 不轉址 render create.js.erb, 不用寫他會自動去找 
      # 執行 create.js.erb
    else
      render 'restaurants/show'
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
                            .merge({user: current_user})

    # permited_params = params.require(:comment).permit(:content)
    # permited_params[:user] = current_user

    # return permited_params
  end
end
