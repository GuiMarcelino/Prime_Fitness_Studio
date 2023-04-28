class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :city, null: false
      t.string :country, null: false
      t.string :neighborhood, null: false
      t.string :street, null: false
      t.string :state, null: false
      t.integer :number, null: false

      t.timestamps
    end
  end
end
