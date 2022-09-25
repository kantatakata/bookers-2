class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :current_user,only: [:edit, :update, :destroy]
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
    @user = @book.user
    @new_book = Book.new
   end


   def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
            render "edit"
    else
       redirect_to user_path(current_user)
    end
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

   def destroy
    @book = Book.find(params[:id])
    @book.destroy
     redirect_to '/books'
   end
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

 def currect_user
  @book = Book.find(params[:id])
  unless @book.user == current_user
       redirect_to user_path(current_user)
  end
 end
end
