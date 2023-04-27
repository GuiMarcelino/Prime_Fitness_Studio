class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false, limit: 255
      t.string :gender, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
