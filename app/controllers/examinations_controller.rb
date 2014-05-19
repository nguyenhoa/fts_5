class ExaminationsController < ApplicationController
  before_action :signed_in_user

  def index
    @examinations = Examination.paginate page: params[:page]
  end

  def show
    @examination = Examination.find params[:id]
    @answer_sheets = @examination.answer_sheets
  end

  def new
    @examination = Examination.new(subject_id: params[:subject_id], sum_correct: 0, user_id: current_user.id)
    if @examination.save
      questions = Question.generate_random_question @examination.subject_id, 
      @examination.subject.total_question
      questions.each do |question|
        AnswerSheet.create(examination_id: @examination.id, question_id: question.id)
      end
      redirect_to edit_examination_path(@examination)
    end
  end

  def edit
    @examination = Examination.find params[:id]
    @answer_sheets = @examination.answer_sheets
  end

  def update
    @examination = Examination.find params[:id]
    answer_sheets = @examination.answer_sheets
    params[:question_ids].each do |question_id, option_id|
      answer_sheets.each do |answer_sheet|
        if answer_sheet.question_id == question_id.to_i
          answer_sheet.update_attributes option_id: option_id
          if answer_sheet.option.correct
            @examination.update_attributes sum_correct: @examination.sum_correct + 1
          end
        end
      end
    end
    render "show"
  end

  private
    def examination_params
      params.require(:examination).permit(:subject_id, :user_id, :sum_correct, answer_sheets_attributes: [:examination_id, :question_id, :option_id])
    end
end
