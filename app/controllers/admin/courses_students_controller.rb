class Admin::CoursesStudentsController < AdminController
  before_action :set_course

  def new
    @courses_student = @course.courses_students.new
  end

  def create
    @courses_student = @course.courses_students.new(courses_student_params)
    if @courses_student.save 
      redirect_to admin_course_path(@course), notice: "Student was successfully registered"
    else
      render :new, status: 422
    end
  end
  
  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def courses_student_params
    params.require(:courses_student).permit(:student_id)
  end
end