class Comment < ApplicationRecord
  belongs_to :book, dependent: :delete
  belongs_to :user
  scope :approved, -> { where(accept: true)}
end
