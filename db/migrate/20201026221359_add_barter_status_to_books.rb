class AddBarterStatusToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :barter_status, :boolean
  end
end
