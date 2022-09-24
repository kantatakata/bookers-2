class UsersController < ApplicationController
  
  def index
   @users = User.all
   @user = current_user
   @book = Book.new
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
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
   
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
     @books = Book.all
     render :index
    end
   
  end

  def edit
   @user = User.find(params[:id])
    if @book.user == current_user
            render "edit"
    else
       redirect_to user_path(currect_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    
    if @book.save
      redirect_to user_path(@user.id), notice: 'Book was successfully created.'
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
