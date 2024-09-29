class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params.merge(user_id: current_user.id))
      if @user.save
        flash[:notice] = "画像を登録しました"
        redirect_to "show"
      else
        render "show"
      end
    end

    def show
      @user = current_user
      @rooms = Room.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "変更内容を更新しました"
        redirect_to action: :show
      else
        flash.now[:failure] = "変更内容の更新に失敗しました"
        render "edit"
      end
    end

    def destroy
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
end
