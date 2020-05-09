class PollController < ApplicationController


  # GET /poll/new
  # View template already defined
  # def new; end

  # POST /poll/create
  def create
    Poll.create(format_params)
    flash[:notice] = I18n.t 'success_survey'
    redirect_to poll_new_path
  end

  private

  def format_params
    Poll.format_params(permit_poll_params)
  end

  # Only allow a list of trusted parameters through.
  def permit_poll_params
    params.permit(:name, :email, :phone, :select, :radio, :checkbox1, :checkbox2, :checkbox3, :open_question)
  end
end
