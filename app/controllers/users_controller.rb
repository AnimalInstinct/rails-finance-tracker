class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def index
    @users = current_user.friends
    @users = current_user.except_current_user(@users)
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    if params[:search_request].present?
      @users = User.search(params[:search_request])
      @users = current_user.except_current_user(@users)
      if @users
        respond_to do |format|
          format.js { render partial: 'users/users_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid user search request'
          format.js { render partial: 'users/users_ result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Request is empty'
        format.js { render partial: 'users/users_ result' }
      end
    end
  end
end
