class Admin::StudentsController < AdminController
    include ApplicationHelper
    before_action :set_student, only: %i[show edit update destroy]
    helper_method :formatted_date
    
    def index
      @q = Student.ransack(params[:q])
      @students = @q.result(distinct: true).page(params[:page])
    end
  
    def new
      @student = Student.new
    end
  
    def create
      @student = Student.new(student_params)
      if @student.save
        CrudNotificationMailer.create_notification(@student).deliver_now
        redirect_to admin_students_path, notice: 'Student has been created successfully'
      else
        render :new, status: 422
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @student.update(student_params)
        CrudNotificationMailer.update_notification(@student).deliver_now
        redirect_to admin_student_path(@student), notice: 'Student has been updated successfully'
      else
        render :edit, status: 422
      end
    end
  
    def destroy
      CrudNotificationMailer.delete_notification(@student).deliver_now
      @student.destroy
      redirect_to admin_students_path, notice: 'Student has been deleted successfully'
    end
  
    def test
    end
  
    private
  
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :permanent_address, :local_address, :date_of_birth, :permanent_contact, :alternate_contact_number, :profile_image)
    end
    
    def set_student
      @student = Student.find(params[:id])
    end
  
    def formatted_date(date)
      date.strftime('%A, %b %d, %Y') if date.present?
    end
end
