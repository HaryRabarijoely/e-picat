class CreateCartsAndItems < ActiveRecord::Migration[5.2]
  def change
    create_table :carts_items do |t|
      t.belongs_to :cart
      t.belongs_to :item
    end
  end
end
