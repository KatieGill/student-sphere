# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

student = Student.create(
  first_name: 'Katie',
  last_name: 'Gill',
  email: 'katie@gmail.com',
  permanent_address: '123 Main St.',
  dob: '2/12/89'
)

20.times do |i|
  puts "Creating student #{i+1}"
  Student.create(
  first_name: "Student #{i+1}",
  last_name: "Lname #{i+1}",
  email: "student#{i+1}@gmail.com",
  permanent_address: '123 Main St.',
  dob: '2/12/89'
  ) 
end

Student.all.each do |student| 
  student.blogs.create(title: "Dummy Blog for Student #{student.id}", content: "Custom content pending")
  student.blogs.create(title: "Dummy Blog for Student #{student.id}", content: "Custom content pending")
end

Course.create(name: 'Ruby on Rails bootcamp', description: 'Pending')
Course.create(name: 'ReactJs bootcamp', description: 'Pending')
Course.create(name: 'Angular Js bootcamp', description: 'Pending')
Course.create(name: 'NodeJs bootcamp', description: 'Pending')
Course.create(name: 'Java bootcamp', description: 'Pending')
Course.create(name: 'Python bootcamp', description: 'Pending')