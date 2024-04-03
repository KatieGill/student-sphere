class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_attributes(auth_object = nil)
    # ["alternate_contact_number", "created_at", "date_of_birth", "email", "first_name", "id", "id_value", "last_name", "local_address", "permanent_address", "permanent_contact", "updated_at"]
    super
  end

  def self.ransackable_associations(auth_object = nil)
    ["blogs", "courses", "projects", "student_projects"]
  end
end
