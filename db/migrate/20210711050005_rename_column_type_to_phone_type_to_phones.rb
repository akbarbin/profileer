class RenameColumnTypeToPhoneTypeToPhones < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :phones, :type, :phone_type
  end

  def self.down
    rename_column :phones, :phone_type, :type
  end
end
