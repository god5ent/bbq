class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :user_name
      t.string :user_email
      t.references :event, index: true, foreign_key: true, null: true
      t.references :user, index: true, foreign_key: true, null: true

      t.timestamps null: false

    end
  end
end
