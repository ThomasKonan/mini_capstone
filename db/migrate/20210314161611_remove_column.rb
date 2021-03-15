class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :quantity, :integer
    remove_column :orders, :product_id, :integer
  end
end
