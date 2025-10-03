class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :deactivate]

    def index
        @users = User.all
        render json: @users, serializer: UserSerializer
    end

    def show
        render json: @user, serializer: UserSerializer
    end

    def create
        @user = User.new(user_params)

            @user.save ? 
                (render json: @user, serializer: UserSerializer, status: :created) :
                    (render json: { errors: @user.errors.full_messages },
                        status: :unprocessable_entity)
    end

    def update
        @user.update(user_params) ?
            (render json: @user, serializer: UserSerializer, status: :ok) :
                (render json: { errors: @user.errors.full_messages },
                    status: :unprocessable_entity)
    end

    def deactivate
        @user.update(status: :inactive) ?
            (render json: { message: 'User deactivated successfully' }, status: :ok) :
                (render json: { errors: @user.errors.full_messages },
                    status: :unprocessable_entity)
    end

    
    private
    def user_params
        params.require(:user).permit(:name, :email, :document, :role, :password)
    end

end
