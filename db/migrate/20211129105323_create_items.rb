class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.timestamps
    end
  end
end
