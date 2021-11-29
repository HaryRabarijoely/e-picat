class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end
