class UsersController < ApplicationController
    before_action :require_login, only:[:show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
        def user_params
            params.require('user').permit(:name,:password,:happiness,:nausea,:tickets,:height,:admin)
        end
end
