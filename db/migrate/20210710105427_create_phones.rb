class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.bigint :number
      t.boolean :status, null: false, default: false
      t.jsonb :format
      t.jsonb :country
      t.string :location
      t.string :type
      t.string :carrier

      t.timestamps
    end
  end
end
