class RoomsController < ApplicationController
    def index
      @rooms = Room.all
    end
    
    def new
      @room = Room.new
    end
    
    def create
      @room = Room.new(room_params)
      if @room.save
        flash[:success] = "登録しました"
        redirect_to :rooms
      else
        flash[:failure] = "登録に失敗しました"
        render "new"
      end
    end
    
    def show
      @room = Room.find(params[:id])
    end
    
    def edit
      @room = Room.find(params[:id])
    end
    
    def update
      @room = Room.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "変更内容を更新しました"
        redirect_to :show
      else
        flash[:failure] = "変更内容の更新に失敗しました"
        render "edit"
      end
    end
    
    def destroy
      @room = Room.find(params[:id])
      @room.destroy
      flash[:delete] = "削除しました"
      redirect_to :rooms
    end
    
    private
    def room_params
      params.require(:room).permit(
        :title,
        :introduction,
        :price,:address,
        :room_image,
        :address
        )
    end

end
