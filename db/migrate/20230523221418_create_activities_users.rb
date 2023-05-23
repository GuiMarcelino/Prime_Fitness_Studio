class CreateActivitiesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :activities_users do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
