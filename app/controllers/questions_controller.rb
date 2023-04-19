class QuestionsController < ApplicationController
  before_action :authorized
  before_action :set_question, only: %i[ show edit update destroy ]
  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
   end

  # GET /questions/1/edit
  def edit
  end

  # GET /questions/:id/answer
  def answer
      redirect_to root_url
  end

  # POST /questions or /questions.json
  def create
    @question = current_user.questions.build(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_url(@question), notice: t("question.created") }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to questions_url(@question), notice: t("question.updated") }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: t("question.destroyed") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(
          :question_type,
          :name,
          answers_attributes: [:_destroy, :id, :name]
      )
    end

     # Only allow a list of trusted parameters through.
     def answer_params
      params.require(:question).permit(
          :question_type,
          :name,
          answers_attributes: [:_destroy, :id, :name]
      )
    end
end
