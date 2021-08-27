class UsersController < ApplicationController
  def my_portfolio
    @current_user = current_user
    @tracked_stocks = current_user.stocks
  end
end
