class QuestionnairesController < ApplicationController
  before_action :authorized
  before_action :set_questionnaire, only: %i[ show edit update destroy ]
  # GET /questionnaires or /questionnaires.json
  def index
    @questionnaires = current_user.questionnaires
  end

  # GET /questionnaires/1 or /questionnaires/1.json
  def show
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
    questions = @questionnaire.questions.new
  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires or /questionnaires.json
  def create
    @questionnaire = current_user.questionnaires.build(questionnaire_params)

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to questionnaire_url(@questionnaire), notice: t("questionnaire.created") }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1 or /questionnaires/1.json
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to questionnaire_url(@questionnaire), notice: t("questionnaire.updated") }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1 or /questionnaires/1.json
  def destroy
    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: t("questionnaire.destroyed") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questionnaire_params
      params.require(:questionnaire).permit(
        :name,
        questions_attributes: [
          :_destroy,
          :id,
          :question_type,
          :name,
          answers_attributes: [:_destroy, :id, :name]
        ]
      )
    end
end
