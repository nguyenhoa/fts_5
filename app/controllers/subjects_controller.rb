class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find params[:id]
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :description, :total_question, :time_limit)
    end
end
