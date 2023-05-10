class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :paid, null: false

      t.timestamps
    end
  end
end
