class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    return Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created !"
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated !"
      redirect_to "/books/#{@book.id}"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully Destroyed !"
      redirect_to "/books"
    else
      flash.now[:alert] = "error! Book survived."
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
