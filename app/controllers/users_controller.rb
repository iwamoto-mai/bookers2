class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
  end
  
  def index
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end
end
