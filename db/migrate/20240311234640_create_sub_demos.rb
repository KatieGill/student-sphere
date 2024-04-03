class CreateSubDemos < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_demos do |t|
      t.string :title
      t.references :demo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
