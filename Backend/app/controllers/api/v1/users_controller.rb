module Api
  module V1

    class UsersController < ApiController
      respond_to :json

      def index
        console_alert({title: "THIS", parameters: params})
        @users = User.all
        respond_with @users
      end


      def show
        @user = User.find(params[:id])
        p @user
        respond_with @user
      end

      # def new
      #   Not Needed to Render Form
      # end

      def create
        user = User.new(user_params)

        if user.save
          respond_with user
        else
          head status: :expectation_failed
          return false
        end
      end


      def edit
        @user = User.find(params[:id])
        respond_with @user
      end


      def update
        @user = User.find(params[:id])

        if @user.update(user_params)
          respond_with @user
        else
          head status: :expectation_failed
          return false
        end
      end

      def properties
        @user = User.find(params[:id]).includes(:properties)
        respond_with @user
      end


      def rooms
        @user = User.find(params[:id]).includes(properties: [:rooms])
        respond_with @user
      end


      def devices
        @user = User.find(params[:id]).includes(properties: [:rooms, :devices])
        respond_with @user
      end

      private

      def user_params
        params.require(:user).permit(:name, :first_name, :last_name, :email, :password, :password_confirmation)
      end
    end

  end
end
