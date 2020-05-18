class PollController < ApplicationController

  # GET /poll/new
  ##TODO: Utilizar elos helpers del form_with
  ##TODO crear partial de errores e internacionalizar plural de errores
  def new
    @poll = Poll.new
  end

  # POST /poll/create
  def create
    @poll = Poll.new(format_params)
    if @poll.save
      redirect_to poll_index_url, notice: t('success_survey')
    else
      render :new
    end
  end

  # GET /poll/index
  ##TODO: Craer una pagina especifica que muestre los resultados
  def index
   @results = Poll.results
  end

  private

  def format_params
    Poll.format_params(permit_poll_params)
  end

  # Only allow a list of trusted parameters through.
  def permit_poll_params
    params.permit(:name,
                  :email,
                  :phone,
                  :select,
                  :radio,
                  :checkbox1,
                  :checkbox2,
                  :checkbox3,
                  :open_question)
  end
end
