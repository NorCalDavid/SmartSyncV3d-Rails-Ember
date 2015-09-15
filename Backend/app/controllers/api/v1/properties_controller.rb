module Api
  module V1

    class PropertiesController < ApiController
      respond_to :json

      def index
        @properties = User.find(params[:user_id]).properties
        respond_with @properties
      end


      # def new
      #   Not Needed to Render Form
      # end


      def create
        property = Property.new(property_params)

        if property.save
          respond_with property
        else
          head status: :expectation_failed
          return false
        end
      end


      def show
        @property = Property.find(params[:id])
        respond_with @property
      end


      def edit
        @property = Property.find(params[:id])
        respond_with @property
      end


      def update
        property = Property.find(params[:id])

        if property.save
          respond_with property
        else
          head status: :expectation_failed
          return false
        end
      end


      def destroy
        property = Property.find(params[:id])

        if property.destroy
          head status: :ok
          return true
        else
          head status: :expectation_failed
          return false
        end

      end


      private

      def property_params
        params.require(:property).permit(:name, :description, :address, :city, :state, :zip_code)
      end

    end

  end
end
