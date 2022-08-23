class QuestionsController < ApplicationController
  before_action :find_question, only: :show

  def index
    @questions = @test.questions
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end
end
