class SubjectsController < ApplicationController
  before_action :verify_logged_in

  def index
    @subjects = Subject.all

    render :index
  end

  def show
    @subject = Subject.find(params[:id])
    @flashcards = @subject.flashcards

    render :show
  end

  def new
    @subject = Subject.new

    render :new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.author_id = current_user.id

    if @subject.save
      flash[:notice] = "Success!"

      redirect_to user_subject_url(@subject)
    else
      flash[:errors] = @subject.errors.full_messages

      render :new
    end
  end

  def edit
    @subject = Subject.find(params[:id])

    render :edit
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      flash[:notice] = "Success!"

      redirect_to user_subject_url(@subject)
    else
      flash[:errors] = @subject.errors.full_messages

      render :new
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy!

    redirect_to subjects_url
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end
