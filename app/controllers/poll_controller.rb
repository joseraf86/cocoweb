class PollController < ApplicationController


  # GET /poll/new
  # View template already defined
  # def new; end

  # POST /poll/create
  def create
    flash[:notice] = 'Gracias por llenar la encuesta voluntaria. Ahora puede llevarse su bolsa CLAP, solamente si ingresó su nombre, correo electrónico y número de teléfono'
    ## TODO: create a new Poll record
    redirect_to poll_new_path
  end

  private
  # Only allow a list of trusted parameters through.
  def poll_params
    params.permit(:name, :email, :phone, :select, :radio, :checkbox1, :checkbox2, :checkbox3, :open_question)
  end
end
