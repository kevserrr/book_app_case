class DashboardController < ApplicationController
  def index
   @books = current_user.books.includes(:comments)  
   @trades = Trade.where(book_id: @books.each {|book| book.id})   
   @trades_book = Trade.where(book_id: @books.each {|book| book.id}, trade_status:0 )
   @my_trade = Trade.where(user_id: current_user.id)
  end

  private
  def comment_params
    params.require(:trade).permit(:user_id, :suggestion_book_id, :book_id)
  end
end
