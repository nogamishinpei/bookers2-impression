class BooksController < ApplicationController
  
  def new
    @book = book.new
  end

  def create
     @book = book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
    @book = Book
  end

  def show
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
  
  
  
end
