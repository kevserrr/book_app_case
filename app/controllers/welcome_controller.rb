class WelcomeController < ApplicationController
  def index
    @books = Book.where('status') 
    @category = Category.all.order('name ASC')
  end 
end
