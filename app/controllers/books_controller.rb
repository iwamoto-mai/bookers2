class BooksController < ApplicationController
before_action :is_matching_login_user, only: [:edit]
  def new
    @book = Book.new
  #  @book.user_id = current_user.id
  #  @book.save
  #  redirect_to book_patth
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.page(params[:page])
    @book =Book.new
    @book.user = current_user
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
     @book =  Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  private

  def book_params
    params.require(:book).permit(:image, :title, :body)
  end
  
def is_matching_login_user
    user = Book.find(params[:id]).user
    unless user.id == current_user.id
      redirect_to books_path
    end
end
  
end