class Api::SessionsController < ApplicationController
  def new
    render :new
  end

  # def create
  #   user = User.find_by_credentials(params[:user][:username], params[:user][:password])
  #   if user
  #     login(user)
  #     render 'api/users/show'
  #   else
  #     flash.now[:errors] = errors.full_messages
  #     render json: ['Wrooongggg'], status: 401
  #   end
  # end

    def create
    # Find user by credentials
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      render json: ['Nope. Wrong credentials!'], status: 401
    else
      login(@user)
      render 'api/users/show';
    end
  end

  def destroy
    if current_user == nil
       render json: ['No current user'], status: 404
    end

    logout
    
    render json: {}
  end
end
