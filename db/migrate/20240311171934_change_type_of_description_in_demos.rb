class ChangeTypeOfDescriptionInDemos < ActiveRecord::Migration[7.1]
  def change
    def up
      change_column :demos, :description, :text
    end

    def down
      change_column :demos, :description, :string
    end
  #   reversible do |dir| 
  #     dir.up do
  #       change_column :demos, :description, :text
  #     end
  #     dir.down do
  #       change_column :demos, :description, :string
  #     end
  #   end
  end
end
