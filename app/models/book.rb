class Book < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :trades, dependent: :destroy
    belongs_to :user
    scope :listed, -> {where(status: true)}

    validates :title, presence: true 

    validates :author, presence: true
                    
end
