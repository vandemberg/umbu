class CreateStoreKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :store_keys do |t|
      t.string :key

      t.timestamps
    end
  end
end
