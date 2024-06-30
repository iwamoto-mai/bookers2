class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
  end
  
  def index
    @books = Book.page(params[:page])
    @book = Book.new
  end
  
  private

  def user_params
    params.require(:book).parmit(:image, :title, :body)
  end
  
end
