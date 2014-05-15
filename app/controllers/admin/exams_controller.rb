class Admin::ExamsController < ApplicationController
  before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @exams = Exam.all.paginate page: params[:page], per_page: 15
  end

  def show
    @exam = Exam.find params[:id]
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new exam_params
    if @exam.save
      flash[:success] = "Create success!"
    else
      flash[:error] = "Create error!"
    end
    render "show"
  end

  def edit
    @exam = Exam.find params[:id]
  end

  def update
    @exam = Exam.find params[:id]
    if @exam.update_attributes exam_params
      flash[:success] = "Update success!"
    else
      flash[:error] = "Update error!"
    end
    render "show"
  end

  def destroy
    exam = Exam.find params[:id]
    exam.destroy
    flash[:success] = "Destroy success!"
    redirect_to admin_exams_url
  end

  private

    def exam_params
      params.require(:exam).permit(:subject_id, :name, :total_question, :time_limit)
    end

    def load_object
      @exam = Exam.find params[:id]
    end
end
