class Admin::SubjectsController < ApplicationController
  
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find params[:id]
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Create Successful!"
      redirect_to @subject
    else
      flash[:faild] = "fail"
      render 'new'
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = "Successful! Subject updated."
      render "show"
    else
      flash[:faild] = "Edit faild"
      render 'edit'
    end
  end

  def destroy
    subject= Subject.find(params[:id]).destroy
    flash[:success] = "Subject deleted."
    redirect_to admin_subjects_url
  end
  
  private
    def subject_params
      params.require(:subject).permit(:name, :description)
    end
end
