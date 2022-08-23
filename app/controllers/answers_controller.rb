class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: :show

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
