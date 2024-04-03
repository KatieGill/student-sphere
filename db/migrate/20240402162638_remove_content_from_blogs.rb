class RemoveContentFromBlogs < ActiveRecord::Migration[7.1]
  def change
    remove_column :blogs, :content, :text
  end
end
