module Api
  module V1

    class DevicesController < ApiController
      respond_to :json

      def index
        @properties = User.find(params[:user_id]).properties(:include => [:rooms, :devices})
        respond_with @properties
      end


      # def new
      #   Not Needed to Render Form
      # end


      def create
        device = Device.new(device_params)

        if device.save
          head status: :created
          respond_with device
        else
          head status: :expectation_failed
          return false
        end
      end


      def show
        @device = Device.find(params[:id])
        respond_with @device
      end


      def edit
        @device = Device.find(params[:id])
        respond_with @device
      end


      def update
        device = device.find(params[:id])

        if device.save
          head status: :accepted
          respond_with device
        else
          head status: :expectation_failed
          return false
        end
      end


      def destroy
        device = Device.find(params[:id])

        if device.destroy
          head status: :ok
          return true
        else
          head status: :expectation_failed
          return false
        end

      end


      private

      def device_params
        params.require(:device).permit(:name, :description, :code, :status)
      end

    end

  end
end
