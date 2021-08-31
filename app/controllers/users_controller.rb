class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_portfolio
    @current_user = current_user
    @tracked_stocks = current_user.stocks
  end

  def index
    @users = User.all
    @friends = current_user.friends
  end

  def search
    if params[:search_request].present?
      @user = User.first
      if @user
        respond_to do |format|
          format.js { render partial: 'users/users_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid user search request'
          format.js { render partial: 'users/users_result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Request is empty'
        format.js { render partial: 'users/users_result' }
      end
    end
  end
end
