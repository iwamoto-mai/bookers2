class BooksController < ApplicationController

  def new
    @book = Book.new
  #  @book.user_id = current_user.id
  #  @book.save
  #  redirect_to book_patth
  end

  def index
    @books = Book.page(params[:page])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  private

  def book_params
    params.require(:book).parmit(:image, :title, :body)
  end

end