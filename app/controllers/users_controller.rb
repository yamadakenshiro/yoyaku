class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def show
      @user = current_user
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "変更内容を更新しました"
        redirect_to :users
      else
        flash.now[:failure] = "変更内容の更新に失敗しました"
        render "edit"
      end
    end

    private
    def user_params
        params.require(:user).permit(
            :user_image,
            :name,
            :comment,
            :email,
            :password,
        )
    end

    private

  def test_params
    params.require(:post).permit(:text, :image)
  end

end
