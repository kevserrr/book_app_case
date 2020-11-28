class CategoriesController < ApplicationController

  def index
  end

  def show
    @category = Category.find(params[:id])
  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def edit
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
