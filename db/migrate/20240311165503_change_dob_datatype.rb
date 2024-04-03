class ChangeDobDatatype < ActiveRecord::Migration[7.1]
  def change
    change_column :students, :date_of_birth, :date
  end
end
