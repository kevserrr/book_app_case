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
    end

    def edit  
    end

    def create
        @book = current_user.books.new(book_params)
       
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
        if @book.update(book_params)
          redirect_to dashboard_index_url
        else
          render 'edit'
        end
      end
       
      private
        def book_params
          params.require(:book).permit(:title, :author, :page_count, :status, :barter_status)
        end

        def set_book
          @book = Book.find(params[:id])
        end
end
