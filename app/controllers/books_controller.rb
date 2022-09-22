class BooksController < ApplicationController
  def new
  end

  def index
   @book = Book.new
   @books = Book.all
   @user = current_user
  end
  
  def create
  @book = Book.new(book_params)
  
   if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
   else
    @books = Book.all
    render :index
   end
  end
  
  def show
  end
  
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
