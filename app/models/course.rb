class Course < ApplicationRecord
  paginates_per 10
  include Validatable
  has_many :courses_students
  has_many :students, through: :courses_students
  has_rich_text :content
end
