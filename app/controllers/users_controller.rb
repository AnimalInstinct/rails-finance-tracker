class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_portfolio
    @current_user = current_user
    @tracked_stocks = current_user.stocks
  end
end
