class AddPriceToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :price, :decimal, precision: 6, scale: 2, default: 0
  end
end
