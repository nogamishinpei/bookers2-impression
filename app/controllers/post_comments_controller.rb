class PostCommentsController < ApplicationController
  
   before_action :baria_user, only: [:destroy]
  
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = @book.id
    comment.save
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    comment = PostComment.find(params[:id])
    comment.destroy
    
  end

 private

  def post_comment_params
    params.require(:post_comment). permit(:comment, :user_id, :book_id)
  end
  
  def baria_user
    comment = PostComment.find(params[:id])
  	unless comment.user_id == current_user.id
  		redirect_to user_path(current_user)
  	end
  end
  
end