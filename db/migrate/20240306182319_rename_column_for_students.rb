class RenameColumnForStudents < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :address, :permanent_address
  end
end
