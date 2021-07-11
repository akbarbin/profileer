class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
