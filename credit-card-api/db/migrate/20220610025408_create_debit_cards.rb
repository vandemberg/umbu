class CreateDebitCards < ActiveRecord::Migration[7.0]
  def change
    create_table :debit_cards do |t|
      t.string :serial_number
      t.string :security_number
      t.date :expire_in
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
