class UsersController < ApplicationController

  before_action :verify_logged_in, only: [:show, :edit, :update]

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.now[:notice] = "Success!"
      log_in!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages

      render :new
    end
  end

  def show
    @user = current_user

    render :show
  end

  def edit
    @user = current_user

    render :edit
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash.now[:notice] = "Success!"

      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages

      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
