class ChangeContactName < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :contact, :permanent_contact
  end
end
