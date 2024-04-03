class Admin::CoursesController < AdminController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    @q = Course.ransack(params[:q])
    @courses = @q.result(distinct: true).page(params[:page])
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)
    
    if @course.save
      redirect_to admin_course_path(@course), notice: 'Course has been succesfully created'
    else
      render :new, status: 422
    end
  
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    if @course.update(course_params)
      redirect_to admin_course_path(@course), notice: 'Course has been updated succesfully'
    else
      render :edit, status: 422
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy
    redirect_to admin_students_path, notice: 'Course has been delted successfully'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :description, :content)
    end
end
