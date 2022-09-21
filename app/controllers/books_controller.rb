class BooksController < ApplicationController
  def new
  end

  def index
   @book = Book.new
  end
  def create
   book = book.new(book_params)
   book.save
   redirect_to'book/show'
  end 

  def show
  end
  
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
