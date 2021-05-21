class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :set_rooms, only: [:index, :show]

  def index
    @rooms = Rooms.all
    @users=User.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(set_params)
    #byebug
    if @room.save

      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room_message = @room.room_messages.new
    @room_messages = @room.room_messages.includes(:sender)
    @users=User.all
  end

  def edit
  end

  def update
    if @room.update_attributes(set_params)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  protected

  def set_room
    @room = Room.find(params[:id]) if params[:id]
  end

  def set_rooms
    @rooms = Room.all
  end

  def set_params
    params.require(:room).permit(:name)
  end
end
