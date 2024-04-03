class Blog < ApplicationRecord
paginates_per 10
belongs_to :student
has_rich_text :content
end
