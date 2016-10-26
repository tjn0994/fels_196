class Admin::LessonsController < ApplicationController
  before_action :load_lesson, only: [:edit, :update, :destroy, :show]

  def index
    @lessons = Lesson.paginate(page: params[:page])
      .order_date_desc.per_page(Settings.per_page.lesson)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = t "create_success"
      redirect_to admin_lessons_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = t "update_success"
      redirect_to admin_lessons_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @lesson.destroy
      flash[:success] = t "delete_success"
    else
      flash[:warning] = t "delete_fail"
    end
    redirect_to admin_lessons_path
  end

  private
    def lesson_params
      params.require(:lesson).permit :name, :course_id, :image
    end

    def load_lesson
      @lesson = Lesson.find_by_id params[:id]
      if @lesson.nil?
        flash[:warning] = t "id_not_exist"
        redirect_to admin_lessons_path
      end
    end
end
