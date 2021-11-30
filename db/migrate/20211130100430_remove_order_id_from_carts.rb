class RemoveOrderIdFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :order_id, :integer
  end
end
