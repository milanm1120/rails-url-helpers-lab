class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @active = set_student.active ? "active" : "inactive"
  end

  def activate
    set_student.toggle!(:active)
    redirect_to student_path
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end