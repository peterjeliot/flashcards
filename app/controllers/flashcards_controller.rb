class FlashcardsController < ApplicationController
  before_action :verify_logged_in

  def index
    @flashcards = Flashcard.all

    render :index
  end

  def show
    @flashcard = Flashcard.find(params[:id])

    render :show
  end

  def new
    @flashcard = Flashcard.new

    render :new
  end

  def create
    @flashcard = Flashcard.new(flashcard_params)
    @flashcard.author_id = current_user.id
    @flashcard.subject_id = params[:subject_id]

    if @flashcard.save
      flash[:notice] = "Success!"

      redirect_to user_subject_url(params[:subject_id])
    else
      flash[:errors] = @flashcard.errors.full_messages

      render :new
    end
  end

  def edit
    @flashcard = Flashcard.find(params[:id])

    render :edit
  end

  def update
    @flashcard = Flashcard.find(params[:id])

    if @flashcard.update(flashcard_params)
      flash[:notice] = "Success!"

      redirect_to subject_url(params[:subject_id])
    else
      flash[:errors] = @flashcard.errors.full_messages

      render :new
    end
  end

  def destroy
    @flashcard = Flashcard.find(params[:id])
    @flashcard.destroy!

    # respond_to do |format|
    #   format.html { subject_url(params[:subject_id]) }
    #   format.js   { render :nothing => true }
    # end
    redirect_to subject_url(params[:subject_id])
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:question, :answer,
                                      :author_id, :subject_id)
  end

end
