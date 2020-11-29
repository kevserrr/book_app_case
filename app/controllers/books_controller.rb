class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
    
  def index
    @book = Book.where(status: true)
  end

  def show
    @comments = @book.comments  
  end

  def new  
    @book = current_user.books.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def edit  
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @book = current_user.books.new(book_params)
    @book.category_id = params[:category_id]
       
    if @book.save
      redirect_to dashboard_index_url
    else
      render 'new'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to dashboard_index_url
  end

  def update
    @book.category_id = params[:category_id]
    if @book.update(book_params)
      redirect_to dashboard_index_url
    else
      render 'edit'
    end
  end
       
  private

  def book_params
    params.require(:book).permit(:title, :author, :page_count, :status, :barter_status, :category_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
