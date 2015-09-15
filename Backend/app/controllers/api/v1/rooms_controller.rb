module Api
  module V1

    class RoomsController < ApiController
      respond_to :json

      def index
        @properties = User.find(params[:user_id]).properties(:include => :rooms)
        respond_with @properties
      end


      # def new
      #   Not Needed to Render Form
      # end


      def create
        room = Room.new(room_params)

        if room.save
          head status: :created
          respond_with room
        else
          head status: :expectation_failed
          return false
        end
      end


      def show
        @room = Room.find(params[:id])
        respond_with @property
      end


      def edit
        @room = Room.find(params[:id])
        respond_with @room
      end


      def update
        room = room.find(params[:id])

        if room.save
          head status: :accepted
          respond_with room
        else
          head status: :expectation_failed
          return false
        end
      end


      def destroy
        room = Room.find(params[:id])

        if room.destroy
          head status: :ok
          return true
        else
          head status: :expectation_failed
          return false
        end

      end


      private

      def room_params
        params.require(:room).permit(:name, :description)
      end

    end

  end
end


