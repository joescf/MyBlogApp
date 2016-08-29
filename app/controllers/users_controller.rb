class UsersController < ApplicationController
    before_filter :authenticate, :only => [:edit, :update]

    def new
      @user = User.new
    end

    def create
      @user = User.new(ad_params)
      @user.save
      if  @user.save
        redirect_to articles_path, :notice => 'User successfully added'
      else
        render :action => 'new'
      end
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
      if @user.update_attrivutes(params[:user])
        redirect_to articles_path, :notice => 'Updated user information successfully.'
      else
        render :action => 'edit'
      end
    end
      private
    def ad_params
      params.require(:user).permit(:email, :password)
    end
end

# def create
#     @user = User.new(params[:user])
#     if @user.save
#     redirect_to articles_path, :notice => 'User successfully added.'
#     else
#     render :action => 'new'
#     end
#   end
