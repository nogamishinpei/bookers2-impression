class BooksController < ApplicationController

before_action :correct_user, only: [:edit]
before_action :baria_user, only: [:edit, :update]

  def correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user_id
      redirect_to books_path
    end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @post_comment = PostComment.new
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have creatad book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def baria_user
	unless Book.find(params[:id]).user.id.to_i == current_user.id
		redirect_to books_path
	end
    end

end