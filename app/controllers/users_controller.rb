class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:new, :create]
  before_action :same_user

  def show
    @place_orders = @user.place_orders
  end

  def index
      @users = User.all
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to Marilu T-Shirts #{@user.username}, you have successfully signed up"
        redirect_to index_path
      else
        render 'new'
      end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Your account was successfuly deleted"
    redirect_to root_path
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  

  private
  def user_params
      params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only manage your own account"
      redirect_to user_path(current_user)
    end
  end
end