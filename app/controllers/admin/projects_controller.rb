class Admin::ProjectsController < AdminController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).page(params[:page])
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    if @project.save
     redirect_to admin_project_path(@project), notice: "Project was successfully created."
      
    else
      render :new, status: 422
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    if @project.update(project_params)
      redirect_to admin_project_path(@project), notice: "Project was successfully updated."
    else
      render :edit, status: 422
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!
    redirect_to admin_projects_path, notice: "Project was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
