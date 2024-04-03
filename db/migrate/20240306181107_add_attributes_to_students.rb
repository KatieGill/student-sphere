class AddAttributesToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :address, :string
    add_column :students, :dob, :string
  end
end
