class AddAttToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :local_address, :string
    add_column :students, :alternate_contact_number, :integer
  end
end
