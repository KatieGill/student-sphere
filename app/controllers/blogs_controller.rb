class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.includes(:student)
    # @blogs = Blog.includes(:student).references(:student).where('students.first_name = ?', 'Katie')
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'Blog as been created successfully'
      else
        render :new, status: 422
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: 'Blog has been updated successfully'
    else
      render :edit, status: 422
    end
  end
  
  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy!
    redirect_to blogs_path, notice: 'Blog has been deleted successfully'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content, :student_id)
    end
end
