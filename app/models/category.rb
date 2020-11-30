class Category < ApplicationRecord
  has_many :books
   
  validates :name, :presence => true
  validates :name, :uniqueness => { :message => "already registered" }

  def category_params
    params.require(:category).permit(:name)
  end

end
