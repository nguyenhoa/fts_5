class Admin::QuestionsController < ApplicationController
  def index 
    if params[:subject_id]
      subject = Subject.find params[:subject_id] 
      @questions = subject.questions.paginate page: params[:page]
    else
      @questions = Question.paginate page: params[:page]
    end
  end

  def show
    @question = Question.find params[:id]
  end

  def new
    @question = Question.new
    4.times { @question.options.build }
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = "Create Successful!"
      render 'show'
    else
      flash[:faild] = "fail"
      render 'new'
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      flash[:success] = "Successful! Question updated."
      render 'show'
    else
      flash[:faild] = "Edit faild"
      render 'edit'
    end
  end

  def destroy
    question = Question.find params[:id]
    question.destroy
    flash[:success] = "Question deleted."
    redirect_to admin_questions_url
  end

  private
    def question_params
      params.require(:question).permit(:content, :subject_id, options_attributes: [:answer, :correct])
    end
end
