class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
  end
  
  def index
    @books = Book.page(params[:page])
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
end
