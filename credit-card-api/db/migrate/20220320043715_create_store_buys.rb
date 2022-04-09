class CreateStoreBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :store_buys do |t|
      t.integer :price
      t.string :store

      t.timestamps
    end
  end
end
