class AddAttrToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :age, :integer
    add_column :students, :contact, :integer
  end
end
