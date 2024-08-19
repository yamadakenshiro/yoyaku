class ReservationsController < ApplicationController
    def index
      @reservations = Reservation.all
    end
      
    def new
      @reservation = Reservation.new
    end
  
    def confirm
      @room = Room.find(params[:id])
      @reservation = Reservation.new(params.permit(:start_day, :end_day, :number, :stay_days, :room_id, :user_id))
      @stay_days = (@reservation.end_day - @reservation.start_day)

      if @stay_days < 1 && @reservation.number == nil 
        flash[:notice] = "人数を入力してください。チェックアウト日はチェックイン日より前の日付では登録できません。"
        redirect_to @room

      elsif @stay_days < 1 
        flash[:notice] = "チェックアウト日はチェックイン日より前の日付では登録できません。"
        redirect_to @room

      elsif @reservation.number == nil 
        flash[:notice] = "人数を入力してください。"
        redirect_to @room
    
      else
        @total_amount_price = @stay_days * @room.price * @reservation.number
      end

    end
      
    def create
      @reservation = Reservation.new(reservation_params)
      render :new and return if params[:back] || !@reservation.save
      redirect_to @reservation
    end
      
    
      
    def edit
      @reservation = Reservation.find(params[:id])
    end
      
    def update
      @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params)
        flash[:success] = ""
        redirect_to :reservations#あとで施設一覧に変更
      else
        flash.now[:failure] = ""
        render "edit"
      end
    end
      
    def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
      flash[:delete] = "削除しました"
      redirect_to :reservations
    end
      
    private
    def reservation_params
      params.require(:reservations).permit(
        :room_id,
        :user_id,
        :start_day,
        :end_day,
        :number,
        :price,
      )
    end
  
end
