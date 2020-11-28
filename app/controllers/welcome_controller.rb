class WelcomeController < ApplicationController
  def index
    @books = Book.where('status')     
  end 
end
