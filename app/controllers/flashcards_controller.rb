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

    if @flashcard.save
      flash[:notice] = "Success!"

      redirect_to user_flashcard_url(@flashcard)
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

      redirect_to user_flashcard_url(@flashcard)
    else
      flash[:errors] = @flashcard.errors.full_messages

      render :new
    end
  end

  def destroy
    @flashcard = Flashcard.find(params[:id])
    @flashcard.destroy!

    redirect_to flashcards_url
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:question, :answer, :author_id)
  end

end
