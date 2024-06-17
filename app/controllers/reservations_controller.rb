class ReservationsController < ApplicationController
    def index
      @reservations = Reservation.all
    end
      
    def new
      @reservation = Reservation.new
    end
  
    def confirm
      @reservation = Reservation.new(reservation_params)
      if @reservation.invalid?
        render :new
      end
    end
      
    def create
      @reservation = Reservation.new(reservation_params)
      render :new and return if params[:back] || !@reservation.save
      redirect_to @reservation
    end
      
    def show
      @reservation = Reservation.find(params[:id])
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
