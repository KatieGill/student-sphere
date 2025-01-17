class Student < ApplicationRecord
  paginates_per 10
  has_one_attached :profile_image
  has_many :blogs
  has_many :courses_students
  has_many :courses, through: :courses_students
  has_many :student_projects
  has_many :projects, through: :student_projects

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 50 }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only letters are allowed" }
  # validates :age, presence: true, numericality: true

  validate :validate_student_age

  after_create :display_student_age

  def display_student_age
    if self.date_of_birth.present?
      age = Date.today.year - self.date_of_birth.year
      puts "=====Age of the student is #{age}====="
    else
      puts "=====Age can not be calculated without date_of_birth====="
    end
  end

  def validate_student_age
    if self.date_of_birth.present?
      age = Date.today.year - self.date_of_birth.year
      if age < 15
        errors.add(:age, 'please provide a valid date of birth. Age must be greater than 15.')
      end
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    if date_of_birth.present?
      Date.today.year - date_of_birth.year
    else
      nil
    end
  end

  def name_with_email
    "#{full_name} / #{email}"
  end

end
