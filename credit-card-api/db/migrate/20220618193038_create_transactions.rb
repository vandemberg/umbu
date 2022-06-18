class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :origin
      t.string :uuid
      t.bigint :sponsor_id
      t.string :sponsor_type
      t.bigint :beneficiary_id
      t.string :beneficiary_type
      t.bigint :value
      t.string :agent

      t.timestamps
    end
  end
end
