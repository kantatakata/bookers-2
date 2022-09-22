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
    @book.user_id = current_user.id
   if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
   else
     @books = Book.all
     render :index
   end
   end
  
   def show
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.new
   end
  
   def edit
    @book = Book.find(params[:id])
   end
  
   def update
    @book = Book.find(params[:id])
    @book.update(book_params)

    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else

      render :edit
    end
   end
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
